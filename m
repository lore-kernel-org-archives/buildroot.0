From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 May 2013 14:13:28 +0200
Subject: [Buildroot] [git commit] jamvm: Not available for all architectures
Message-ID: <20130528121540.2A1B09A610@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c3b24797a1a369819ed21f8fffcb8e26c5c867d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

jamvm supports arm, armeb, powerpc, i386, x86_64 and mipsel.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jamvm/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
index 0287f80..3a2bd20 100644
--- a/package/jamvm/Config.in
+++ b/package/jamvm/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_JAMVM
 	bool "jamvm"
 	depends on BR2_INET_IPV6
+	depends on BR2_arm || BR2_armeb || BR2_i386 \
+		|| BR2_mipsel || BR2_powerpc || BR2_x86_64
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_CLASSPATH
 	help
