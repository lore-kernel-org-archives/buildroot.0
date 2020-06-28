From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 28 Jun 2020 06:44:55 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/dropbear: fix license infos
In-Reply-To: <20200628044455.336639-1-francois.perrad@gadz.org>
References: <20200628044455.336639-1-francois.perrad@gadz.org>
Message-ID: <20200628044455.336639-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this package allows to use optionally bundled libraries (which is exceptional in BR).
so, license infos must be conditional.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dropbear/dropbear.hash | 2 ++
 package/dropbear/dropbear.mk   | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 4b22e0ddd..af69cec53 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -3,3 +3,5 @@ sha256  d927941b91f2da150b2033f1a88b6a47999bf0afb1493a73e9216cffdb5d7949  dropbe
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
+sha256  8f196cb13afd271f5e267fd29543fc454596382ad580e7592709492843996ac8  libtomcrypt/LICENSE
+sha256  2fa64b163659f41965c9815882a8296d3d03ff546b76153e11445f9bdecf955a  libtommath/LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 3120943c0..d0158f022 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -7,8 +7,13 @@
 DROPBEAR_VERSION = 2020.80
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
+ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
+DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain, Unlicense, WTFPL
+DROPBEAR_LICENSE_FILES = LICENSE, libtommath/LICENSE, libtomcrypt/LICENSE
+else
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
 DROPBEAR_LICENSE_FILES = LICENSE
+endif
 DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
 DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
 
-- 
2.25.1
