From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Oct 2019 00:39:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/gpsd: perform SCons build with
 Python3
In-Reply-To: <20191027143500.237922-1-titouan.christophe@railnova.eu>
References: <20191027143500.237922-1-titouan.christophe@railnova.eu>
Message-ID: <5241f238-2512-1335-f077-02e95a578de4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/10/2019 15:35, Titouan Christophe wrote:
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/gpsd/gpsd.mk | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index 79d2ccfeaa..53f423626f 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -10,7 +10,7 @@ GPSD_LICENSE = BSD-2-Clause
>  GPSD_LICENSE_FILES = COPYING
>  GPSD_INSTALL_STAGING = YES
>  
> -GPSD_DEPENDENCIES = host-python host-scons host-pkgconf
> +GPSD_DEPENDENCIES = host-python3 host-scons host-pkgconf
>  
>  GPSD_LDFLAGS = $(TARGET_LDFLAGS)
>  GPSD_CFLAGS = $(TARGET_CFLAGS)
> @@ -204,7 +204,7 @@ GPSD_SCONS_ENV += LDFLAGS="$(GPSD_LDFLAGS)" CFLAGS="$(GPSD_CFLAGS)"
>  define GPSD_BUILD_CMDS
>  	(cd $(@D); \
>  		$(GPSD_SCONS_ENV) \
> -		$(HOST_DIR)/bin/python2 $(SCONS) \
> +		$(HOST_DIR)/bin/python3 $(SCONS) \
>  		$(GPSD_SCONS_OPTS))
>  endef
>  
> @@ -212,7 +212,7 @@ define GPSD_INSTALL_TARGET_CMDS
>  	(cd $(@D); \
>  		$(GPSD_SCONS_ENV) \
>  		DESTDIR=$(TARGET_DIR) \
> -		$(HOST_DIR)/bin/python2 $(SCONS) \
> +		$(HOST_DIR)/bin/python3 $(SCONS) \
>  		$(GPSD_SCONS_OPTS) \
>  		install)
>  endef
> @@ -226,7 +226,7 @@ define GPSD_INSTALL_STAGING_CMDS
>  	(cd $(@D); \
>  		$(GPSD_SCONS_ENV) \
>  		DESTDIR=$(STAGING_DIR) \
> -		$(HOST_DIR)/bin/python2 $(SCONS) \
> +		$(HOST_DIR)/bin/python3 $(SCONS) \
>  		$(GPSD_SCONS_OPTS) \
>  		install)
>  endef
> @@ -238,7 +238,7 @@ define GPSD_INSTALL_UDEV_RULES
>  	(cd $(@D); \
>  		$(GPSD_SCONS_ENV) \
>  		DESTDIR=$(TARGET_DIR) \
> -		$(HOST_DIR)/bin/python2 $(SCONS) \
> +		$(HOST_DIR)/bin/python3 $(SCONS) \
>  		$(GPSD_SCONS_OPTS) \
>  		udev-install)
>  	chmod u+w $(TARGET_DIR)/lib/udev/rules.d/25-gpsd.rules
> 
