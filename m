From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 May 2013 21:34:30 +0200
Subject: [Buildroot] [PATCH v9 13/14] libopenmax: Add libopenmax virtual
	package
In-Reply-To: <1369931437-12445-14-git-send-email-spenser@gillilanding.com>
 (Spenser Gilliland's message of "Thu, 30 May 2013 11:30:36 -0500")
References: <1369931437-12445-1-git-send-email-spenser@gillilanding.com>
 <1369931437-12445-14-git-send-email-spenser@gillilanding.com>
Message-ID: <87txlkz2gp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser@gillilanding.com> writes:

 Spenser> this adds the libopenmax virtual package for hardware based video acceleration
 Spenser> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
 Spenser> ---
 Spenser>  package/multimedia/bellagio/Config.in   |    1 +
 Spenser>  package/opengl/Config.in                |    3 +++
 Spenser>  package/opengl/libopenmax/libopenmax.mk |   24 ++++++++++++++++++++++++
 Spenser>  package/rpi-userland/Config.in          |    1 +
 Spenser>  4 files changed, 29 insertions(+)
 Spenser>  create mode 100644 package/opengl/libopenmax/libopenmax.mk

 Spenser> diff --git a/package/multimedia/bellagio/Config.in b/package/multimedia/bellagio/Config.in
 Spenser> index 4be3aee..3292ef5 100644
 Spenser> --- a/package/multimedia/bellagio/Config.in
 Spenser> +++ b/package/multimedia/bellagio/Config.in
 Spenser> @@ -2,6 +2,7 @@ config BR2_PACKAGE_BELLAGIO
 Spenser>  	bool "bellagio"
 Spenser>  	depends on BR2_INSTALL_LIBSTDCPP
 Spenser>  	depends on BR2_TOOLCHAIN_HAS_THREADS
 Spenser> +	select BR2_PACKAGE_HAS_OPENMAX
 Spenser>  	help
 Spenser>  	  Bellagio is an opensource implementation of the
 Spenser>  	  OpenMAX IL API.
 Spenser> diff --git a/package/opengl/Config.in b/package/opengl/Config.in
 Spenser> index 81616f9..1636807 100644
 Spenser> --- a/package/opengl/Config.in
 Spenser> +++ b/package/opengl/Config.in
 Spenser> @@ -6,3 +6,6 @@ config BR2_PACKAGE_HAS_OPENGL_ES
 
 Spenser>  config BR2_PACKAGE_HAS_OPENVG
 Spenser>  	bool
 Spenser> +
 Spenser> +config BR2_PACKAGE_HAS_OPENMAX
 Spenser> +	bool
 Spenser> diff --git a/package/opengl/libopenmax/libopenmax.mk b/package/opengl/libopenmax/libopenmax.mk
 Spenser> new file mode 100644
 Spenser> index 0000000..dc29370
 Spenser> --- /dev/null
 Spenser> +++ b/package/opengl/libopenmax/libopenmax.mk
 Spenser> @@ -0,0 +1,24 @@
 Spenser> +#############################################################
 Spenser> +#
 Spenser> +# Virtual package for libopenmax
 Spenser> +#
 Spenser> +#############################################################
 Spenser> +
 Spenser> +LIBOPENMAX_SOURCE =
 Spenser> +
 Spenser> +ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 Spenser> +LIBOPENMAX_DEPENDENCIES += rpi-userland
 Spenser> +endif
 Spenser> +
 Spenser> +ifeq ($(BR2_PACKAGE_BELLAGIO),y)
 Spenser> +LIBOPENMAX_DEPENDENCIES += bellagio
 Spenser> +endif
 Spenser> +
 Spenser> +ifeq ($(LIBOPENMAX_DEPENDENCIES),y)

Same issue as what was pointed out for the opengl package earlier today.

Committed to next with this fixed, thanks.

-- 
Bye, Peter Korsgaard
