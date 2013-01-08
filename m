From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Jan 2013 15:38:50 +0100
Subject: [Buildroot] [PATCH 1/1] added infozip package
In-Reply-To: <1357652308-20027-1-git-send-email-jp@jp-embedded.com>
References: <1357652308-20027-1-git-send-email-jp@jp-embedded.com>
Message-ID: <20130108153850.2b463304@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Pedersen,

Thanks for contributing this package!

On Tue,  8 Jan 2013 14:38:28 +0100, Jan Pedersen wrote:

> diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
> new file mode 100644
> index 0000000..996a709
> --- /dev/null
> +++ b/package/infozip/infozip.mk
> @@ -0,0 +1,43 @@
> +#############################################################
> +#
> +# infozip
> +#
> +#############################################################
> +INFOZIP_VERSION:=30
> +INFOZIP_SOURCE:=zip$(INFOZIP_VERSION).tgz
> +INFOZIP_SITE:=ftp://ftp.info-zip.org/pub/infozip/src/

Please use = instead of :=. So, something like:

INFOZIP_VERSION = 30
INFOZIP_SOURCE = zip$(INFOZIP_VERSION).tgz
INFOZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src/

Also, please add the INFOZIP_LICENSE and INFOZIP_LICENSE_FILES fields
(see the Buildroot manual for details).

> +INFOZIP_DIR = $(BUILD_DIR)/zip$(INFOZIP_VERSION)
> +
> +$(DL_DIR)/$(INFOZIP_SOURCE):
> +	$(call DOWNLOAD,$(INFOZIP_SITE)/$(INFOZIP_SOURCE))
> +
> +$(INFOZIP_DIR)/.source: $(DL_DIR)/$(INFOZIP_SOURCE)
> +	$(ZCAT) $(DL_DIR)/$(INFOZIP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> +	touch $@

[...]

Snip. Arggh, this is a manual .mk file. This is something we have
deprecated since a long time. Please use the generic-package
infrastructure instead.

See
http://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_with_specific_build_systems
for details on how to use this infrastructure, and the many examples
available in Buildroot.

Could you rework this package to use the generic-package infrastructure?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
