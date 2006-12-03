From: Rory Vieira <rory.vieira@gmail.com>
Date: Sun, 3 Dec 2006 10:46:46 +0100
Subject: [Buildroot] Giving sum back to you guys (and girls)
Message-ID: <5e15b0e10612030146s6866ab4ah6b623bd17c26bf3c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've been working with buildroot for quite some time now, and wanted
to show my support and give something back to you guys (and girls).

Now this little addition took me about three whole hours to make (LOL).
But I'm sure you would want to have it anyway:)

I don't know if this is the right way to hand it, but here it is anyway...
Samba 3.0.23d for buildroot :)

Notes:
 - I needed to disable cups (I'm working on it right now :) )
 - I'm still not happy with the amount of binaries installed...
 - Complete installation on my personal buildroot is rougly 25Mb
(stripped and well)
 - No matter what I tried with the configure script, it was always
'cross-compiling', so I needed to strip some crap from it... I hope I
did the job right (but it compiles and runs so it must be ok)

Attachments:
 - buildroot-16772-samba.patch
 - Config.in
 - samba.mk
 - samba-configure.patch

I don't know how you guys create such nice patch files... I have
always used 'diff -Naur' which seems to work... but I'm sending both
patch and the files themselfs...

Hoping this might make it into buildroot :)
Cheers,
-- 
Rory Vieira
rory dot vieira at gmail dot com
-------------- next part --------------
diff -Naur buildroot-16772.original/package/Config.in buildroot-16772/package/Config.in
--- buildroot-16772.original/package/Config.in	2006-11-28 17:59:17.000000000 +0100
+++ buildroot-16772/package/Config.in	2006-12-03 11:41:23.000000000 +0100
@@ -126,6 +126,7 @@
 source "package/rsync/Config.in"
 source "package/ruby/Config.in"
 source "package/rxvt/Config.in"
+source "package/samba/Config.in"
 source "package/sdl/Config.in"
 source "package/sfdisk/Config.in"
 source "package/slang/Config.in"
