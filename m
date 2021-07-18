From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:29:51 +0200
Subject: [Buildroot] [git commit] package/spice: drop duplicated opus
 handling
Message-ID: <20210718205611.E997C88308@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=929c977afb212eebdee07ae1333b3aaf0f660021
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

opus dependency is handled twice since commit
f33f7a4f6407f624edb4b4ffe54cb09e029a49b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spice/spice.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index ab35265ab4..5f7bcd9d2f 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -45,11 +45,6 @@ else
 SPICE_CONF_OPTS += --disable-opus
 endif
 
-# no enable/disable, detected using pkg-config
-ifeq ($(BR2_PACKAGE_OPUS),y)
-SPICE_DEPENDENCIES += opus
-endif
-
 # We need to tweak spice.pc because it /forgets/ (for static linking) that
 # it should link against libz and libjpeg. libz is pkg-config-aware, while
 # libjpeg isn't, hence the two-line tweak
