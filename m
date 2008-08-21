From: Ormund Williams <ormundw@panix.com>
Date: Thu, 21 Aug 2008 12:41:36 -0400
Subject: [Buildroot] Building Cairo using DirectFB
In-Reply-To: <1218624948.11802.3.camel@lnx32dtp04>
References: <1218624948.11802.3.camel@lnx32dtp04>
Message-ID: <1219336896.16845.259.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2008-08-13 at 11:55 +0100, Daniel Laird wrote:
> The following patch add support for building DirectFB 1.0 or 1.2.X
> It also stop auto adding packages and turns features on if people
> have enabled them from menuconfig.
> 
>  Config.in   |   27 ++++++--
>  directfb.mk |  200 +++++++++++++++++++++++++++++++++++++++---------------------
>  2 files changed, 151 insertions(+), 76 deletions(-)
> 
> Signed-off-by: daniel.j.laird <daniel.j.laird@nxp.com>
> 
> diff -urN buildroot.orig/package/directfb/Config.in buildroot/package/directfb/Config.in
> --- buildroot.orig/package/directfb/Config.in	2008-08-13 10:44:42.000000000 +0100
> +++ buildroot/package/directfb/Config.in	2008-08-12 11:58:15.000000000 +0100
> @@ -1,19 +1,34 @@
>  config BR2_PACKAGE_DIRECTFB
>  	bool "directfb"
...snip...
> diff -urN buildroot.orig/package/directfb/directfb.mk buildroot/package/directfb/directfb.mk
> --- buildroot.orig/package/directfb/directfb.mk	2008-08-13 10:44:42.000000000 +0100
> +++ buildroot/package/directfb/directfb.mk	2008-08-13 11:33:17.000000000 +0100
> @@ -3,27 +3,65 @@
>  # directfb
>  #
>  #############################################################
> -#DIRECTFB_VERSION:=0.9.25.1
...snip...
> +	$(if $(BR2_PACKAGE_DIRECTFB_MULTI), linux-fusion) \
> +	$(TARGET_DIR)/usr/lib/libdirectfb.so
>  
>  directfb-clean:
>  	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIRECTFB_DIR) uninstall
> 

Thanks Daniel,

I tried to apply this patch to the latest svn but it failed.  I then
tried to do it manually but this line fails:
  cp -R package/directfb/overlay$(DIRECTFB_VERSION)/* $(DIRECTFB_DIR)

Are you working against the buildroot repository or a fork?

Cheers

__
Ormund
