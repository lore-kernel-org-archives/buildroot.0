Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2059FC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE6F6612D0;
	Tue,  6 Feb 2024 16:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE6F6612D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZlNXZU-wF7zi; Tue,  6 Feb 2024 16:38:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06A18612B7;
	Tue,  6 Feb 2024 16:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06A18612B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E4151BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52380612A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52380612A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SjgBZCl5GrjM for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:38:05 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B13E611C5
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B13E611C5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B814E0007;
 Tue,  6 Feb 2024 16:38:02 +0000 (UTC)
Date: Tue, 6 Feb 2024 17:38:01 +0100
To: Marleen Vos via buildroot <buildroot@buildroot.org>
Message-ID: <20240206173801.02d805c1@windsurf>
In-Reply-To: <20231219121508.1695768-5-marleen.vos@mind.be>
References: <20231219121508.1695768-1-marleen.vos@mind.be>
 <20231219121508.1695768-5-marleen.vos@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707237482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orf2C86cB+JmSHpS8LNsnGhyNXqS7riL3kXMIOo9qes=;
 b=G+E4J0cbXxiWQ9suIsnetF12RlDFtcFcwNAx1zm/DhLdvWPl3jJez1Bg/X+crAyYYNP9S4
 F0e6SG5n+uRt5I0D+55zmwx53ZNfBPWCwdNl+MQqbiBinbRrel1ZheG4zEQf4tp4BC692K
 9HiokNEAccLYETSJtXM2IKS+oPAH6zNfX+YQX4BUmw3EK7V08LM0CaNEeoKpbh40iI0r/Y
 L9i/G7Ss5DtZYPC/3khxrUUHLNBJkLGvKOCn74/PH9UyhNO4ifk4ZsaGNcJHn9Z8X7gHt4
 0qYtGokj2YD69F7JScaLIMCLJ8iF3BmDdL41wvxhImoJwV05ct1gSg903WZYpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G+E4J0cb
Subject: Re: [Buildroot] [PATCH 4/7] boot/arm-trusted-firmware: add config
 option to use latest lts-v2.8.13
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
Cc: Marleen Vos <marleen.vos@mind.be>, marleen.vos@essensium.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marleen,

On Tue, 19 Dec 2023 13:15:05 +0100
Marleen Vos via buildroot <buildroot@buildroot.org> wrote:

> From: Marleen Vos <marleen.vos@mind.be>
> 
> Patch 0001-feat-build-add-support-for-new-binutils-versions.patch as
> found in v2.8 patch dir has already been applied in lts-v2.8.13
> Patch 0002-build-tools-avoid-unnecessary-link.patch from v2.8 has
> been included as 0001-build-tools-avoid-unnecessary-link.patch for
> lts-v2.8.13
> 
> Signed-off-by: Marleen Vos <marleen.vos@mind.be>

Thanks for the good arguments from Arnout, we got convinced and applied
your patch to master, with a few changes, see below.

> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_v2_8_VERSION

                                                     ^^^ we dropped the "v" from here

>  sha256  327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e  arm-trusted-firmware-v2.7.tar.gz
> +sha256  e55ae7105c996b60f748b2eb6adeaf5ac8946425e1d4294ecc1c56aebf435274  trusted-firmware-a-lts-v2.8.13.tar.gz

We were surprised by the files having different base names here. Turns
out the hash of trusted-firmware-a-lts-v2.8.13.tar.gz was in fact never
checked, which is why you didn't release that
trusted-firmware-a-lts-v2.8.13.tar.gz was an incorrect file name. So we
added a preliminary commit to make sure that this hash will be checked,
and fixed the file name.

See:

  https://gitlab.com/buildroot.org/buildroot/-/commit/c6ab9328e13c6c9a1538b4a33824525a990b623d
  https://gitlab.com/buildroot.org/buildroot/-/commit/2a310666e06c9c5edd6879d32295c63b7851c817

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
