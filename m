From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Mar 2020 23:07:42 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/samba4: security
 bump to version 4.10.13
Message-ID: <20200307070534.8A4A68F3B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f9b8037e17cf296e5b5c6a5701e8abb8977018a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes the following security issues (4.10.12):

CVE-2019-14902: Replication of ACLs set to inherit down a subtree on AD
                Directory not automatic.
CVE-2019-14907: Crash after failed character conversion at log level 3
                or above.
CVE-2019-19344: Use after free during DNS zone scavenging in Samba AD
                DC.

For more details, see the release notes:
https://www.samba.org/samba/history/samba-4.10.12.html

In addition, 4.10.13 fixes a number of bugs.  For details, see the release
notes:
https://www.samba.org/samba/history/samba-4.10.13.html

Drop now upstreamed
0006-heimdal_build-wscript_build-do-not-add-host-include-.patch

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ld-wscript_build-do-not-add-host-include-.patch | 31 ----------------------
 package/samba4/samba4.hash                         |  4 +--
 package/samba4/samba4.mk                           |  2 +-
 3 files changed, 3 insertions(+), 34 deletions(-)

diff --git a/package/samba4/0006-heimdal_build-wscript_build-do-not-add-host-include-.patch b/package/samba4/0006-heimdal_build-wscript_build-do-not-add-host-include-.patch
deleted file mode 100644
index 08d8382ab0..0000000000
--- a/package/samba4/0006-heimdal_build-wscript_build-do-not-add-host-include-.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 189440643157fbc872a1670b3e30b6c459dbd930 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 21 Jul 2019 15:12:03 +0200
-Subject: [PATCH] heimdal_build/wscript_build: do not add host include
- patch
-
-Fixes cross-compile.
-
-Upstream bug report: https://bugzilla.samba.org/show_bug.cgi?id=13856
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- source4/heimdal_build/wscript_build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/source4/heimdal_build/wscript_build b/source4/heimdal_build/wscript_build
-index 45938b88315..e896c3e9454 100644
---- a/source4/heimdal_build/wscript_build
-+++ b/source4/heimdal_build/wscript_build
-@@ -131,7 +131,7 @@ def HEIMDAL_ASN1(name, source,
-             samba_cflags   = CURRENT_CFLAGS(bld, name, ''),
-             depends_on     = '',
-             samba_deps     = to_list('roken replace'),
--            samba_includes = includes + ["/usr/include/heimdal"],
-+            samba_includes = includes,
-             local_include  = True)
- 
- 
--- 
-2.20.1
-
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index beaf187bf0..a2bd32e383 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.10.11.tar.asc
-sha256 609f4232e04c6eaad0e3b8e00cd837683a960ebb95c1fe3349e968d1d1dff894  samba-4.10.11.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.10.13.tar.asc
+sha256 49eb6426e97cbf538e416e51ed8535930382512ad2d13d5ffd7f4336aa7faf63  samba-4.10.13.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 91155128b9..85cbf3a74a 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.10.11
+SAMBA4_VERSION = 4.10.13
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
