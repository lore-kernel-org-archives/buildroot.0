Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB21BCA0FF7
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 10:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 682FE60FEE;
	Sat,  2 Sep 2023 10:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 682FE60FEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5iokec6xfH6J; Sat,  2 Sep 2023 10:03:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB3CA60EC4;
	Sat,  2 Sep 2023 10:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB3CA60EC4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52A961BF419
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 10:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39B0D60EC4
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 10:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39B0D60EC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHx1KudmVNKl for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 10:03:50 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15B7760BA6
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 10:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15B7760BA6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 599FB20003;
 Sat,  2 Sep 2023 10:03:47 +0000 (UTC)
Date: Sat, 2 Sep 2023 12:03:46 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230902120346.05fc9bce@windsurf>
In-Reply-To: <20230830195446.3958486-6-aduskett@gmail.com>
References: <20230830195446.3958486-1-aduskett@gmail.com>
 <20230830195446.3958486-6-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693649028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ie1LO7yqi+960siBNzHKOmCMJHnGcw0qjM5KkBpnrPI=;
 b=FEKIs0eCQF+9VnMHLLWLCyAFqSHoa/xc+txURumfkUVygOCk35FfKqtZ7L8ZkVkTEG4myN
 H1inZhfOaox7Kl6zYoz5BkM04gQZmK87U7FVSPfZTq7eCNQkmVftmpsaxF7h03wPPKF40G
 BjmoR/qIIJVbhFFXlWGQcZmvoJ/coG0vOTdyJj2e7IcdZQARNqRMVwQrwF6vaOScJQpQ2n
 bAcHE3KHnCBOBpslaxpTI/Ybzt/QrkzyBrPW95FtgvDdNlYWkpgMw68lZ5p7C4zwqvJHC8
 TIG9pi5wp7LTywagFrhCAXtMG2UvmBEvcUCdrc0jYi3SOF0vu8WazM+DDweCmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FEKIs0eC
Subject: Re: [Buildroot] [PATCH/next 6/7] package/qt5base: add vulkan option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, Samuel Martin <s.martin49@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 30 Aug 2023 13:54:45 -0600
Adam Duskett <aduskett@gmail.com> wrote:

> Notes:
>   - eglfs/vulkan is only implemented for eglfs_viv
>     (see stub implementation for QEglFSDeviceIntegration::createPlatformVulkanInstance()
>     in src/plugins/platforms/eglfs/api/qeglfsdeviceintegration.cpp and
>     real implementation for QEglFSVivIntegration::createPlatformVulkanInstance()
>     in src/plugins/platforms/eglfs/deviceintegration/eglfs_viv/qeglfsvivintegration.cpp)
>   - or for xcb (see QXcbIntegration::createPlatformVulkanInstance()
>     in src/plugins/platforms/xcb/qxcbintegration.cpp)
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/qt5/qt5base/Config.in  | 10 ++++++++++
>  package/qt5/qt5base/qt5base.mk |  7 +++++++
>  2 files changed, 17 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
