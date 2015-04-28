From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Apr 2015 00:40:04 +0200
Subject: [Buildroot] [PATCH 7/7] package/xenomai: ignore custom versions
In-Reply-To: <cover.1430260630.git.yann.morin.1998@free.fr>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
Message-ID: <c7721b4bf0d66994d78b3ad75a5371bdbe390d9a.1430260630.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 package/xenomai/xenomai.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index ccbae35..17299ac 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -7,6 +7,9 @@
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 ifeq ($(XENOMAI_VERSION),)
 XENOMAI_VERSION = 2.6.4
+else
+# We can do that because it's a recursively-expanded variable
+BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
 endif
 
 XENOMAI_SITE = http://download.gna.org/xenomai/stable
-- 
1.9.1
