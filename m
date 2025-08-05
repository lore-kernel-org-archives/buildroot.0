Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8F1C87FCB
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 06:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D83983DEE;
	Tue,  5 Aug 2025 06:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dTOmyMUv6I-V; Tue,  5 Aug 2025 06:04:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 609D483DF0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 609D483DF0;
	Tue,  5 Aug 2025 06:04:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDAB0233
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 06:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF0AA83DEE
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 06:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgP8Yx6YUn8y for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 06:04:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51B6683DF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51B6683DF0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51B6683DF0
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 06:04:14 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1587047918; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 05 Aug 2025 06:04:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ujAmP-00BYuf-1e;
 Tue, 05 Aug 2025 08:04:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Hans-Heinrich Hansen <hhansen@avt-nbg.de>, buildroot@buildroot.org
References: <FR5P281MB50782986E33353F9AFF80C468723A@FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM>
 <87y0rzkkf7.fsf@dell.be.48ers.dk>
 <FR5P281MB5078D44083ABDE1AAC41FC828722A@FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM>
Date: Tue, 05 Aug 2025 08:04:09 +0200
In-Reply-To: <FR5P281MB5078D44083ABDE1AAC41FC828722A@FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM>
 (Hans-Heinrich Hansen's message of "Tue, 5 Aug 2025 04:53:39 +0000")
Message-ID: <87ms8ejodi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EmWEM6Y/321FTDg0zdccdVBUN4pL/bDJ8atetwPfVl0fWGBgmWJo2Rszsz0P1B1u125PilriQ90tO5afJteOTQPrTBlDGdWREgl8isqtQa8WfrryNTe733Sq+3Sdk3tShXEA7EpN8Rb5+hKWg2GZTKuTyJYLAvl5szGM1JXpSo938yy00TWUWeh25OiUT4RCd4X91+vja5vPGx3tgcIaDY1Se3zr9SHeT+PXdORdW9SId5rei24YPSQMfJEBhHZCIbbk8eDgBBbY925WtH8rBaDulDiEA/yDtxDAp1FbQv9SCtyJINOud5tkc+mjZUOtAkS3JTWJR/XPaaYtDnIcPQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=BOn0N+0KZAwXA9NknQarDXmikqKZfJgKwKeokH9b1Lg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=EmWEM6Y/
Subject: Re: [Buildroot] Buildroot with Advantech EIO-IS200-DRIVER
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

>>>>> "Hans-Heinrich" == Hans-Heinrich Hansen <hhansen@avt-nbg.de> writes:

Hello Hans,

Please keep Buildroot discussion on the mailing list, thanks.

 > Hi Peter,
 > my problem is indeed the "out-of-tree kernel module". Btw. I've tried
 > it with loadable module support enabled and disabled.

You will need to enable modules support in your kernel in order to build
and load external modules.

 > It seems that the eio-is200 is not used by the buildroot process.
 > I've followed the buildroot instructions. I'm sure that I've made a
 > mistake. Please can you check my attached configuraton files?

For reference, the custom package is:

################################################################################
#
# eio_is200_driver
#
################################################################################

EIO_IS200_DRIVER_VERSION = 082e737c59aa92bba2c29db46a06cdd0e5beb600
EIO_IS200_DRIVER_DEPENDENCIES = linux
EIO_IS200_DRIVER_SITE = $(call github,ADVANTECH-Corp,eio-is200-linux-kernel-driver,$(EIO_IS200_DRIVER_VERSION))
EIO_IS200_DRIVER_LICENSE = GPL-2.0
EIO_IS200_DRIVER_LICENSE_FILES = COPYING

$(eval $(kernel-module))
$(eval $(generic-package))

Which looks sensible to me (didn't check the details of the upstream
eio-is100-linux-kernel-driver Makefiles). Does it build some kernel
modules? What happens if you modprobe/insmod them?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
