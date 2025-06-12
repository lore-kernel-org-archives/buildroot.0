Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F44C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49B13408D1;
	Thu, 12 Jun 2025 20:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhlOD7WQFkRM; Thu, 12 Jun 2025 20:01:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EAF64088A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EAF64088A;
	Thu, 12 Jun 2025 20:01:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 268CA1BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2351660D4E
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Vbt7jeAVr45 for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:01:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7467E60AC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7467E60AC8
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7467E60AC8
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:01:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A24BD1C00EF; Thu, 12 Jun 2025 22:01:44 +0200 (CEST)
Message-ID: <c0bd19f2-0870-4754-980d-dd43b319cc97@rnout.be>
Date: Thu, 12 Jun 2025 22:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
References: <20250517174019.3732498-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250517174019.3732498-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758504; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JgtSrtEDoNUOJDbKmtwb3OOx6rKGtE15rszRdYej/gI=;
 b=boMDa9g51K2MM60VnuMUftmmzVrniwPz8VuqbWecrFM8gtv1YITzgYeCnUXlBe1dUfYZZP
 kkG21mG0M/dRjZcqNO5aqxJ+jDbLwjcUcWYmRV36MNHndHx1+sceU1GySGHfFN9vPVytD/
 +SWK87OcDWR8AsskMiLwdnrT3pzlGzRCrKppSya1lv5OB180P9CMc1osIU6f0zjT8i2GdY
 u1lRiAPqjFI27/fEfPP1kc3FKlCKvGlibZKfsgS2sGwB9KmS0qzsSNBc7QglgKT5pt7cX/
 d8c69+HIHckMr5u8FnsgoRHxlAqec4tP7hxjqjCv1Djj0gr0uSmNnqVlZH8Q8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=boMDa9g5
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: fix systemd-boot
 installation
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/05/2025 19:40, James Hilliard wrote:
> When the meson build directory was changed to buildroot-build in
> 4e95062f820a64ecd2402115ee552dbcf2874f02 we forgot to update the
> install path for the systemd-boot efi binary.
> 
> Fixes:
> /usr/bin/install: cannot stat '/home/buildroot/buildroot/output/build/systemd-256.7/build/src/boot/efi/systemd-bootx64.efi': No such file or directory
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/systemd/systemd.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 337d52b1f2..71fe0de550 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -646,7 +646,7 @@ SYSTEMD_CONF_OPTS += -Dbootloader=enabled
>   
>   SYSTEMD_BOOT_EFI_ARCH = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH))
>   define SYSTEMD_INSTALL_BOOT_FILES
> -	$(INSTALL) -D -m 0644 $(@D)/build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_EFI_ARCH).efi \
> +	$(INSTALL) -D -m 0644 $(@D)/buildroot-build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_EFI_ARCH).efi \
>   		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(SYSTEMD_BOOT_EFI_ARCH).efi
>   	$(INSTALL) -D -m 0644 $(SYSTEMD_PKGDIR)/boot-files/loader.conf \
>   		$(BINARIES_DIR)/efi-part/loader/loader.conf

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
