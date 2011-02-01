From: Heiko Zuerker <heiko@zuerker.org>
Date: Tue, 01 Feb 2011 12:27:13 -0600
Subject: [Buildroot] [PATCH] Add cryptsetup package
In-Reply-To: <1296580718-4746-1-git-send-email-mort@bork.org>
References: <1296580718-4746-1-git-send-email-mort@bork.org>
Message-ID: <20110201122713.230758orx90h44g0@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

is e2fsprogs really a requirement? If yes, I'd suggest adding it to  
the "select"s in the Config.in.

Heiko

Quoting Martin Hicks <mort@bork.org>:

> This adds the cryptsetup package to buildroot
>
> Signed-off-by: Martin Hicks <mort@bork.org>
> ---
>  package/Config.in                |    1 +
>  package/cryptsetup/Config.in     |   10 ++++++++++
>  package/cryptsetup/cryptsetup.mk |   12 ++++++++++++
>  3 files changed, 23 insertions(+), 0 deletions(-)
>  create mode 100644 package/cryptsetup/Config.in
>  create mode 100644 package/cryptsetup/cryptsetup.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 16a9e8f..631bb80 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -483,6 +483,7 @@ source "package/sysklogd/Config.in"
>  source "package/sysvinit/Config.in"
>  source "package/util-linux/Config.in"
>  endif
> +source "package/cryptsetup/Config.in"
>  endmenu
>
>  menu "Text editors and viewers"
> diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
> new file mode 100644
> index 0000000..23c4afa
> --- /dev/null
> +++ b/package/cryptsetup/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_CRYPTSETUP
> +	bool "cryptsetup"
> +	select BR2_PACKAGE_LIBGCRYPT
> +	select BR2_PACKAGE_POPT
> +	select BR2_PACKAGE_LVM2
> +	help
> +	  This tool helps manipulate dm-crypt and luks partitions for on-disk
> +          encryption.
> +
> +	  http://www.saout.de/misc/dm-crypt/
> diff --git a/package/cryptsetup/cryptsetup.mk  
> b/package/cryptsetup/cryptsetup.mk
> new file mode 100644
> index 0000000..5b0310f
> --- /dev/null
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -0,0 +1,12 @@
> +#
> +# cryptsetup
> +#
> +CRYPTSETUP_VERSION = 1.2.0
> +CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.bz2
> +CRYPTSETUP_SITE = http://cryptsetup.googlecode.com/files
> +CRYPTSETUP_INSTALL_STAGING = NO
> +CRYPTSETUP_INSTALL_TARGET = YES
> +#CRYPTSETUP_CONF_OPT = --BLAH
> +CRYPTSETUP_DEPENDENCIES = lvm2 libgcrypt popt e2fsprogs
> +
> +$(eval $(call AUTOTARGETS,package,cryptsetup))
> --
> 1.5.6.5
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
