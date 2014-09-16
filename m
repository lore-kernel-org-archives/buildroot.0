From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Sep 2014 22:11:31 +0200
Subject: [Buildroot] [git commit] lttng-babeltrace: Fix comment display
Message-ID: <20140916201651.AC40B9D6B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53407f283127cde48eacd2777176cbeb5a68a9b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-babeltrace/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index fae49ab..ce776d1 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -30,4 +30,4 @@ comment "lttng-babeltrace needs a uclibc snapshot or (e)glib toolchain w/ wchar,
 	depends on BR2_PACKAGE_LTTNG_TOOLS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_UCLIBC_VERSION_SNAPSHOT || !BR2_TOOLCHAIN_USES_GLIBC
+		|| !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC)
