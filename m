From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Sep 2015 22:02:39 +0200
Subject: [Buildroot] [git commit] ebtables: migrated to netfilter.org
Message-ID: <20150901200659.51ECA7FF81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=480380cb0805f50d115527c59d6eb6d026b8f2a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ebtables moved out of sf.net. Update website link, download location, and
hashes reference.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ebtables/Config.in     |    2 +-
 package/ebtables/ebtables.hash |    5 ++---
 package/ebtables/ebtables.mk   |    2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
index 18fff24..3f7566a 100644
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_EBTABLES
 	help
 	  Ethernet bridge frame table administration
 
-	  http://ebtables.sourceforge.net
+	  http://ebtables.netfilter.org/
diff --git a/package/ebtables/ebtables.hash b/package/ebtables/ebtables.hash
index 75ab7db..4526276 100644
--- a/package/ebtables/ebtables.hash
+++ b/package/ebtables/ebtables.hash
@@ -1,3 +1,2 @@
-# From http://sourceforge.net/projects/ebtables/files/ebtables/ebtables-2-0-10-4/
-sha1	907d3b82329e8fbb7aaaa98049732bd8dab022f9	ebtables-v2.0.10-4.tar.gz
-md5	506742a3d44b9925955425a659c1a8d0		ebtables-v2.0.10-4.tar.gz
+# Locally computed
+sha256	dc6f7b484f207dc712bfca81645f45120cb6aee3380e77a1771e9c34a9a4455d	ebtables-v2.0.10-4.tar.gz
diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 99f9363..e6cdd26 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -6,7 +6,7 @@
 
 EBTABLES_VERSION = 2.0.10-4
 EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
-EBTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/ebtables/ebtables-$(subst .,-,$(EBTABLES_VERSION))
+EBTABLES_SITE = http://ftp.netfilter.org/pub/ebtables/
 EBTABLES_LICENSE = GPLv2+
 EBTABLES_LICENSE_FILES = COPYING
 EBTABLES_STATIC = $(if $(BR2_STATIC_LIBS),static)
