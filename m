Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB19FC433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B7D960F96;
	Tue,  1 Feb 2022 22:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id luUchkh9v0FH; Tue,  1 Feb 2022 22:32:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A24D60DC6;
	Tue,  1 Feb 2022 22:32:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F8081BF97F
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D0B7400CE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:32:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7mWcVmLxm-oh for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:32:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6F4D400CC
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643754768;
 bh=x77hstkCyGU2fzXZIg2FAGakIIbhwuKHnWqLFXmn2SY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=LcbrIr3iCWqRttcEFt29G5rae0+ZwJJpHrIgtnJMk0qkjxEtUT4kYhro2JNA6/88k
 yn77UfVjFAk2fy0EfR1cxoh/UNLn2ZSBAjJ3R8FVECV/Vhtw4/Mn8e2J4q233RzHTz
 hxu0u3gjTHqwYU9CCuxpVXpfaTAPLfCj1H+/mvjA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.145]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6UZv-1n88sb2hUv-006sfQ; Tue, 01
 Feb 2022 23:32:48 +0100
Date: Tue, 1 Feb 2022 23:32:47 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Message-ID: <20220201233247.28ac615b@gmx.net>
In-Reply-To: <20220131230730.22235-1-ps.report@gmx.net>
References: <20220131230730.22235-1-ps.report@gmx.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:HizrNfSZuVdYFP7kudykkmevS7m+bdt7jNmHVECvTUXn9W0Yed1
 Qj9m8ZngQwcNcg52DEpo4SJi4q3an22azqJGlENvB3HCnu/BH6G4LDE49XYhxuaX5dFER3E
 B4bBLVoLOIXR/v9TX/kt/saXYUIxNesRhWtWJoFntTIMPMwE7woiUxnLarCg7ypDfrZDR91
 odjrF9yy40Al181tX6Wnw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b0beQD2E2dI=:RvkbNSIa/5CaVDSXgAXZFt
 iz/LBEuWiPg2FebZJWH8rAcjNP0/cIsNPu8rIznNK7+4vkKitkLl2B/fb2DS1ZQS4YlO822R4
 FTUI0VXNU51yay9e7xjPqMVDllvUINBtdDk9HswkQ7atQvTTvLwBF/BCFPUjZFvsH98du6ICU
 h7G2p1vZXjb/MpHrpbyczTyW5raR3voBhxEKZNRa45tpMmeLDgSqoPGFR82YpaOPkNIj6Q6oy
 3zbLQPoEFDEkfvi7025E9EuuhGwOwt1a83rbgWjKIeGZV9gW4TN80HiRJJ/akseXIFGbCLsDt
 mxzj7+2SW7FFkCjVoCsHf8JtvqZgilZeF4qyaTIMZ/yzv4/noYFPSVJ/NhPKEN+xFbNspq71F
 IlJcQbbDk5Z5XxI1GWPhQQnIzDVH9HcAk8LeRCMxY4qIMq8VVfvDuEXnHMDqm6hpvbd6lKnIo
 tYNIT+HD/M3BwTlz9/qaXofPPH/LhIDq9bMfPSt/sQsUkV3VXOQfJ5SK4Bo+05TWLcp/uJMjw
 6LKJYoWjWeRZF3ZxPyo9drKr951m6RphkYd1rw2CzSDD8vFfphk8zfxnKoUSJeIsI6NVa4rb0
 iP0Qm86s4+3vnh2NJt0FGQKM1tgfk0X2qHeWNwSMXXWJ74A1N4CZ0vm+fxDOnlT9GV1HCR+EQ
 tKzYsq2Filb1SRa/5c/7JnCWijGBjK7jRMK73mXgj/MOoN3+2Hf67eSkIY8wHyBdTqlmfGGM3
 p5iDpnDlFU0qtsJ7/BucmUxbNLvEK+MRCa4QoBQQxBb8x5XiFLAaPSKcsNhkBuGjTjFWGdPnV
 0AQ8t7goMBizimRbwsZ4Z8LDkmN7Drt+dXPdvVY8R3t7mRPcHc9o1cy/3X7eFjxatjfaJdeg0
 ykcHihZ6UD4EDWU89JmbRBtzdS/o9W2iirxfMyhEB3jo315IltkV8gNX+/t7U+kZ7n9fajkkL
 kRiVjJVudQZCogqxCDg9hzGeHWO+GYlm6l7MngqV8UH05zaZW32Gx+fdhaaNhpRM2xmNmHmSx
 5Zbik1qNKydZkWDhhpP9dG8px83LJ6FXBGz8JEfRyH0qLnJdKqOlHhBgKh0KBDpy/6nVaSaXM
 VNoYj24G+ebNJk=
Subject: Re: [Buildroot] [PATCH v1] package/libcamera: fix uclibc/musl
 compile with libexecinfo enabled
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  1 Feb 2022 00:07:30 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> - depend and link against libexecinfo if enabled to fix linking failure
>   in case execinfo.h is detected, see
>   libcamera-40f5fddca7f774944a53f58eeaebc4db79c373d8/meson.build:
>
>    32 if cc.has_header_symbol('execinfo.h', 'backtrace')
>    33     config_h.set('HAVE_BACKTRACE', 1)
>    34 endif
>
> - libexecinfo already depends on !BR2_TOOLCHAIN_USES_GLIBC
>
> Fixes:
>
>   - http://autobuild.buildroot.net/results/a1077815895ab847c5ca82ec17c7d13fe97cff53
>
>   .../powerpc-buildroot-linux-uclibc/bin/ld: src/libcamera/base/libcamera-base.so.p/log.cpp.o: in function `libcamera::Logger::backtrace()':
>   log.cpp:(.text+0x34b0): undefined reference to `backtrace'
>   .../powerpc-buildroot-linux-uclibc/bin/ld: log.cpp:(.text+0x34c0): undefined reference to `backtrace_symbols'
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libcamera/libcamera.mk | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 524cf07e03..9be45d248a 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -99,4 +99,9 @@ else
>  LIBCAMERA_CONF_OPTS += -Dtracing=disabled
>  endif
>
> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +LIBCAMERA_DEPENDENCIES += libexecinfo
> +LIBCAMERA_LDFLAGS += -lexecinfo

Should be:

	LIBCAMERA_LDFLAGS = $(TARGET_LDFLAGS) -lexecinfo

Updated patch will follow...

Regards,
Peter

> +endif
> +
>  $(eval $(meson-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
