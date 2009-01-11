From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 11 Jan 2009 23:24:40 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/sudo
In-Reply-To: <20090111203618.2084F76736@busybox.osuosl.org>
References: <20090111203618.2084F76736@busybox.osuosl.org>
Message-ID: <1231712680.9711.52.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2009-01-11 klockan 20:36 +0000 skrev jacmet at uclibc.org:
> Author: jacmet
> Date: 2009-01-11 20:36:17 +0000 (Sun, 11 Jan 2009)
> New Revision: 24763
> 
> Log:
> sudo: use Debian as upstream
> 
> As we are using a Debian/Ubuntu patch, it makes more sense to get the
> tarball from there as well.
> 

?I am pretty sure you id NOT test that...
Please remove any such tarball from your download directory
and try building sudo, and you will see.
Not since they obsoleted that version.
Either you update to a newer version AND
create a patchset that compiled or you
revert that patch.

?


> Modified:
>    trunk/buildroot/package/sudo/sudo.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/sudo/sudo.mk
> ===================================================================
> --- trunk/buildroot/package/sudo/sudo.mk	2009-01-11 20:35:34 UTC (rev 24762)
> +++ trunk/buildroot/package/sudo/sudo.mk	2009-01-11 20:36:17 UTC (rev 24763)
> @@ -5,15 +5,13 @@
>  #############################################################
>  
>  SUDO_VERSION:=1.6.8p12
> -#SUDO_SITE:=ftp://ftp.sudo.ws/pub/sudo/
> -SUDO_SITE:=$(BR2_ATMEL_MIRROR)
> +SUDO_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sudo
>  
>  #SUDO_VERSION:=1.7.0
>  #SUDO_SITE:=http://www.courtesan.com/sudo/dist
>  # 1.7.0 Needs update Cross-Compiler patches
>  
> -
> -SUDO_SOURCE:=sudo-$(SUDO_VERSION).tar.gz
> +SUDO_SOURCE:=sudo_$(SUDO_VERSION).orig.tar.gz
>  SUDO_DIR:=$(BUILD_DIR)/sudo-$(SUDO_VERSION)
>  SUDO_UNZIP:=$(ZCAT)
>  
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