diff -Naur buildroot-16772.original/package/samba/Config.in buildroot-16772/package/samba/Config.in
--- buildroot-16772.original/package/samba/Config.in	1970-01-01 01:00:00.000000000 +0100
+++ buildroot-16772/package/samba/Config.in	2006-11-26 16:29:50.000000000 +0100
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SAMBA
+        bool "samba"
+        default n
+        help
+             Samba SMB Windows Server.
+ 
diff -Naur buildroot-16772.original/package/samba/samba-configure.patch buildroot-16772/package/samba/samba-configure.patch
--- buildroot-16772.original/package/samba/samba-configure.patch	1970-01-01 01:00:00.000000000 +0100
+++ buildroot-16772/package/samba/samba-configure.patch	2006-12-01 21:03:35.000000000 +0100
@@ -0,0 +1,93 @@
+--- source/configure
++++ source/configure
+@@ -10615,11 +10615,7 @@
+ esac
+ else
+   if test "$cross_compiling" +-  { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&5
+-echo "$as_me: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&2;}
+-   { (exit 1); exit 1; }; }
++  echo "You are crosscompiling :)"
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */
+@@ -11029,11 +11025,7 @@
+ esac
+ else
+   if test "$cross_compiling" +-  { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&5
+-echo "$as_me: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&2;}
+-   { (exit 1); exit 1; }; }
++  echo "You are crosscompiling :)"
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */
+@@ -11443,11 +11435,7 @@
+ esac
+ else
+   if test "$cross_compiling" +-  { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&5
+-echo "$as_me: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&2;}
+-   { (exit 1); exit 1; }; }
++  echo "You are crosscompiling :)"
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */
+@@ -11857,11 +11845,7 @@
+ esac
+ else
+   if test "$cross_compiling" +-  { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&5
+-echo "$as_me: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&2;}
+-   { (exit 1); exit 1; }; }
++  echo "You are crosscompiling :)"
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */
+@@ -21194,11 +21178,7 @@
+     *linux*)
+        # glibc <+        if test "$cross_compiling" +-  { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&5
+-echo "$as_me: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&2;}
+-   { (exit 1); exit 1; }; }
++  echo "You are crosscompiling :)"
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */
+@@ -32715,11 +32695,7 @@
+ else
+ 
+ 	if test "$cross_compiling" +-  { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&5
+-echo "$as_me: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&2;}
+-   { (exit 1); exit 1; }; }
++  echo "You are crosscompiling :)"
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */
+@@ -41972,11 +41948,7 @@
+ else
+ 
+     if test "$cross_compiling" +-  { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&5
+-echo "$as_me: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&2;}
+-   { (exit 1); exit 1; }; }
++  echo "You are crosscompiling :)"
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */
diff -Naur buildroot-16772.original/package/samba/samba.mk buildroot-16772/package/samba/samba.mk
--- buildroot-16772.original/package/samba/samba.mk	1970-01-01 01:00:00.000000000 +0100
+++ buildroot-16772/package/samba/samba.mk	2006-12-01 23:01:44.000000000 +0100
@@ -0,0 +1,103 @@
+#############################################################
+#
+# samba
+#
+#############################################################
+SAMBA_VERSION:=3.0.23d
+SAMBA_SOURCE:=samba-$(SAMBA_VERSION).tar.gz
+SAMBA_SITE:=http://www.samba.org/samba/ftp/stable/
+SAMBA_DIR:=$(BUILD_DIR)/samba-$(SAMBA_VERSION)/source
+SAMBA_BINARY:=smbd
+SAMBA_TARGET_BINARY:=usr/sbin/smbd
+
+TARGET_CFLAGS+=-DHAVE_GETTIMEOFDAY_TZ
+
+SBIN=mount.cifs umount.cifs
+USRBIN=eventlogadm net nmblookup ntlm_auth pdbedit profiles rpcclient smbcacls smbclient smbcontrol smbcquotas smbget smbmnt smbmount smbpasswd smbspool smbstatus smbtree smbumount tdbbackup tdbdump tdbtool testparm wbinfo
+USRSBIN=nmbd smbd winbindd
+VFS=audit cap default_quota expand_msdfs extd_audit fake_perms full_audit netatalk readonly recycle shadow_copy
+$(DL_DIR)/$(SAMBA_SOURCE):
+	$(WGET) -P $(DL_DIR) $(SAMBA_SITE)/$(SAMBA_SOURCE)
+
+$(SAMBA_DIR)/.source: $(DL_DIR)/$(SAMBA_SOURCE)
+	$(ZCAT) $(DL_DIR)/$(SAMBA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(SAMBA_DIR) package/samba/ samba\*.patch
+	touch $(SAMBA_DIR)/.source
+
+$(SAMBA_DIR)/.configured: $(SAMBA_DIR)/.source
+	(cd $(SAMBA_DIR); \
+	        $(TARGET_CONFIGURE_OPTS) \
+	        CFLAGS="$(TARGET_CFLAGS)" \
+	        ./configure \
+	        --host=$(GNU_TARGET_NAME) \
+	        --prefix=/etc \
+	        --localstatedir=/var/lib/samba \
+	        --sysconfdir=/etc/samba \
+	        --with-configdir=/etc/samba \
+	        --with-libdir=/usr/lib/samba \
+	        --with-lockdir=/var/lib/samba \
+	        --with-logfilebase=/var/log/samba \
+	        --with-rootsbindir=/sbin \
+	        --with-acl-support \
+	        --with-automount \
+	        --with-dnsupdate \
+	        --with-msdfs \
+	        --with-piddir=/var/run/samba \
+	        --with-privatedir=/etc/samba/private \
+	        --with-smbmount \
+	        --with-swatdir=/usr/local/swat \
+	        --with-tdbsam \
+	        --with-utmp \
+	        --with-vfs \
+	        --with-winbind \
+		--disable-cups \
+	);
+	touch $(SAMBA_DIR)/.configured;
+
+$(SAMBA_DIR)/$(SAMBA_BINARY): $(SAMBA_DIR)/.configured
+	HAVE_GETTIMEOFDAY_TZ=$(HAVE_GETTIMEOFDAY_TZ) $(MAKE) CC=$(TARGET_CC) -C $(SAMBA_DIR)
+
+$(TARGET_DIR)/$(SAMBA_TARGET_BINARY): $(SAMBA_DIR)/$(SAMBA_BINARY)
+	for x in $(SBIN) ; do \
+		install -D $(SAMBA_DIR)/bin/$$x $(TARGET_DIR)/sbin/$$x || exit 1 ; \
+	done
+	ln -s /usr/bin/smbmount $(TARGET_DIR)/sbin/mount.smbfs
+	for x in $(USRBIN) ; do \
+		install -D $(SAMBA_DIR)/bin/$$x $(TARGET_DIR)/usr/bin/$$x || exit 1 ; \
+	done
+	install -D $(SAMBA_DIR)/script/smbtar $(TARGET_DIR)/usr/bin/smbtar || exit 1
+	for x in $(USRSBIN) ; do \
+		install -D $(SAMBA_DIR)/bin/$$x $(TARGET_DIR)/usr/sbin/$$x || exit 1 ; \
+	done
+	cp $(SAMBA_DIR)/include/libmsrpc.h $(TARGET_DIR)/usr/include/libmsrpc.h || exit 1
+	cp $(SAMBA_DIR)/include/libsmbclient.h $(TARGET_DIR)/usr/include/libsmbclient.h || exit 1
+	install -D $(SAMBA_DIR)/bin/libmsrpc.so $(TARGET_DIR)/usr/lib/samba/libmsrpc.so || exit 1
+	install -D $(SAMBA_DIR)/bin/libsmbclient.so $(TARGET_DIR)/usr/lib/samba/libsmbclient.so || exit 1
+	install -D $(SAMBA_DIR)/bin/script.so $(TARGET_DIR)/usr/lib/samba/auth/script.so || exit 1
+	install -D $(SAMBA_DIR)/bin/CP437.so $(TARGET_DIR)/usr/lib/samba/charset/CP437.so || exit 1
+	install -D $(SAMBA_DIR)/bin/CP850.so $(TARGET_DIR)/usr/lib/samba/charset/CP850.so || exit 1
+	for x in $(VFS) ; do \
+		install -D $(SAMBA_DIR)/bin/$$x.so $(TARGET_DIR)/usr/lib/samba/vfs/$$x.so || exit 1 ; \
+	done
+	cp $(SAMBA_DIR)/codepages/* $(TARGET_DIR)/usr/lib/samba || exit 1
+	cp $(SAMBA_DIR)/po/*.msg $(TARGET_DIR)/usr/lib/samba || exit 1
+
+samba: uclibc ncurses $(TARGET_DIR)/$(SAMBA_TARGET_BINARY)
+
+samba-source: $(DL_DIR)/$(SAMBA_SOURCE)
+
+samba-clean:
+	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(SAMBA_DIR) uninstall
+	-$(MAKE) -C $(SAMBA_DIR) clean
+
+samba-dirclean:
+	rm -rf $(SAMBA_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_SAMBA)),y)
+TARGETS+=samba
+endif
-------------- next part --------------
config BR2_PACKAGE_SAMBA
        bool "samba"
        default n
        help
             Samba SMB Windows Server.
 
-------------- next part --------------
#############################################################
#
# samba
#
#############################################################
SAMBA_VERSION:=3.0.23d
SAMBA_SOURCE:=samba-$(SAMBA_VERSION).tar.gz
SAMBA_SITE:=http://www.samba.org/samba/ftp/stable/
SAMBA_DIR:=$(BUILD_DIR)/samba-$(SAMBA_VERSION)/source
SAMBA_BINARY:=smbd
SAMBA_TARGET_BINARY:=usr/sbin/smbd

TARGET_CFLAGS+=-DHAVE_GETTIMEOFDAY_TZ

SBIN=mount.cifs umount.cifs
USRBIN=eventlogadm net nmblookup ntlm_auth pdbedit profiles rpcclient smbcacls smbclient smbcontrol smbcquotas smbget smbmnt smbmount smbpasswd smbspool smbstatus smbtree smbumount tdbbackup tdbdump tdbtool testparm wbinfo
USRSBIN=nmbd smbd winbindd
VFS=audit cap default_quota expand_msdfs extd_audit fake_perms full_audit netatalk readonly recycle shadow_copy
$(DL_DIR)/$(SAMBA_SOURCE):
	$(WGET) -P $(DL_DIR) $(SAMBA_SITE)/$(SAMBA_SOURCE)

$(SAMBA_DIR)/.source: $(DL_DIR)/$(SAMBA_SOURCE)
	$(ZCAT) $(DL_DIR)/$(SAMBA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	toolchain/patch-kernel.sh $(SAMBA_DIR) package/samba/ samba\*.patch
	touch $(SAMBA_DIR)/.source

$(SAMBA_DIR)/.configured: $(SAMBA_DIR)/.source
	(cd $(SAMBA_DIR); \
	        $(TARGET_CONFIGURE_OPTS) \
	        CFLAGS="$(TARGET_CFLAGS)" \
	        ./configure \
	        --host=$(GNU_TARGET_NAME) \
	        --prefix=/etc \
	        --localstatedir=/var/lib/samba \
	        --sysconfdir=/etc/samba \
	        --with-configdir=/etc/samba \
	        --with-libdir=/usr/lib/samba \
	        --with-lockdir=/var/lib/samba \
	        --with-logfilebase=/var/log/samba \
	        --with-rootsbindir=/sbin \
	        --with-acl-support \
	        --with-automount \
	        --with-dnsupdate \
	        --with-msdfs \
	        --with-piddir=/var/run/samba \
	        --with-privatedir=/etc/samba/private \
	        --with-smbmount \
	        --with-swatdir=/usr/local/swat \
	        --with-tdbsam \
	        --with-utmp \
	        --with-vfs \
	        --with-winbind \
		--disable-cups \
	);
	touch $(SAMBA_DIR)/.configured;

$(SAMBA_DIR)/$(SAMBA_BINARY): $(SAMBA_DIR)/.configured
	HAVE_GETTIMEOFDAY_TZ=$(HAVE_GETTIMEOFDAY_TZ) $(MAKE) CC=$(TARGET_CC) -C $(SAMBA_DIR)

$(TARGET_DIR)/$(SAMBA_TARGET_BINARY): $(SAMBA_DIR)/$(SAMBA_BINARY)
	for x in $(SBIN) ; do \
		install -D $(SAMBA_DIR)/bin/$$x $(TARGET_DIR)/sbin/$$x || exit 1 ; \
	done
	ln -s /usr/bin/smbmount $(TARGET_DIR)/sbin/mount.smbfs
	for x in $(USRBIN) ; do \
		install -D $(SAMBA_DIR)/bin/$$x $(TARGET_DIR)/usr/bin/$$x || exit 1 ; \
	done
	install -D $(SAMBA_DIR)/script/smbtar $(TARGET_DIR)/usr/bin/smbtar || exit 1
	for x in $(USRSBIN) ; do \
		install -D $(SAMBA_DIR)/bin/$$x $(TARGET_DIR)/usr/sbin/$$x || exit 1 ; \
	done
	cp $(SAMBA_DIR)/include/libmsrpc.h $(TARGET_DIR)/usr/include/libmsrpc.h || exit 1
	cp $(SAMBA_DIR)/include/libsmbclient.h $(TARGET_DIR)/usr/include/libsmbclient.h || exit 1
	install -D $(SAMBA_DIR)/bin/libmsrpc.so $(TARGET_DIR)/usr/lib/samba/libmsrpc.so || exit 1
	install -D $(SAMBA_DIR)/bin/libsmbclient.so $(TARGET_DIR)/usr/lib/samba/libsmbclient.so || exit 1
	install -D $(SAMBA_DIR)/bin/script.so $(TARGET_DIR)/usr/lib/samba/auth/script.so || exit 1
	install -D $(SAMBA_DIR)/bin/CP437.so $(TARGET_DIR)/usr/lib/samba/charset/CP437.so || exit 1
	install -D $(SAMBA_DIR)/bin/CP850.so $(TARGET_DIR)/usr/lib/samba/charset/CP850.so || exit 1
	for x in $(VFS) ; do \
		install -D $(SAMBA_DIR)/bin/$$x.so $(TARGET_DIR)/usr/lib/samba/vfs/$$x.so || exit 1 ; \
	done
	cp $(SAMBA_DIR)/codepages/* $(TARGET_DIR)/usr/lib/samba || exit 1
	cp $(SAMBA_DIR)/po/*.msg $(TARGET_DIR)/usr/lib/samba || exit 1

samba: uclibc ncurses $(TARGET_DIR)/$(SAMBA_TARGET_BINARY)

samba-source: $(DL_DIR)/$(SAMBA_SOURCE)

samba-clean:
	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(SAMBA_DIR) uninstall
	-$(MAKE) -C $(SAMBA_DIR) clean

samba-dirclean:
	rm -rf $(SAMBA_DIR)

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(strip $(BR2_PACKAGE_SAMBA)),y)
TARGETS+=samba
endif
-------------- next part --------------
--- source/configure
+++ source/configure
@@ -10615,11 +10615,7 @@
 esac
 else
   if test "$cross_compiling" -  { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
-See \`config.log' for more details." >&5
-echo "$as_me: error: cannot run test program while cross compiling
-See \`config.log' for more details." >&2;}
-   { (exit 1); exit 1; }; }
+  echo "You are crosscompiling :)"
 else
   cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
@@ -11029,11 +11025,7 @@
 esac
 else
   if test "$cross_compiling" -  { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
-See \`config.log' for more details." >&5
-echo "$as_me: error: cannot run test program while cross compiling
-See \`config.log' for more details." >&2;}
-   { (exit 1); exit 1; }; }
+  echo "You are crosscompiling :)"
 else
   cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
@@ -11443,11 +11435,7 @@
 esac
 else
   if test "$cross_compiling" -  { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
-See \`config.log' for more details." >&5
-echo "$as_me: error: cannot run test program while cross compiling
-See \`config.log' for more details." >&2;}
-   { (exit 1); exit 1; }; }
+  echo "You are crosscompiling :)"
 else
   cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
@@ -11857,11 +11845,7 @@
 esac
 else
   if test "$cross_compiling" -  { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
-See \`config.log' for more details." >&5
-echo "$as_me: error: cannot run test program while cross compiling
-See \`config.log' for more details." >&2;}
-   { (exit 1); exit 1; }; }
+  echo "You are crosscompiling :)"
 else
   cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
@@ -21194,11 +21178,7 @@
     *linux*)
        # glibc <        if test "$cross_compiling" -  { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
-See \`config.log' for more details." >&5
-echo "$as_me: error: cannot run test program while cross compiling
-See \`config.log' for more details." >&2;}
-   { (exit 1); exit 1; }; }
+  echo "You are crosscompiling :)"
 else
   cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
@@ -32715,11 +32695,7 @@
 else
 
 	if test "$cross_compiling" -  { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
-See \`config.log' for more details." >&5
-echo "$as_me: error: cannot run test program while cross compiling
-See \`config.log' for more details." >&2;}
-   { (exit 1); exit 1; }; }
+  echo "You are crosscompiling :)"
 else
   cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
@@ -41972,11 +41948,7 @@
 else
 
     if test "$cross_compiling" -  { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
-See \`config.log' for more details." >&5
-echo "$as_me: error: cannot run test program while cross compiling
-See \`config.log' for more details." >&2;}
-   { (exit 1); exit 1; }; }
+  echo "You are crosscompiling :)"
 else
   cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
