From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 18:06:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/rt-tests: bump version to 1.10
In-Reply-To: <20201229100707.114468-1-Florian.LaRoche@gmail.com>
References: <20201229100707.114468-1-Florian.LaRoche@gmail.com>
Message-ID: <20201229170641.GR1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Florian, Andreas, All,

On 2020-12-29 11:07 +0100, Florian La Roche via buildroot spake thusly:
> Signed-off-by: Florian La Roche <Florian.LaRoche@gmail.com>

Applied to master, thanks. But see below...

[--SNIP--]
> diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
> index 7761beeb52..00fd781121 100644
> --- a/package/rt-tests/rt-tests.mk
> +++ b/package/rt-tests/rt-tests.mk
> @@ -6,7 +6,7 @@
>  
>  RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
>  RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
> -RT_TESTS_VERSION = 1.9
> +RT_TESTS_VERSION = 1.10

With 1.10, building without libnuma is no longer supported, so I had to
revert the recent commit 7e90744e6 (package/rt-tests: make  numactlan
optional dependency) while applying your patch. See the updated commit
log.

Regards,
Yann E. MORIN.

>  RT_TESTS_LICENSE = GPL-2.0+
>  RT_TESTS_LICENSE_FILES = COPYING
>  
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
