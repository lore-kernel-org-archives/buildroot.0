From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Dec 2013 21:29:10 +0100
Subject: [Buildroot] [PATCH 2 of 6] tzdata: add missing comment for
 toolchain option dependencies
In-Reply-To: <patchbomb.1387398548@argentina>
References: <patchbomb.1387398548@argentina>
Message-ID: <e5894a88578034cc47b4.1387398550@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/tzdata/Config.in |  3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/tzdata/Config.in b/package/tzdata/Config.in
--- a/package/tzdata/Config.in
+++ b/package/tzdata/Config.in
@@ -1,3 +1,6 @@
+comment "tzdata needs an (e)glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 config BR2_PACKAGE_TZDATA
 	bool "tzdata"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
