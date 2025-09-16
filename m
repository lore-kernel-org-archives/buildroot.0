Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE79CAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A15482EC7;
	Tue, 16 Sep 2025 20:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJoCVUN8gl4G; Tue, 16 Sep 2025 20:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6D6E82382
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6D6E82382;
	Tue, 16 Sep 2025 20:02:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BD29199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6612610FE
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id owBsRqLPzKmW for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:02:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE2B960FFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE2B960FFF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE2B960FFF
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:02:40 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1790757336; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 16 Sep 2025 20:02:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uybsr-0034xT-1J;
 Tue, 16 Sep 2025 22:02:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
References: <20250915185448.11118-1-ju.o@free.fr>
Date: Tue, 16 Sep 2025 22:02:37 +0200
In-Reply-To: <20250915185448.11118-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Mon, 15 Sep 2025 20:54:46 +0200")
Message-ID: <87qzw69ndu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=mo4wab2xh4dWHmZfSyEOFoO3F7T88H+E/PcPH5UcEy9naPnOKuB5xAJrBomLnkmkZZaCJNUfTE+BAm5yOfvoX1sW4p3qryK/y0Qqmq48/onronOLafwiQb3EcF6pxz/bq3uc0ypb7dZoM3Qu8ou0ExKepwH4rjgN2j74+CESwtYNnvt9zq9H2bTSps6MbxOKamXIBfz6LSUblSPGdXqXsg5F8jVPdx+ZDNatpinsasP9QoTekBxBb2fxf4YyjMEle27F0/0lMdvbZJ1GwytACBRXGge5kD+2eECsThCtZfHB5dIpU9ToiELFX1/3lPrT/bEK3He4GUChO5nmOvGavg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=4ifT5pWGriD8BllbgHZLY8K8KPlBU9IDFdm20VC5OD4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=mo4wab2x
Subject: Re: [Buildroot] [PATCH 1/3] boot/boot-wrapper-aarch64/Config.in:
 switch homepage URL to https
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > Buildroot commit [1] ("package: replace git:// URLs with https://
 > URLs where possible") switched _SITE URL from git to https, but did
 > not updated the package homepage in Config.in.

 > This commit updates it to match the package _SITE URL.

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/6626bf7c5fc1f5f47fcade03090de212a6121db3

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
