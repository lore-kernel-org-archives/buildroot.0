Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB809C55175
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 15:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD775405B6;
	Sun,  2 Aug 2026 15:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LiBgiEhXAHTG; Sun,  2 Aug 2026 15:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E9C5405AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785684493;
	bh=+gA5w2aeKKhFbOaeVIs/Gm5Ho0vasilbqmd1AUga7dY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eOJtRfy01PYucLW/98kn3eZ8ybJ9XXQoIHeLMvtEKck3MgznN58OZ83xObHaVBrB4
	 rBrw8Pb/UJixuA78Afo66DfgVQiKiMg54gz7A+mhoRwPOIKzD2w7mSreKpy/UeyrUq
	 aTMpVs3W6DzSlxrGOQ+tEHMsQITAxTugNUZu6uaIeM3ku2mVVITgWAdWn/E1A6ybto
	 tb9IOHsyUDR7DUIi6LNhvJkMD0k7BFxhreMozQ0UjgS5pGX1JbH8zkzox+HqGRcX41
	 dBWyPI/y8DWtkcAl5bBRxGDOdbB8h5KJfB02WldYh7kLKnooRbRsghG16Bm2kYHUYh
	 4FGmUXpqETXKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E9C5405AD;
	Sun,  2 Aug 2026 15:28:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9747FE3
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 15:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB07180C9B
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 15:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZauXVKGIfDk for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 15:28:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8FF3D80C9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FF3D80C9A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FF3D80C9A
 for <buildroot@busybox.net>; Sun,  2 Aug 2026 15:28:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E285E2003CA;
 Sun,  2 Aug 2026 17:28:05 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Aug 2026 17:28:05 +0200
MIME-Version: 1.0
Date: Sun, 02 Aug 2026 17:28:05 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
In-Reply-To: <20260721093932.282565-5-francois.perrad.86@gmail.com>
References: <20260721093932.282565-1-francois.perrad.86@gmail.com>
 <20260721093932.282565-5-francois.perrad.86@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <5a38c59644b8e79fe2aa54580f94869f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785684487;
 bh=PX879D5RgDFU0zTM0YNkCFQp+LRDJJYcJo65wMmPJ0A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=knDI09pxWGsa7z1/RC7xEg8OAo1gNlpzGnY3kpkdX7CPc6keK+5MNWWGM7MbbzpeA
 /Z61OSkwmNDw5e8MgU33hvYnTmvl0J2ccGjPxLAwr3dougc/n+K5jzb8DOjqSqlt9n
 1sZaC5/ruGwXLRKh8w1/LMMLvMG2HE5HPyYMYoz5/GzXNZXjxBFCODIOjCtJKq1hxb
 tw/kS/XQZACZK4trxrgyYk+AfKut6YbJ1q5CLPCKx6xw76Wk90vkxAllHd28fR0PaA
 VkVuDDzTu80IHqRI41lgNZzSVZyEKgHgu+Z/5JrjkoszXDCCVrs0iYN/j+x1EpDQHB
 Fj4a+T8CiOjEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=knDI09px
Subject: Re: [Buildroot] [PATCH v3 4/8] package/hare: new host package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

Thanks for the update. I have few comments, see below.

On 21/07/2026 11:39, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
> ---
[...]
> diff --git a/package/hare/hare.mk b/package/hare/hare.mk
> new file mode 100644
> index 000000000..9a85d4c14
> --- /dev/null
> +++ b/package/hare/hare.mk
> @@ -0,0 +1,47 @@
> +################################################################################
> +#
> +# hare
> +#
> +################################################################################
> +
> +HARE_VERSION = 0.26.0.1
> +HARE_SITE = https://git.sr.ht/~sircmpwn/hare/archive
> +HARE_SOURCE = $(HARE_VERSION).tar.gz
> +HARE_LICENSE = MPL-2.0
> +HARE_LICENSE_FILES = COPYING
> +
> +HOST_HARE_DEPENDENCIES = host-harec host-qbe host-scdoc
> +
> +ifeq ($(BR2_aarch64),y)
> +HOST_HARE_TARGET_ARCH = AARCH64
> +else ifeq ($(BR2_RISCV_64),y)
> +HOST_HARE_TARGET_ARCH = RISCV64
> +else ifeq ($(BR2_x86_64),y)
> +HOST_HARE_TARGET_ARCH = X86_64
> +endif
> +
> +HOST_HARE_CONF_OPTS = \
> +	ARCH=$(HOSTARCH) \
> +	DESTDIR="$(HOST_DIR)" \
> +	PREFIX=/usr \
> +	HAREC="$(HOST_DIR)/usr/bin/harec" \
> +	QBE="$(HOST_DIR)/usr/bin/qbe" \
> +	SCDOC="$(HOST_DIR)/usr/bin/scdoc" \
> +	HAREPATH="$(HOST_DIR)/usr/src/hare/stdlib" \

Buildroot decided a long time ago to avoid installing
files in "$(HOST_DIR)/usr/". This is reported by the command:
utils/docker-run make check-package

package/hare/hare.mk:27: install files to $(HOST_DIR)/ instead of 
$(HOST_DIR)/usr/
...

So the previous variables should bechanged to:

        PREFIX=/ \
        HAREC="$(HOST_DIR)/bin/harec" \
        QBE="$(HOST_DIR)/bin/qbe" \
        SCDOC="$(HOST_DIR)/bin/scdoc" \
        HAREPATH="$(HOST_DIR)/src/hare/stdlib" \

Changing those variables will require to updates other packages
in this series. I'll send separate messages.

> +	$(HOST_HARE_TARGET_ARCH)_AS=$(TARGET_AS) \
> +	$(HOST_HARE_TARGET_ARCH)_CC=$(TARGET_CC) \
> +	$(HOST_HARE_TARGET_ARCH)_LD=$(TARGET_LD)
> +
> +define HOST_HARE_CONFIGURE_CMDS
> +	cp $(@D)/configs/linux.mk $(@D)/config.mk
> +endef
> +
> +define HOST_HARE_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_HARE_CONF_OPTS) all
> +endef
> +
> +define HOST_HARE_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_HARE_CONF_OPTS) install
> +endef
> +
> +$(eval $(host-generic-package))
> --
> 2.43.0

Could you send and updated series addressing those comments, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
