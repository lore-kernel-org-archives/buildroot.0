From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Wed, 20 May 2015 11:04:26 +0200 (CEST)
Subject: [Buildroot] [PATCH] Handle defconfig as .config in .gitignore
 and	distclean.
In-Reply-To: <555c49ac.0a64b40a.3499.ffffb3f0@mx.google.com>
Message-ID: <530190200.250863.1432112666116.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm not sure I like that...

people are told to work with a clone of buildroot and adding defconfig
 to gitignore means that ther is a high chance of not adding it to git
and loosing it... 

(i'm perfectly fine with the distclean part)

Cordialement 

J?r?my Rosen 
+33 (0)1 42 68 28 04

fight key loggers : write some perl using vim 


Open Wide Ingenierie

23, rue Daviel
75013 Paris - France
www.openwide.fr





----- Mail original -----
> From: Karoly Kasza <kaszak@gmail.com>
> 
> After using "make safedefconfig", a defconfig file appears which is
> an
> extract of the .config file. When running git, it incorrectly detects
> it as a
> source code change, while make distclean forgets to remove it.
> 
> This patch adds /defconfig to .gitignore and to the distclean
> Makefile target.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  .gitignore |    1 +
>  Makefile   |    2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitignore b/.gitignore
> index bb02d9f..66f5ac1 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -5,6 +5,7 @@
>  /.config.old
>  /..config.tmp
>  /.config
> +/defconfig
>  *.depend
>  *.o
>  /*.patch
> diff --git a/Makefile b/Makefile
> index 5c4293b..bc890dd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -814,7 +814,7 @@ endif
>  ifeq ($(O),output)
>  	rm -rf $(O)
>  endif
> -	rm -rf $(BR2_CONFIG) $(CONFIG_DIR)/.config.old
> $(CONFIG_DIR)/..config.tmp \
> +	rm -rf $(BR2_CONFIG) $(CONFIG_DIR)/defconfig
> $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
>  		$(CONFIG_DIR)/.auto.deps
>  
>  help:
> --
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
