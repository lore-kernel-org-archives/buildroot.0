From: Claudio Leonel <cls@elaxys.com.br>
Date: Fri, 15 Dec 2006 09:19:53 -0200
Subject: [Buildroot] FTP server for embedded application
	(uClibc/buildroot)
In-Reply-To: <1166108258.45816662218c4@imp6-g19.free.fr>
References: <4581501E.6080501@elaxys.com.br>
	<1166108258.45816662218c4@imp6-g19.free.fr>
Message-ID: <458284D9.9050102@elaxys.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

Your pure-ftpd package compiled OK !
I have tried to compile pure-ftpd before
but was discouraged by the errors during configuration.
Your patch seems to have taken care of them !!

Thanks !

Claudio Leonel


julien.boibessot at free.fr wrote:
> Hi Claudio,
> 
> I'm using pure-ftpd and it's working fine for me (but it's not the smallest
> existing one).
> 
> Here is a preliminary patch I wanted to post on buildroot mailing list.
> Could you give it a try and help me to integrate it in buildroot ?
> 
> Thanks !
> Julien
> 
> Quoting Claudio Leonel <cls@elaxys.com.br>:
> 
> 
>>Hi,
>>
>>Sorry if this is somewhat off-topic,
>>but I am looking for a small FTP server
>>with basic functionality that compiles OK
>>with uClibc and has very few dependencies on
>>other libraries.
>>I didn't find any in buildroot standard
>>packages.
>>Do you have sugestions ?
>>
>>Best regards,
>>Claudio Leonel
>>
>>_______________________________________________
>>buildroot mailing list
>>buildroot at uclibc.org
>>http://busybox.net/mailman/listinfo/buildroot
>>
> 
> 
> 
> 
> ------------------------------------------------------------------------
> 
> --- buildroot.org/package/Config.in	2006-12-05 16:35:19.000000000 +0100
> +++ buildroot/package/Config.in	2006-12-05 16:42:00.000000000 +0100
> @@ -117,6 +117,7 @@
>  source "package/pppd/Config.in"
>  source "package/procps/Config.in"
>  source "package/psmisc/Config.in"
> +source "package/pure-ftpd/Config.in"
>  source "package/pygame/Config.in"
>  source "package/python/Config.in"
>  source "package/qte/Config.in"
> --- buildroot.org/package/pure-ftpd/001-pure-ftpd-configure.patch	1970-01-01 01:00:00.000000000 +0100
> +++ buildroot/package/pure-ftpd/001-pure-ftpd-configure.patch	2006-12-05 18:30:41.000000000 +0100
> @@ -0,0 +1,65 @@
> +--- pure-ftpd-1.0.21.ori/configure	2006-12-05 17:28:52.000000000 +0100
> ++++ pure-ftpd-1.0.21/configure	2006-12-05 17:31:00.000000000 +0100
> +@@ -21379,7 +21379,7 @@
> + See \`config.log' for more details." >&5
> + echo "$as_me: error: cannot run test program while cross compiling
> + See \`config.log' for more details." >&2;}
> +-   { (exit 1); exit 1; }; }
> ++}
> + else
> +   cat >conftest.$ac_ext <<_ACEOF
> + /* confdefs.h.  */
> +@@ -21453,7 +21453,7 @@
> + See \`config.log' for more details." >&5
> + echo "$as_me: error: cannot run test program while cross compiling
> + See \`config.log' for more details." >&2;}
> +-   { (exit 1); exit 1; }; }
> ++}
> + else
> +   cat >conftest.$ac_ext <<_ACEOF
> + /* confdefs.h.  */
> +@@ -21521,7 +21521,7 @@
> + See \`config.log' for more details." >&5
> + echo "$as_me: error: cannot run test program while cross compiling
> + See \`config.log' for more details." >&2;}
> +-   { (exit 1); exit 1; }; }
> ++}
> + else
> +   cat >conftest.$ac_ext <<_ACEOF
> + /* confdefs.h.  */
> +@@ -21627,7 +21627,7 @@
> + See \`config.log' for more details." >&5
> + echo "$as_me: error: cannot run test program while cross compiling
> + See \`config.log' for more details." >&2;}
> +-   { (exit 1); exit 1; }; }
> ++}
> + else
> +   cat >conftest.$ac_ext <<_ACEOF
> + /* confdefs.h.  */
> +@@ -21696,7 +21696,7 @@
> + See \`config.log' for more details." >&5
> + echo "$as_me: error: cannot run test program while cross compiling
> + See \`config.log' for more details." >&2;}
> +-   { (exit 1); exit 1; }; }
> ++}
> + else
> +   cat >conftest.$ac_ext <<_ACEOF
> + /* confdefs.h.  */
> +@@ -22483,7 +22483,7 @@
> + See \`config.log' for more details." >&5
> + echo "$as_me: error: cannot run test program while cross compiling
> + See \`config.log' for more details." >&2;}
> +-   { (exit 1); exit 1; }; }
> ++}
> + else
> +   cat >conftest.$ac_ext <<_ACEOF
> + /* confdefs.h.  */
> +@@ -22886,7 +22886,7 @@
> + See \`config.log' for more details." >&5
> + echo "$as_me: error: cannot run test program while cross compiling
> + See \`config.log' for more details." >&2;}
> +-   { (exit 1); exit 1; }; }
> ++}
> + else
> +   cat >conftest.$ac_ext <<_ACEOF
> + /* confdefs.h.  */
> --- buildroot.org/package/pure-ftpd/Config.in	1970-01-01 01:00:00.000000000 +0100
> +++ buildroot/package/pure-ftpd/Config.in	2006-12-05 16:09:58.000000000 +0100
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PURE_FTPD
> +	bool "Pure-FTPd"
> +	default y
> +	help
> +	  Pure-FTPd is a free (BSD), secure, production-quality and standard-conformant FTP server.
> +
> +	  http://www.pureftpd.org/project/pure-ftpd
> --- buildroot.org/package/pure-ftpd/pure-ftpd.mk	1970-01-01 01:00:00.000000000 +0100
> +++ buildroot/package/pure-ftpd/pure-ftpd.mk	2006-12-06 10:58:15.000000000 +0100
> @@ -0,0 +1,70 @@
> +#############################################################
> +#
> +# Pure-FTPd - FTP server
> +#
> +#############################################################
> +
> +PURE_FTPD_VERSION:=1.0.21
> +PURE_FTPD_SOURCE_URL:=http://download.pureftpd.org/pub/pure-ftpd/releases
> +PURE_FTPD_SOURCE:=pure-ftpd-$(PURE_FTPD_VERSION).tar.gz
> +PURE_FTPD_DIR=$(BUILD_DIR)/pure-ftpd-$(PURE_FTPD_VERSION)
> +
> +#--- Here we go:
> +$(DL_DIR)/$(PURE_FTPD_SOURCE):
> +	 $(WGET) -P $(DL_DIR) $(PURE_FTPD_SOURCE_URL)/$(PURE_FTPD_SOURCE)
> +
> +$(PURE_FTPD_DIR)/.unpacked: $(DL_DIR)/$(PURE_FTPD_SOURCE)
> +	$(ZCAT) $(DL_DIR)/$(PURE_FTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> +	toolchain/patch-kernel.sh $(PURE_FTPD_DIR) package/pure-ftpd/ \*.patch
> +	touch $@
> +
> +$(PURE_FTPD_DIR)/.configured: $(PURE_FTPD_DIR)/.unpacked
> +	(cd $(PURE_FTPD_DIR); \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	CFLAGS="$(TARGET_CFLAGS) " \
> +	./configure \
> +	--target=$(GNU_TARGET_NAME) \
> +	--host=$(GNU_TARGET_NAME) \
> +	--build=$(GNU_HOST_NAME) \
> +	--prefix=$(STAGING_DIR)/usr \
> +	);
> +#	--with-minimal \ Not compiling (syslog variables redefinition)
> +	touch $@
> +
> +$(PURE_FTPD_DIR)/src/pure-ftpd: $(PURE_FTPD_DIR)/.configured
> +	$(MAKE) -C $(PURE_FTPD_DIR) \
> +	CC=$(TARGET_CC) \
> +	CFLAGS="$(TARGET_CFLAGS)" \
> +	LDFLAGS="-lcrypt"
> +# add this to CFLAGS when "--with-minimal" is selected -DHAVE_STRUCT_ADDRINFO -DHAVE_GETNAMEINFO -DHAVE_GETADDRINFO 
> +
> +$(STAGING_DIR)/usr/sbin/pure-ftpd: $(PURE_FTPD_DIR)/src/pure-ftpd
> +	$(MAKE) -C $(PURE_FTPD_DIR) \
> +	CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" \
> +	install
> +
> +$(TARGET_DIR)/usr/sbin/pure-ftpd: $(STAGING_DIR)/usr/sbin/pure-ftpd
> +	$(STRIP) $(STAGING_DIR)/usr/sbin/pure*
> +	$(STRIP) $(STAGING_DIR)/usr/bin/pure*
> +	cp -f $(STAGING_DIR)/usr/sbin/pure* $(TARGET_DIR)/usr/sbin/
> +	cp -f $(STAGING_DIR)/usr/bin/pure* $(TARGET_DIR)/usr/bin/
> +
> +pure-ftpd: $(TARGET_DIR)/usr/sbin/pure-ftpd
> +
> +pure-ftpd-source: $(DL_DIR)/$(PURE_FTPD_SOURCE)
> +
> +pure-ftpd-clean:
> +	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(PURE_FTPD_BUILD_DIR) uninstall
> +	-$(MAKE) -C $(PURE_FTPD_DIR) clean
> +
> +pure-ftpd-dirclean:
> +	rm -rf $(PURE_FTPD_DIR)
> +
> +#############################################################
> +#
> +# Toplevel Makefile options
> +#
> +#############################################################
> +ifeq ($(strip $(BR2_PACKAGE_PURE_FTPD)),y)
> +TARGETS+=pure-ftpd
> +endif
