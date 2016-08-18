From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Aug 2016 23:01:22 +0200
Subject: [Buildroot] [PATCH 2/2] package/lldpd: explicit optional
	dependencies
In-Reply-To: <1471554082-24303-1-git-send-email-yann.morin.1998@free.fr>
References: <1471554082-24303-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1471554082-24303-2-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

check and valgrind are optional depenencies of lldpd, so we must depend
on them when either is enabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - add optional dependency on valgrind  (Arnout)

---
PS. Arnout, I did not carry your reviewd-by tag, since I changed the
patch to also add the dependency on valgrind.
---
 package/lldpd/lldpd.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 7613f9e..349c556 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -12,6 +12,14 @@ LLDPD_LICENSE_FILES = README.md
 # 0002-configure-do-not-check-for-libbsd.patch
 LLDPD_AUTORECONF = YES
 
+ifeq ($(BR2_PACKAGE_CHECK),y)
+LLDPD_DEPENDENCIES += check
+endif
+
+ifeq ($(BR2_PACKAGE_VALGRIND),y)
+LLDPD_DEPENDENCIES += valgrind
+endif
+
 # Detection of c99 support in configure fails without WCHAR. To enable
 # automatic detection of c99 support by configure, we need to enable
 # WCHAR in toolchain. But actually we do not need WCHAR at lldpd
-- 
2.7.4
