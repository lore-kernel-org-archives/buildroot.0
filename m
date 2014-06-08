From: Mike Zick <minimod@morethan.org>
Date: Sun, 8 Jun 2014 16:00:34 -0500
Subject: [Buildroot] [PATCH 1/1] Option to copy Linaro gconv libs to
 target
In-Reply-To: <20140608192043.GQ3266@free.fr>
References: <1383428236-3842-1-git-send-email-svlasic@gmail.com>
 <20140608192043.GQ3266@free.fr>
Message-ID: <20140608160034.5e603bf7@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 8 Jun 2014 21:20:43 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> All this multi-arch stuff is so utterly broken, and there is not even
> a real use-case for it. Not even a Debian developper I talked to,
> which was involved in the mess, was able to explain what the reason
> was, that was not already covered by existing mechanisms. That's a
> shame...
>
rant

You mean this sort of c...?

     11193:   file=libc.so.6 [0];  needed by ./busybox [0]
     11193:   find library=libc.so.6 [0]; searching
     11193:    search path=../lib/tls/v7l/neon/vfp:../lib/tls/v7l/neon:../lib/tls/v7l/vfp:../lib/tls/v7l:../lib/tls/neon/vfp:../lib/tls/neon:../lib/tls/vfp:../lib/tls:../lib/v7l/neon/vfp:../lib/v7l/neon:../lib/v7l/vfp:../lib/v7l:../lib/neon/vfp:../lib/neon:../li
b/vfp:../lib          (RUNPATH from file ./busybox)
     11193:     trying file=../lib/tls/v7l/neon/vfp/libc.so.6
     11193:     trying file=../lib/tls/v7l/neon/libc.so.6
     11193:     trying file=../lib/tls/v7l/vfp/libc.so.6
     11193:     trying file=../lib/tls/v7l/libc.so.6
     11193:     trying file=../lib/tls/neon/vfp/libc.so.6
     11193:     trying file=../lib/tls/neon/libc.so.6
     11193:     trying file=../lib/tls/vfp/libc.so.6
     11193:     trying file=../lib/tls/libc.so.6
     11193:     trying file=../lib/v7l/neon/vfp/libc.so.6
     11193:     trying file=../lib/v7l/neon/libc.so.6
     11193:     trying file=../lib/v7l/vfp/libc.so.6
     11193:     trying file=../lib/v7l/libc.so.6
     11193:     trying file=../lib/neon/vfp/libc.so.6
     11193:     trying file=../lib/neon/libc.so.6
     11193:     trying file=../lib/vfp/libc.so.6
     11193:     trying file=../lib/libc.so.6

From one of today's builds of glibc-2.19 for a Cortex-A8.
The &$#^&^ loader is looking everywhere except under the bed.

Only one (the last) of the sixteen is where I told the loader to look.
Sure am glad that someone thinks they know better than I where I put
libc.

/rant
Mike
