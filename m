From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:03:29 +0200
Subject: [Buildroot] [PATCH 05/26] package/nut: bump to latest stable
In-Reply-To: <cover.1401656581.git.yann.morin.1998@free.fr>
References: <cover.1401656581.git.yann.morin.1998@free.fr>
Message-ID: <daee3e8a13a34d66d8e73b3ffda773631cbf57ed.1401656581.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Our patch is still valid, but it now builds fine with // builds
(tested many times with up to 128 // jobs, without failure.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/nut/nut.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index b318258..6249eec 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NUT_VERSION_MAJOR = 2.6
-NUT_VERSION = $(NUT_VERSION_MAJOR).5
+NUT_VERSION_MAJOR = 2.7
+NUT_VERSION = $(NUT_VERSION_MAJOR).2
 NUT_SITE = http://www.networkupstools.org/source/$(NUT_VERSION_MAJOR)/
 NUT_LICENSE = GPLv2+, GPLv3+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
@@ -14,9 +14,6 @@ NUT_DEPENDENCIES = host-pkgconf
 # Our patch changes m4 macros, so we need to autoreconf
 NUT_AUTORECONF = YES
 
-# Disable parallel builds
-NUT_MAKE = $(MAKE1)
-
 # Put the PID files in a read-write place (/var/run is a tmpfs)
 # since the default location (/var/state/ups) maybe readonly.
 NUT_CONF_OPT = \
-- 
1.8.3.2
