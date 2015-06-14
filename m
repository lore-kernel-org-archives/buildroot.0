From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 22:56:20 +0200
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: Fix x86 compilation
 with gcc5
In-Reply-To: <1434301872-30351-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434301872-30351-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150614225620.02eafcbc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 14 Jun 2015 19:11:11 +0200, Bernd Kuhls wrote:

> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 41ac616..479625c 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -261,6 +261,7 @@ ifeq ($(BR2_X86_CPU_HAS_MMX),y)
>  FFMPEG_CONF_OPTS += --enable-yasm
>  FFMPEG_DEPENDENCIES += host-yasm
>  else
> +FFMPEG_CONF_OPTS += --disable-asm

This will actually disable *all* ASM based optimizations, in all cases
(except on x86 with MMX). So it will potentially cause some severe
performance degradation, even if you're not using gcc 5.1. Shouldn't we
instead report the bug to upstream ffmpeg ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
