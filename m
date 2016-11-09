From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:18:16 +0100
Subject: [Buildroot] [PATCH] valgrind: do not use host mpicc
In-Reply-To: <20161109095124.6037-1-jezz@sysmic.org>
References: <20161109095124.6037-1-jezz@sysmic.org>
Message-ID: <20161109221816.22f4f842@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Nov 2016 10:51:24 +0100, J?r?me Pouiller wrote:

> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
> index 09f7116..c7ac2a1 100644
> --- a/package/valgrind/valgrind.mk
> +++ b/package/valgrind/valgrind.mk
> @@ -15,6 +15,8 @@ VALGRIND_INSTALL_STAGING = YES
>  # patch 0004-Fixes-for-musl-libc.patch touching configure.ac
>  VALGRIND_AUTORECONF = YES
>  
> +VALGRIND_CONF_OPTS += --without-mpicc

Not sure why you're adding another CONF_OPTS assignment instead of
re-using the existing one, so I've refactored that a bit and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
