From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 13 Feb 2019 22:05:04 +0100
Subject: [Buildroot] [PATCH] package/mender: change to use release archive
In-Reply-To: <y>
References: <y>
Message-ID: <20190213210504.18032-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Relase archive is distributed with depencies, this prevents the go
build system to download them.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/mender/mender.hash | 2 +-
 package/mender/mender.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index d1531d5d7d..89aec239b1 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 caee18d1b8446df0cbb9a9c5a1c040d7eb1924332da94c3489494443a8077eb8 mender-1.7.0.tar.gz
+sha256 caee18d1b8446df0cbb9a9c5a1c040d7eb1924332da94c3489494443a8077eb8 1.7.0.tar.gz
 
 # Apache-2.0 license, locally computed
 sha256 98ed35b5a138f58164b5c0dbccd9d7f01ef4d84b9dba01e896f0a3241c50c0f7 LICENSE
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index ae5bcb8101..cd18c0055a 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 MENDER_VERSION = 1.7.0
-MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
+MENDER_SITE = https://github.com/mendersoftware/mender/archive
+MENDER_SOURCE = $(MENDER_VERSION).tar.gz
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
 
 # Vendor license paths generated with:
-- 
2.17.1
