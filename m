From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  6 Mar 2017 19:12:00 +0100
Subject: [Buildroot] [PATCH 2/2] Revert "package/libcec: bump version to
	4.0.2"
In-Reply-To: <20170306181200.381-1-bernd.kuhls@t-online.de>
References: <20170306181200.381-1-bernd.kuhls@t-online.de>
Message-ID: <20170306181200.381-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit bf1c9828f2c7ef37a0af4da5532472fb7e03ba67.

This commit was part of the Kodi 17 series and was committed too early,
current Kodi 16 is incompatible with this bump and needs to be
reverted, fixes https://bugs.busybox.net/show_bug.cgi?id=9711

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcec/libcec.hash | 2 +-
 package/libcec/libcec.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcec/libcec.hash b/package/libcec/libcec.hash
index 5416c20fe..377f343a2 100644
--- a/package/libcec/libcec.hash
+++ b/package/libcec/libcec.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b8b8dd31f3ebdd5472f03ab7d401600ea0d959b1288b9ca24bf457ef60e2ba27  libcec-4.0.2.tar.gz
+sha256  0f29d5a2d155b507807ba896bc3b3e50a0ab56bf8f543a2bf5c2798c790292b5  libcec-2c675dac48387c48c7f43c5d2547ef0c4ef5c7dd.tar.gz
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index f00e10f5d..c9a05a5fb 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = 4.0.2
-LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
+LIBCEC_VERSION = 2c675dac48387c48c7f43c5d2547ef0c4ef5c7dd
+LIBCEC_SITE = $(call github,Pulse-Eight,libcec,$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPLv2+
 LIBCEC_LICENSE_FILES = COPYING
 
-- 
2.11.0
