Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E129C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20A4A40150;
	Sun, 30 Jan 2022 14:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2fRaiTx_P-5; Sun, 30 Jan 2022 14:46:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0CD04017C;
	Sun, 30 Jan 2022 14:46:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6C811BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C217D60A9F
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id onvn-LkEL73N for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:46:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E509B60644
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:46:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E48581BF209;
 Sun, 30 Jan 2022 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643553966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/LMOiP82IAmrXfTX4UiCzJecz6AnEP489t5o61D0Uqg=;
 b=FWAMelZyF+h4RkYT7jQ4r2dsb4twDIqe/KlJXVyfgKPOKlMbB1EEd+2Jmmth+486YgHohF
 n8VtJm/SZJox8Ngf8gwpVRQNwl2yUw5/PBh3Di6K44HSxdIan4gEjmeZdegDJuXEDBYXCd
 NCX7GbqrjUdZnmXBSBcwgCzYDEp1FH4U3UrotHKaLGqj5lJp1rDObL8YpaYVyEQkxthoGU
 lnp4THvKG0wVA4MMOkbrG434+7aLCqhzbzhsLmAeT+uXh6yHkSMpjZC/QUtnmPQRKbv0x8
 QfWI6Kgq6BxnhxLoufNj8uk1gUdu66nPF8p7s+byONEI2NzKRDV/+/FDZc6Tvw==
Date: Sun, 30 Jan 2022 15:46:05 +0100
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220130154605.5fad582e@windsurf>
In-Reply-To: <20220129142352.1197168-2-romain.naour@gmail.com>
References: <20220129142352.1197168-1-romain.naour@gmail.com>
 <20220129142352.1197168-2-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/poke: disable minimal-threading
 with thumb or thumb2
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 29 Jan 2022 15:23:51 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> +# Disable minimal-threading when thumb or thumb2 is enabled
> +# due to runtime issue.
> +# https://lists.gnu.org/archive/html/poke-devel/2022-01/msg00162.html
> +ifeq ($(BR2_ARM_CPU_HAS_THUMB)$(BR2_ARM_CPU_HAS_THUMB2),y)
> +POKE_CONF_OPTS += --disable-dispatch-minimal-threading
> +else
> +POKE_CONF_OPTS += --enable-dispatch-minimal-threading
> +endif

I don't understand this patch, because minimal-threading is already
disabled by default (at least in poke 1.4, I haven't checked in poke
2.0). jitter/configure.ac contains:

# Is the minimal-threading dispatch enabled?  Check the default and the
# configure command-line option.
AC_MSG_CHECKING([if minimal-threading dispatch is enabled])
# FIXME: reenable this when I make defect handling reliable.
#default=$(test "x$JITTER_HAVE_ACTUAL_GCC" = "xyes" && echo yes || echo no)
default=no
AC_ARG_ENABLE([dispatch-minimal-threading],
              AS_HELP_STRING([--enable-dispatch-minimal-threading],
              [enable minimal threading dispatch: default yes if and
only if GCC (not an imitation) is used]),
              jitter_enable_dispatch_minimal_threading="$enableval",
              jitter_enable_dispatch_minimal_threading="$default")
if test "x$jitter_enable_dispatch_minimal_threading" = "xyes"; then
  jitter_best_dispatch_model="minimal-threading"
  jitter_enabled_dispatch_models="$jitter_enabled_dispatch_models minimal-threading"
fi
AC_MSG_RESULT([$jitter_enable_dispatch_minimal_threading$jitter_subpackage_disclaimer])
# FIXME: remove this warning message when I make defect handling reliable.
if test "x$jitter_enable_dispatch_minimal_threading" = "xyes"; then
  AC_MSG_WARN([minimal-threading dispatch is currently unreliable, and should
  not be used in production until defective instruction replacement is fully
  implemented])
fi

See the "default=no" ?

Also, when building with the following defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_EABI=y
BR2_ARM_INSTRUCTIONS_THUMB2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_POKE=y
# BR2_TARGET_ROOTFS_TAR is not set

The minimal threading is already disabled:

checking if switch dispatching is enabled... yes, provisionally (sub-package mode)
checking if direct-threading dispatch is enabled... yes, provisionally (sub-package mode)
checking if minimal-threading dispatch is enabled... no, provisionally (sub-package mode)
checking if no-threading dispatch is enabled... no, provisionally (sub-package mode)
configure: sub-package mode: disabling every dispatch except
direct-threading
configure:   (the following dispatches could have been enabled:
  switch direct-threading)
configure: enabled dispatching models are:
  direct-threading
configure: the best enabled dispatching model is:
  direct-threading

So what this patch is doing is in fact slightly the opposite of what he
says: instead of disabling minimal threading for thumb or thumb2, it
enables it for any other platform.

Are you sure this patch was needed for poke 1.4, and not for poke 2.0 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
