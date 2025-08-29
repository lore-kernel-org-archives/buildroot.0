Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F52CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1574C840A1;
	Fri, 29 Aug 2025 15:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTFHJuzYBwpu; Fri, 29 Aug 2025 15:35:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B14484201
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B14484201;
	Fri, 29 Aug 2025 15:35:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DF8169
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EC5384200
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVKonJmA-LiW for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:35:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C0A5D840A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0A5D840A1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0A5D840A1
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:35:31 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1577194254; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 15:35:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1us18T-00Ci4s-1m;
 Fri, 29 Aug 2025 17:35:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250829065210.570613-1-thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 17:35:29 +0200
In-Reply-To: <20250829065210.570613-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Fri, 29 Aug 2025 08:52:09
 +0200")
Message-ID: <878qj2i1j2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=aI/g9rSaUVKddB1rOT2pIKqqktHOUBHAy28vc+DBM7v4wtq5YMuzUiQCUIWRBr1UozUPacpLeokDRo16jHQbuzuJMYugwdidVJ1wPYf7HfOYvgv8+sJWKawU+JVYyELgUlWDw8R9kM4CxrNbJeEhRuBIlbeRv/FNhwFVOXV85BMrjBesLveQwBPq71hiQhU/96NWFKsAKNQeV8UeD+V00echi/xSQYKoYhiHS0Y0dEjpcDwi6kuGLzmbaHak04E7VS5PCzqMq6LU8B29f2OfBuvSSn+zQNsuvdEijCYdRRZcKPWGpQy1PcnJXHjZ5OYKC2ZArirmqLp3rV9rFV8U0A==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Wy5lQRQwelqpZ5/x8cDmadL07NOYHhfkTrIb3EQvk+o=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=aI/g9rSa
Subject: Re: [Buildroot] [PATCH] package/webrtc-audio-processing: fix build
 with GCC 15.x
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

 > A missing include causes a build failure with GCC 15.x. There are no
 > known autobuilder failures for this issue, but the following defconfig
 > allows to reproduce the issue:

 >  BR2_arm=y
 >  BR2_cortex_a9=y
 >  BR2_ARM_ENABLE_VFP=y
 >  BR2_TOOLCHAIN_EXTERNAL=y
 >  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 >  BR2_INIT_NONE=y
 >  BR2_SYSTEM_BIN_SH_NONE=y
 >  # BR2_PACKAGE_BUSYBOX is not set
 >  BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING=y
 >  # BR2_TARGET_ROOTFS_TAR is not set

 > The affected code has completely changed in newer versions of
 > webrtc-audio-processing, so we add a non-upstream patch, which can be
 > dropped once we upgrade to a newer release.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
