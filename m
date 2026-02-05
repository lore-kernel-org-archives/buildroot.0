Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D4DE91286
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 07:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B14FB6079A;
	Thu,  5 Feb 2026 07:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOgbHQ-AaYzq; Thu,  5 Feb 2026 07:18:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E9F16081D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770275890;
	bh=7avt1UeZNCI/tFN0GCnywmODKPPA6QnnrYlk+hJXhxg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NQxQSOXdfhev/lbWgZ3i9TG7gjS1nMpLepSCyhmfkDrfp2EC2cNbpvNFG/uAvXlbr
	 4EOW54UieEEmPeyO7tYIb9VfzNM1qWpeXUgLOgEzHC1HoOMtkdnsUnG5mAzxx+2s9H
	 Qasw7uqQZWlVODOoooBUilVUlCfHmWTxc3PoClsaWlgQjcwAxjgrzepVm0wGcvnr7D
	 fP/KAcaeRfsQYJxSTKVAicm3essYFZaDxxZT+rGDkp+WJumQ2U21hTyq0176h+vk0n
	 7EdetlEw1ZDOjdLMlPCe/XoGLRLt6wz11ewxh/4PAgJojBiC2euQ5CxbHJorlSYEiP
	 5A0MFAIEZTbPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E9F16081D;
	Thu,  5 Feb 2026 07:18:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EDBF173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 07:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 040BC4080C
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 07:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLHbdIz3yG2z for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 07:18:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D4E9F40800
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4E9F40800
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4E9F40800
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 07:18:06 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -304309984; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 05 Feb 2026 07:18:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vntcm-0000000DXnF-3z2v;
 Thu, 05 Feb 2026 08:18:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>,  Julien Olivain <ju.o@free.fr>
In-Reply-To: <20260204173349.315559-1-romain.naour@smile.fr> (Romain Naour via
 buildroot's message of "Wed, 4 Feb 2026 18:33:49 +0100")
References: <20260204173349.315559-1-romain.naour@smile.fr>
Date: Thu, 05 Feb 2026 08:18:00 +0100
Message-ID: <87tsvvodzr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Bri/s/S5RlQYDgrkck7PiDl2gjak1HQr8/g/tm8+0xIxQHbcdQbGCAd7vDiMdCRNF50ovDRWX5cxG5UJqq598VVV4einuLUB90Wm8bI7mGQ4HKjQ4zvq7uekHLn1lBnB3Kk72V8BV0uttOCd71MF8iK8vg2S7cHrBDYNPhcWW+zPbUtALNGc5VnJ2wUEgCYWIRRKEAVuSbrYVRa2y+wi8vl4FAQhi8jQMukoug1zpMFov8SnXLp9/CTzCGofCe4tXHlTF2K8ttboH8mrYKcplYKxBRW7t5uAO+BRWa1HEiHblP++aiKVloTy1UwRQPLhnpIMBiTVtFxgvLN38aJHTg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=E2FkKD3irf81jAZjcbZnHSOkxsuOcsiIi6J04skQp5s=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Bri/s/S5
Subject: Re: [Buildroot] [PATCH] Revert "package/pkg-cmake.mk: add
 Platform/Buildroot-Initialize.cmake"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour via buildroot <buildroot@buildroot.org> writes:

 > Since commit [1] some cmake packages fail to build when cmake from the
 > host is used.

 >>>> openjpeg 2.5.4 Configuring

 > CMake Error at [...]/host/share/buildroot/Platform/Buildroot-Initialize.cmake:1 (include):
 >   include could not find requested file:

 >     Platform/Linux-Initialize
 > Call Stack (most recent call first):
 >   /usr/share/cmake-3.25/Modules/CMakeSystemSpecificInitialize.cmake:21 (include)
 >   CMakeLists.txt:20 (project)

 > This reverts commit [1] ef9f0a07ed40970a7de4c608a5708ef6ceb75131 for
 > the time being.

 > Cc: Julien Olivain <ju.o@free.fr>
 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

I have instead applied Julien's patch.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
