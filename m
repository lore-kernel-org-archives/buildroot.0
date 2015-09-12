From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 12 Sep 2015 10:25:39 +0100
Subject: [Buildroot] [PATCH] squid: bump to version 3.5.8
In-Reply-To: <1442004223-19430-1-git-send-email-gustavo@zacarias.com.ar>
References: <1442004223-19430-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <55F3EF93.1000705@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 11/09/15 21:43, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture.

$ grep ^SQUID_VERSION package/squid/squid.mk
SQUID_VERSION_MAJOR = 3.5
SQUID_VERSION = $(SQUID_VERSION_MAJOR).8

$ file output/target/usr/bin/squidclient
output/target/usr/bin/squidclient: ELF 32-bit MSB executable, MIPS, 
MIPS32 rel2 version 1 (SYSV), dynamically linked (uses shared libs), for 
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with 
unknown capability 0x10000 = 0x70403, stripped

Regards,

Vincent.

> ---
>   package/squid/squid.hash | 6 +++---
>   package/squid/squid.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/squid/squid.hash b/package/squid/squid.hash
> index 472df2d..97205e3 100644
> --- a/package/squid/squid.hash
> +++ b/package/squid/squid.hash
> @@ -1,3 +1,3 @@
> -# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.7.tar.xz.asc
> -md5	e24943386555ca922130a7e034badba7	squid-3.5.7.tar.xz
> -sha1	e7dcc0cbcee6fd10a8c8bf3e9bff0dc6359ccc48	squid-3.5.7.tar.xz
> +# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.8.tar.xz.asc
> +md5	0b4eae643b009215688fcf5f1a7803a7	squid-3.5.8.tar.xz
> +sha1	4ba4b43cf9abaf7e5015ad4d2d9b628213e55044	squid-3.5.8.tar.xz
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index e8fd079..75a2d35 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>
>   SQUID_VERSION_MAJOR = 3.5
> -SQUID_VERSION = $(SQUID_VERSION_MAJOR).7
> +SQUID_VERSION = $(SQUID_VERSION_MAJOR).8
>   SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
>   SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
>   SQUID_LICENSE = GPLv2+
>
