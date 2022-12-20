Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0761C4167B
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 05:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64FD7408D6;
	Tue, 20 Dec 2022 05:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64FD7408D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2eagErb96NQ; Tue, 20 Dec 2022 05:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D2E3408E6;
	Tue, 20 Dec 2022 05:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D2E3408E6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C878D1BF304
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 05:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A39718176A
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 05:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A39718176A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wSQM-cgI0EaH for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 05:36:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A458F81768
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A458F81768
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 05:36:15 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 580A244042A;
 Tue, 20 Dec 2022 07:33:00 +0200 (IST)
References: <20221219230802.2602798-1-f.fainelli@gmail.com>
User-agent: mu4e 1.8.10; emacs 28.2
To: Florian Fainelli <f.fainelli@gmail.com>
Date: Tue, 20 Dec 2022 07:30:55 +0200
In-reply-to: <20221219230802.2602798-1-f.fainelli@gmail.com>
Message-ID: <87y1r2k56c.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1671514380;
 bh=4LexH1FvEuaykHbxQOxpLEJzfAFbUK9fzXevtXwRqsU=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=SKmOIaw6JMqKQQK9SrfAhkcz1Vb7ktnotDX+lsAwmzf9oSnNsEK1tJHmOUSzba4bY
 JwebbX+cv41rsLC8h3pcTydnHJhRTNqrzySEytRdbXrbrWmBqYVdCYMMIv1SxrsCg1
 3L328G3t5bdSHYI7P1nmr0CCaKp6Wi96LjzJmEE8jkT2A0pxNEDctRse0zrL6apmd3
 v+aaBiXv4XobmKtWZ7Wfn/Qu8aUpRUj1fDtBGOL9kz3hgitfPdjGd1YRnRqSPR/gac
 za7Vexe5Ye1X9vuFk82sVOZW3Pt30LinsDxl9AKTx6XU8QUgIR1id5wVA5Ecvwqh1J
 SqqZ1F+WBqoVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=SKmOIaw6
Subject: Re: [Buildroot] [PATCH v2] package/libgpg-error: Disable unused
 files installation
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, mmayer@broadcom.com,
 fontaine.fabrice@gmail.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Florian,

On Mon, Dec 19 2022, Florian Fainelli wrote:
> Disable a number of unused files that were being installed into the root
> filesystem and thus inflating its size needlessly:
>
> * Disable the building of documentation
>
> * Disable support for other languages which is comprised of Common Lisp that
>   buildroot has no package for
>
> * Only install binaries and shared/static libraries, remove libtool archive
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> Changes in v2:
>
> - remove header files, pkgconfig and other unnecessary files
>
>  package/libgpg-error/libgpg-error.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
> index 86dea6ad2acd..6ce1f8d908de 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -14,7 +14,9 @@ LIBGPG_ERROR_INSTALL_STAGING = YES
>  LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
>  LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  LIBGPG_ERROR_CONF_OPTS = --disable-tests \
> -		--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)
> +		--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG) \
> +		--disable-languages \
> +		--disable-doc

This is part of default _CONFIGURE_CMDS for autotools packages. See
package/pkg-autotools.mk.

>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>  LIBGPG_ERROR_CONF_OPTS += --enable-threads
> @@ -22,4 +24,9 @@ else
>  LIBGPG_ERROR_CONF_OPTS += --disable-threads
>  endif
>  
> +define LIBGPG_ERROR_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install-exec
> +	rm -f $(TARGET_DIR)/usr/lib/libgpg-error.la

The target-finalize target in top Makefile should remove .la files:

        find $(TARGET_DIR)/lib/ $(TARGET_DIR)/usr/lib/ $(TARGET_DIR)/usr/libexec/ \
                \( -name '*.a' -o -name '*.la' -o -name '*.prl' \) -print0 | xargs -0 rm -f

Doesn't that work for you?

baruch

> +endef
> +
>  $(eval $(autotools-package))


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
