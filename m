From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:44:11 +0200
Subject: [Buildroot] [git commit] package/poco: Update check for uclibc
	toolchain
Message-ID: <20170924140311.87B6C80DE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4badc2a6bc6c8c91db6421081a68b3ffc96c3158
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LIBC is really only used to construct the target tuple. To check if we
are using a uClibc toolchain, we use BR2_TOOLCHAIN_USES_UCLIBC.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/poco/poco.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 673b93a..29752e2 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -28,7 +28,7 @@ POCO_OMIT = Data/ODBC PageCompiler \
 	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL) \
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite)
 
-ifeq ($(LIBC),uclibc)
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 POCO_CONF_OPTS += --no-fpenvironment --no-wstring
 endif
 
