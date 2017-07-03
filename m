From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jul 2017 21:59:32 +0200
Subject: [Buildroot] [git commit] libpwquality: select cracklib
Message-ID: <20170703195842.160DA817B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6b49a7e8cf09e2f01790d39f216d43fa3f3ea4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libpwquality adds cracklib to its _DEPENDENCIES, but forgot to select it in
Config.in, leading to build failures if cracklib isn't explicitly enabled:

Makefile:536: *** cracklib is in the dependency chain of libpwquality that
has added it to its _DEPENDENCIES variable without selecting it or depending
on it from Config.in.  Stop.

No autobuilder references as this error happens before build-time.log is
written, causing the autobuilder to ignore the build result.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpwquality/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libpwquality/Config.in b/package/libpwquality/Config.in
index 4e85525..23e1515 100644
--- a/package/libpwquality/Config.in
+++ b/package/libpwquality/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBPWQUALITY
 	bool "libpwquality"
+	select BR2_PACKAGE_CRACKLIB
 	help
 	  This is a library for password quality checks and generation
 	  of random passwords that pass the checks.  This library uses
