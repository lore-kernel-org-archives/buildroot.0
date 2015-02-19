From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 21:29:30 +0100
Subject: [Buildroot] [git commit branch/next] systemd: bump version to 219
Message-ID: <20150219203010.0303D80506@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc1775c8e3f182a4718b1d7384980f38af6ec007
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Bump version to 219
- Update the hash file
- Remove non-existent configure options
- Adapt patch to make it apply on version 219

Packages depending on systemd (bluez5-utils, dbus, liblogging,
pulseaudio) have been built successfully with this new version.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...uild-sys-revert-use-of-ln-relative-option.patch |   13 ++-----------
 package/systemd/systemd.hash                       |    2 +-
 package/systemd/systemd.mk                         |    4 +---
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch b/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
index f4795b8..2d9b347 100644
--- a/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
+++ b/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
@@ -10,9 +10,9 @@ for example).
 
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 ---
- Makefile.am  |   21 ++++++---------------
+ Makefile.am  |   19 +++++--------------
  configure.ac |    2 --
- 2 files changed, 6 insertions(+), 17 deletions(-)
+ 2 files changed, 5 insertions(+), 16 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
 index e238cde..02b39ea 100644
@@ -66,15 +66,6 @@ index e238cde..02b39ea 100644
  
  dbus1-generator-uninstall-hook:
  	rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
-@@ -2188,7 +2179,7 @@ systemd_bus_proxyd_LDADD = \
- bus-proxyd-install-hook:
- 	$(AM_V_at)$(MKDIR_P) $(DESTDIR)$(bindir)
- 	$(AM_V_RM)rm -f $(DESTDIR)$(bindir)/systemd-stdio-bridge
--	$(AM_V_LN)$(LN_S) --relative -f $(DESTDIR)$(rootlibexecdir)/systemd-bus-proxyd $(DESTDIR)$(bindir)/systemd-stdio-bridge
-+	$(AM_V_LN)$(LN_S) -f $(rootlibexecdir)/systemd-bus-proxyd $(DESTDIR)$(bindir)/systemd-stdio-bridge
- 
- bus-proxyd-uninstall-hook:
- 	rm -f $(DESTDIR)$(bindir)/systemd-stdio-bridge
 diff --git a/configure.ac b/configure.ac
 index ae88382..ec220af 100644
 --- a/configure.ac
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index e20519b..d2ac740 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  1b0768b53b6c6d813a93a4b8fe1f80cf53561b09075010a97c7aa08eee3fd59b  systemd-218.tar.xz
+sha256  5c57113454e37c040d0cb481bd960ae7cf3a3fe0a231ff4945259bc74503f2d9  systemd-219.tar.xz
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 92f99c2..98bda02 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 218
+SYSTEMD_VERSION = 219
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
 SYSTEMD_LICENSE = LGPLv2.1+; GPLv2+ for udev; MIT-like license for few source files listed in README
@@ -37,9 +37,7 @@ SYSTEMD_CONF_OPTS += \
 	--with-dbuspolicydir=/etc/dbus-1/system.d \
 	--with-dbussessionservicedir=/usr/share/dbus-1/services \
 	--with-dbussystemservicedir=/usr/share/dbus-1/system-services \
-	--with-dbusinterfacedir=/usr/share/dbus-1/interfaces \
 	--enable-split-usr \
-	--enable-introspection=no \
 	--disable-efi \
 	--disable-tests \
 	--disable-dbus \
