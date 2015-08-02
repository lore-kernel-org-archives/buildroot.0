From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Aug 2015 11:28:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: Adjust patches after
 last version bump
In-Reply-To: <1438439690-11801-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438439690-11801-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150802092847.GA3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, all,

On 2015-08-01 16:34 +0200, Bernd Kuhls spake thusly:
> Sorry, my repos got mixed up, so I forgot to send the updated patches.
> 
> Fixes
> http://autobuild.buildroot.net/results/ddd/ddd196577643de5b4f58a0903b19a04513620693/
> http://autobuild.buildroot.net/results/d25/d253c8c9d0773843c462fde0d5005bb14e4ce2c4/
> http://autobuild.buildroot.net/results/b61/b61d582c7362332e0ffad645c90d95d880dacedc/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: build-tested only]
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/tvheadend/0001-no-check_config.patch | 6 +++---
>  package/tvheadend/0002-remove-werror.patch   | 8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/tvheadend/0001-no-check_config.patch b/package/tvheadend/0001-no-check_config.patch
> index bc724db..c77ca76 100644
> --- a/package/tvheadend/0001-no-check_config.patch
> +++ b/package/tvheadend/0001-no-check_config.patch
> @@ -12,12 +12,12 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile
>  --- tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile	2014-03-09 14:47:43.780025330 +0100
>  +++ tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile	2014-03-09 14:48:40.836539093 +0100
> -@@ -294,7 +294,7 @@
> +@@ -516,7 +516,7 @@
>   	$(ROOTDIR)/configure $(CONFIGURE_ARGS)
>   
>   # Binary
> --${PROG}: check_config make_webui $(MO-FILES) $(OBJS)
> -+${PROG}: make_webui $(MO-FILES) $(OBJS)
> +-${PROG}: check_config make_webui $(OBJS)
> ++${PROG}: make_webui $(OBJS)
>   	$(CC) -o $@ $(OBJS) $(CFLAGS) $(LDFLAGS)
>   
>   # Object
> diff --git a/package/tvheadend/0002-remove-werror.patch b/package/tvheadend/0002-remove-werror.patch
> index 624ca3a..d466907 100644
> --- a/package/tvheadend/0002-remove-werror.patch
> +++ b/package/tvheadend/0002-remove-werror.patch
> @@ -5,10 +5,10 @@ Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>  diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile
>  --- tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile	2014-03-09 14:50:48.437688482 +0100
>  +++ tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile	2014-03-09 14:54:00.411418749 +0100
> -@@ -28,7 +28,7 @@
> - #
> - 
> - CFLAGS  += -g -O2 -Wunused-result
> +@@ -32,7 +32,7 @@
> + ifeq ($(CONFIG_W_UNUSED_RESULT),yes)
> + CFLAGS  += -Wunused-result
> + endif
>  -CFLAGS  += -Wall -Werror -Wwrite-strings -Wno-deprecated-declarations
>  +CFLAGS  += -Wall -Wwrite-strings -Wno-deprecated-declarations
>   CFLAGS  += -Wmissing-prototypes
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
