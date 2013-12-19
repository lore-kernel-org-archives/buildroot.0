From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2013 21:41:01 +0100
Subject: [Buildroot] [git commit] tzdata: add missing comment for toolchain
	option dependencies
Message-ID: <20131219204307.00AF59C0AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39fb8b70184c01d3bcf11df21b8c19e2922b9898
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdata/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/tzdata/Config.in b/package/tzdata/Config.in
index dec5f86..72615d3 100644
--- a/package/tzdata/Config.in
+++ b/package/tzdata/Config.in
@@ -1,3 +1,6 @@
+comment "tzdata needs an (e)glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 config BR2_PACKAGE_TZDATA
 	bool "tzdata"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
