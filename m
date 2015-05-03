From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 May 2015 19:19:25 +0200
Subject: [Buildroot] [git commit] package/argp-standalone: is useless for
	(e)glibc toolchains
Message-ID: <20150503172941.F2B59818B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d1807f935b10001b9703c9614f3cd4f9b14d69e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to Thomas's remark [1], (e)glibc toolchains provide it's
own argp.h version.
Also, it appears that argp.h from glibc is more up to date should
be preferred to argp-standalone one.

[1] http://lists.busybox.net/pipermail/buildroot/2015-May/127511.html

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/argp-standalone/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/argp-standalone/Config.in b/package/argp-standalone/Config.in
index 5a0c051..3319dd9 100644
--- a/package/argp-standalone/Config.in
+++ b/package/argp-standalone/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_ARGP_STANDALONE
 	bool "argp-standalone"
+	# glibc provides its own argp implementation.
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Glibc hierarchical argument parsing standalone library.
 
