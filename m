From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 25 Feb 2017 02:22:49 +0100
Subject: [Buildroot] [PATCH] package/htop: not available for uClibc
 static builds
In-Reply-To: <1487950561-29105-1-git-send-email-yann.morin.1998@free.fr>
References: <1487950561-29105-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170225012249.GE12810@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Yann E. MORIN wrote,

> htop wants to use backtrace() when available.
> 
> However, on uClibc this causes two problems:
> 
>   - backtrace() is not in libc but in a separate library, libubacktrace

Not in the version Buildroot's internal toolchain uses now.
But it is only available when UCLIBC_HAS_BACKTRACE is enabled.

It seems Synopsis external toolchain uses an old uClibc-ng version
before extra libubacktrace library was included in libc.a/libc.so.

best regards
 Waldemar
