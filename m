From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 10 Dec 2011 21:31:12 +0100
Subject: [Buildroot] [PATCH v6 2/3] New package: giblib
In-Reply-To: <1318840867-20976-3-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Mon, 17 Oct 2011 10:41:06
 +0200")
References: <1318840867-20976-1-git-send-email-yegorslists@googlemail.com>
 <1318840867-20976-3-git-send-email-yegorslists@googlemail.com>
Message-ID: <8739cskw33.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
 yegorslists> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed with fixes, thanks.

 yegorslists> +++ b/package/giblib/Config.in
 yegorslists> @@ -0,0 +1,8 @@
 yegorslists> +config BR2_PACKAGE_GIBLIB
 yegorslists> +	bool "giblib"
 yegorslists> +	select BR2_PACKAGE_IMLIB2
 yegorslists> +	help
 yegorslists> +	  Giblib is a simple library which wraps imlib2.

Giblib needs X and X support in imlib2, so I changed the dependencies to
match.

 yegorslists> +
 yegorslists> +	  http://linuxbrit.co.uk/giblib/
 yegorslists> +
 yegorslists> diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
 yegorslists> new file mode 100644
 yegorslists> index 0000000..8a868c5
 yegorslists> --- /dev/null
 yegorslists> +++ b/package/giblib/giblib.mk
 yegorslists> @@ -0,0 +1,15 @@
 yegorslists> +#############################################################
 yegorslists> +#
 yegorslists> +# giblib
 yegorslists> +#
 yegorslists> +#############################################################
 yegorslists> +GIBLIB_VERSION = 1.2.4
 yegorslists> +GIBLIB_SOURCE = giblib-$(GIBLIB_VERSION).tar.gz
 yegorslists> +GIBLIB_SITE = http://linuxbrit.co.uk/downloads/
 yegorslists> +GIBLIB_INSTALL_STAGING = YES
 yegorslists> +GIBLIB_DEPENDENCIES = imlib2
 yegorslists> +GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING)/usr/lib \
 yegorslists> +		  --with-imlib2-exec-prefix=$(STAGING)/usr/bin
 yegorslists> +
 yegorslists> +$(eval $(call AUTOTARGETS))
 yegorslists> +

Removed empty line.

-- 
Bye, Peter Korsgaard
