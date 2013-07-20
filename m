From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 20 Jul 2013 21:10:33 +0200
Subject: [Buildroot] [git commit] ebtables: fix download url
Message-ID: <20130720191900.1BE8F9A657@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75ae8a40129b03ca329e49b091f827348bf01ce2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ebtables/ebtables.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 0b3fba6..ddc1f45 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -6,7 +6,7 @@
 
 EBTABLES_VERSION = 2.0.10-4
 EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
-EBTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/ebtables/ebtables-$(EBTABLES_VERSION)
+EBTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/ebtables/ebtables-$(subst .,-,$(EBTABLES_VERSION))
 EBTABLES_LICENSE = GPLv2
 EBTABLES_LICENSE_FILES = COPYING
 EBTABLES_STATIC = $(if $(BR2_PREFER_STATIC_LIB),static)
