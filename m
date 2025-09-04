Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BAACA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9274F4035E;
	Thu,  4 Sep 2025 16:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ull2xj9xsPq; Thu,  4 Sep 2025 16:09:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAD834035F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAD834035F;
	Thu,  4 Sep 2025 16:09:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE2C9106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE4A680712
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l07aA9S_bXoB for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:09:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0BD280710
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0BD280710
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0BD280710
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:09:55 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2065305048; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 04 Sep 2025 16:09:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uuCX2-002heG-2I;
 Thu, 04 Sep 2025 18:09:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Romain Naour <romain.naour@gmail.com>
References: <20250829084753.1175658-1-thomas.petazzoni@bootlin.com>
Date: Thu, 04 Sep 2025 18:09:52 +0200
In-Reply-To: <20250829084753.1175658-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Fri, 29 Aug 2025 10:47:52
 +0200")
Message-ID: <87ldmui4hb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=FAipncUMpR/Yxw741R7gE0i+r/7tjps1u5fitTJDfyiBNtL4PMpXETpa/KZCWzQJlHKPofMoroNkQ4Ao6qOZRMzOJvGTA+v+JK0aVoMoTx/ITZ04rFnl7pcQKSsscI3J0zMR83bfuVyg3qURj38g4gAn5cmG+/BJWz9vYz3PdffCkEEv0xEZG0qYxBTsbK1w5Xz0SXZhErHgCoN8L8slg0JfZoPUudiNyebp2G2bTqvsFwh9CxtxQyka8IeCo0gMKYkCyIDhpVPPi4gmpgsqd5lCvGzU+InamPHrZrtS+peZoDmKzZW2YFOom+LsDdsQ6BWurbQO9lcBBTlCImZZEg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=4OzJBVI5m+He4JVLnKQrlAdRNjGMzGSnp6tY92zXC08=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=FAipncUM
Subject: Re: [Buildroot] [PATCH] package/openal: bump to 1.24.3 to fix GCC
 15.x build issues
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > openal 1.22.0 does not build with GCC 15.x, but the backport of the
 > fixes to 1.22.0 turns out to be too complicated, so let's bump to
 > 1.24.3 instead.

 > Since 1.24.3 uses C++17, and after testing with GCC 7.x, then GCC 8.x
 > then GCC 9.x, we found out that GCC 9.x at least is
 > necessary. Therefore, reverse dependencies are updated accordingly.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

It is a bit unfortunate that we cannot fix it in a simpler/smaller way,
but oh well - Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
