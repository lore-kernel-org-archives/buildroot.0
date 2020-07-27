From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 08:32:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: fix build error
In-Reply-To: <20200726133023.1943702-1-bernd.kuhls@t-online.de>
References: <20200726133023.1943702-1-bernd.kuhls@t-online.de>
Message-ID: <20200727063227.GK19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-07-26 15:30 +0200, Bernd Kuhls spake thusly:
> Fixes
> http://autobuild.buildroot.net/results/5db/5dbce5860f57c1457962aa295857689f49a60bc6/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

It would have been nice to have an explanation of what's going on. I've
provided it in the commit log, and propagated that knowledge to the
upstream issue.

Applied to master with that info added, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0001-sofia-sip-fix-s2tcase.c.patch        | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/freeswitch/0001-sofia-sip-fix-s2tcase.c.patch
> 
> diff --git a/package/freeswitch/0001-sofia-sip-fix-s2tcase.c.patch b/package/freeswitch/0001-sofia-sip-fix-s2tcase.c.patch
> new file mode 100644
> index 0000000000..c4b9270984
> --- /dev/null
> +++ b/package/freeswitch/0001-sofia-sip-fix-s2tcase.c.patch
> @@ -0,0 +1,38 @@
> +From d66a2e55daf223737c07c59b1be45a2d91212ef6 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sun, 26 Jul 2020 13:47:16 +0200
> +Subject: [PATCH] [sofia-sip] fix s2tcase.c
> +
> +Fixes build error with libcheck:
> +https://github.com/signalwire/freeswitch/issues/681
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + libs/sofia-sip/s2check/s2tcase.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libs/sofia-sip/s2check/s2tcase.c b/libs/sofia-sip/s2check/s2tcase.c
> +index 382aaa3ad7..d67694c2ce 100644
> +--- a/libs/sofia-sip/s2check/s2tcase.c
> ++++ b/libs/sofia-sip/s2check/s2tcase.c
> +@@ -57,7 +57,7 @@ void s2_tcase_add_test(TCase *tc, TFun tf, char const *name,
> +       if (strcmp(*patterns, "*")) {
> + 	printf("%s: selected\n", name);
> +       }
> +-      _tcase_add_test(tc, tf, name, signo, 0, start, end);
> ++      _tcase_add_test(tc, tf, name, signo, start, end);
> +       return;
> +     }
> +   }
> +@@ -67,7 +67,7 @@ void s2_tcase_add_test(TCase *tc, TFun tf, char const *name,
> +       if (strcmp(*patterns, "*")) {
> + 	printf("%s: selected\n", name);
> +       }
> +-      _tcase_add_test(tc, tf, name, signo, 0, start, end);
> ++      _tcase_add_test(tc, tf, name, signo, start, end);
> +       return;
> +     }
> +   }
> +-- 
> +2.27.0
> +
> -- 
> 2.27.0
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
