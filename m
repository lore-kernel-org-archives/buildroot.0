From: Heiko Stuebner <heiko@sntech.de>
Date: Mon, 23 Nov 2020 11:07:51 +0100
Subject: [Buildroot] [PATCH RESEND] package/icu: bump to version 68-1
Message-ID: <20201123100751.4095539-1-heiko@sntech.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

This includes the fix [0] for CVE-2020-10531 .

[0] https://github.com/unicode-org/icu/commit/b7d08bc04a4296982fcef8b6b8a354a9e4e7afca

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
I'm not sure if I did something wrong in the initial submission,
but so far got no response at all, so am including some more
people who recently committed changes to icu.

As this fixes a CVE, I guess this might need some sort of priority.

 package/icu/icu.hash | 2 +-
 package/icu/icu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 5c10008d8a..8067b8e217 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  94a80cd6f251a53bd2a997f6f1b5ac6653fe791dfab66e1eb0227740fb86d5dc  icu4c-67_1-src.tgz
+sha256  a9f2e3d8b4434b8e53878b4308bd1e6ee51c9c7042e2b1a376abefb6fbb29f2d  icu4c-68_1-src.tgz
 sha256  25e21013a7bc2fad735e28c5278a120e4c7f1c327c8c8b9b4df1751748cddbb2  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index c07ca2da3b..8d0288578c 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,7 +7,7 @@
 # Git tags (and therefore versions on release-monitoring.org) use the
 # XX-Y format, but the tarballs are named XX_Y and the containing
 # directories XX.Y.
-ICU_VERSION = 67-1
+ICU_VERSION = 68-1
 ICU_SOURCE = icu4c-$(subst -,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
-- 
2.28.0
