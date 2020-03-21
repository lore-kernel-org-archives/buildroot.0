From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2020 17:48:53 +0100
Subject: [Buildroot] [git commit] package/boinc: drop comment about server
 having no versioning
Message-ID: <20200321163724.D44F4839D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=053f6884492ffb5f41489a76aae56724430e2f73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package only ever builds the client; it builds neither the server
nor the manager.

Drop the comment altogether.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: drop the comment altogether]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/boinc/boinc.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index b6a9374715..3dc1ea65ad 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -6,9 +6,6 @@
 
 BOINC_VERSION_MAJOR = 7.16
 BOINC_VERSION = $(BOINC_VERSION_MAJOR).5
-# client_release can be used to build the Client and Manager but not the Server
-# part. The Server currently has no versioning (see
-# https://github.com/BOINC/boinc/pull/1798).
 BOINC_SITE = \
 	$(call github,BOINC,boinc,client_release/$(BOINC_VERSION_MAJOR)/$(BOINC_VERSION))
 BOINC_LICENSE = LGPL-3.0+
