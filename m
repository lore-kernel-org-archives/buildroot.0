From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 12 Dec 2015 14:33:21 +0100
Subject: [Buildroot] [PATCH v9 18/32] package/efl: libefl and libelementary
	share the same version number
In-Reply-To: <1449927215-3452-1-git-send-email-romain.naour@openwide.fr>
References: <1449927215-3452-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1449927215-3452-19-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v6: Even if we are not sure if libefl and libelementary will always
    be released in tandem, keep it in sync since there is no reason
    to use a different version.
---
 package/efl/efl.mk                         | 2 ++
 package/efl/libefl/libefl.mk               | 3 +--
 package/efl/libelementary/libelementary.mk | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 99e4d14..151ac28 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -1,2 +1,4 @@
 
+EFL_VERSION = 1.15.2
+
 include $(sort $(wildcard package/efl/*/*.mk))
diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index 5e8009e..c60a507 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-# hardcode the version here since the bump to 1.15 is not complete in Buildroot
-LIBEFL_VERSION = 1.15.2
+LIBEFL_VERSION = $(EFL_VERSION)
 LIBEFL_SOURCE = efl-$(LIBEFL_VERSION).tar.xz
 LIBEFL_SITE = http://download.enlightenment.org/rel/libs/efl
 LIBEFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index 4ba8681..c920801 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBELEMENTARY_VERSION = 1.15.2
+LIBELEMENTARY_VERSION = $(EFL_VERSION)
 LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.xz
 LIBELEMENTARY_SITE = http://download.enlightenment.org/rel/libs/elementary
 LIBELEMENTARY_LICENSE = LGPLv2.1
-- 
2.4.3
