From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 Mar 2016 21:40:22 +0200
Subject: [Buildroot] [Buildroot PATCH v2 1/1] raptor: new package
In-Reply-To: <1458641641-17752-1-git-send-email-nitin.mendiratta@rockwellcollins.com>
References: <1458641641-17752-1-git-send-email-nitin.mendiratta@rockwellcollins.com>
Message-ID: <20160322194021.GP2780@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nitin,

On Tue, Mar 22, 2016 at 03:44:01PM +0530, Nitin Mendiratta wrote:
> +ifeq ($(BR2_PACKAGE_LIBCURL),y)
> +RAPTOR_DEPENDENCIES += libcurl
> +RAPTOR_CONF_OPTS += --with-curl-config=$(STAGING_DIR)/usr/bin/curl-config
> +endif

Please add an 'else' clause that disables libcurl using --with-curl-config=no. 
The same goes for the two other optional dependencies.

> +ifeq ($(BR2_PACKAGE_YAJL),y)
> +RAPTOR_DEPENDENCIES += yajl
> +RAPTOR_CONF_ENV += LIBS="-lm"
> +RAPTOR_CONF_OPTS += --with-yajl-config=$(STAGING_DIR)/usr/bin/yajl-config

The yajl package does not provide yajl-config, and raptor configure does not 
support --with-yajl-config. Should be

  RAPTOR_CONF_OPTS += --with-yajl=$(STAGING_DIR)/usr/

instead.

> +endif
> +
> +ifeq ($(BR2_PACKAGE_ICU),y)
> +RAPTOR_DEPENDENCIES += icu
> +RAPTOR_CONF_OPTS += --with-icu-config=$(STAGING_DIR)/usr/bin/icu-config
> +endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
