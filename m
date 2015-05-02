From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  2 May 2015 12:28:06 +0200
Subject: [Buildroot] [PATCH 2/2] package/argp-standalone: is useless for
	(e)glibc toolchains
In-Reply-To: <1430562486-23625-1-git-send-email-romain.naour@openwide.fr>
References: <1430562486-23625-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1430562486-23625-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to Thomas's remark [1], (e)glibc toolchains provide it's
own argp.h version.
Also, it appears that argp.h from glibc is more up to date should
be preferred to argp-standalone one.

[1] http://lists.busybox.net/pipermail/buildroot/2015-May/127511.html

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
Note: I didn't add a comment in Config.in to tell that argp-standalone
      package is useless for (e)glibc toolchains.
---
 package/argp-standalone/Config.in | 2 ++
 1 file changed, 2 insertions(+)

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
 
-- 
1.9.3
