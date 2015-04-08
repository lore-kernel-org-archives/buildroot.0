From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Apr 2015 18:57:21 +0200
Subject: [Buildroot] [PATCH 6/8 v4] package/uclibc: ignore missing hash for
	snapshots
In-Reply-To: <cover.1428512075.git.yann.morin.1998@free.fr>
References: <cover.1428512075.git.yann.morin.1998@free.fr>
Message-ID: <17515f799ca33cad357949df9926d260187d57b4.1428512075.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We can't have a hash for snapshots, so add them to the exclusion list.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/uclibc/uclibc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 72a46d9..1ec8b10 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -11,6 +11,7 @@ UCLIBC_LICENSE_FILES = COPYING.LIB
 
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 UCLIBC_SITE = http://www.uclibc.org/downloads/snapshots
+BR_NO_CHECK_HASH_FOR += uClibc-$(UCLIBC_VERSION).tar.xz
 else ifeq ($(BR2_UCLIBC_VERSION_NG),y)
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
-- 
1.9.1
