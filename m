From: Alexander Rigbo <alexander.rigbo@acgnystrom.se>
Date: Mon, 12 Feb 2007 11:19:04 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/usbmount
In-Reply-To: <20070212101412.9B192485CC@busybox.net>
References: <20070212101412.9B192485CC@busybox.net>
Message-ID: <200702121119.04542.alexander.rigbo@acgnystrom.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I sent an email to the list earlier, please see it here:

http://buildroot.uclibc.org/lists/buildroot/2007-February/001513.html

Best Regards
Alexander

On Monday 12 February 2007 11.14.12 aldot at uclibc.org wrote:
> Author: aldot
> Date: 2007-02-12 02:14:12 -0800 (Mon, 12 Feb 2007)
> New Revision: 17860
>
> Log:
> - bump version as noticed by xride
>
>
> Modified:
>    trunk/buildroot/package/usbmount/usbmount.mk
>
>
> Changeset:
> Modified: trunk/buildroot/package/usbmount/usbmount.mk
> ===================================================================
> --- trunk/buildroot/package/usbmount/usbmount.mk	2007-02-12 10:10:44 UTC
> (rev 17859) +++ trunk/buildroot/package/usbmount/usbmount.mk	2007-02-12
> 10:14:12 UTC (rev 17860) @@ -3,10 +3,11 @@
>  # usbmount
>  #
>  #############################################################
> -USBMOUNT_SOURCE:=usbmount_0.0.14.tar.gz
> +USBMOUNT_VERSION=0.0.14.1
> +USBMOUNT_SOURCE:=usbmount_$(USBMOUNT_VERSION).tar.gz
>  USBMOUNT_SITE:=http://usbmount.alioth.debian.org/package/
>  USBMOUNT_CAT:=$(ZCAT)
> -USBMOUNT_DIR:=$(BUILD_DIR)/usbmount-0.0.14
> +USBMOUNT_DIR:=$(BUILD_DIR)/usbmount-$(USBMOUNT_VERSION)
>  USBMOUNT_BINARY:=usbmount
>  USBMOUNT_TARGET_BINARY:=sbin/usbmount
>
> @@ -18,7 +19,7 @@
>  $(USBMOUNT_DIR)/.unpacked: $(DL_DIR)/$(USBMOUNT_SOURCE)
>  	$(USBMOUNT_CAT) $(DL_DIR)/$(USBMOUNT_SOURCE) | tar -C $(BUILD_DIR)
> $(TAR_OPTIONS) - toolchain/patch-kernel.sh $(USBMOUNT_DIR) package/usbmount
> \*.patch -	touch $(USBMOUNT_DIR)/.unpacked
> +	touch $@
>
>  $(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY): $(USBMOUNT_DIR)/.unpacked
>  	$(INSTALL) -m 0755 -D $(USBMOUNT_DIR)/usbmount
> $(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY)
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
