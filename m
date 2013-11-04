From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Nov 2013 22:46:56 +0100
Subject: [Buildroot] [git commit] sqlite: Disable dynamic extention if
	static library is seleted
Message-ID: <20131104214740.C6CCF8179D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd56cd6b4cc75511ffacfe020a8de3c1aad44fc9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 5fc1e9e..c20e782 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -42,6 +42,10 @@ SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
 SQLITE_CONF_OPT = \
 	--localstatedir=/var
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+SQLITE_CONF_OPT += --enable-dynamic-extensions=no
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 SQLITE_CONF_OPT += --enable-threadsafe
 else
