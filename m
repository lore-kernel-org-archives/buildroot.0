From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Oct 2015 22:29:38 +0200
Subject: [Buildroot] [PATCH v4 22/35] package/efl: libefl and libelementary
	share the same version number
In-Reply-To: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
References: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445200191-18404-23-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
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
index c26c9c5..02ae3e0 100644
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
