From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 1 Feb 2011 11:52:10 +0800
Subject: [Buildroot] [PATCH] buildroot:package: Remove configure target
	parameter in Makefile.autotools.in
Message-ID: <1296532330-24961-1-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

configure parameter --target has different meaning from buildroot environment
parameter GNU_TARGET_NAME. GNU_TARGET_NAME is actually equal to --host.

  --build=BUILD     configure for building on BUILD [guessed]
  --host=HOST       cross-compile to build programs to run on HOST [BUILD]
  --target=TARGET   configure for building compilers for TARGET [HOST]

--target is rarely used by most packages and is redundant in configure line.
If some packages do need --target, they can append it to buildroot environment
parameter INETUTILS_CONF_OPT in packages' makefile.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/Makefile.autotools.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index d445348..151e5cf 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -87,7 +87,6 @@ define $(2)_CONFIGURE_CMDS
 	$$(TARGET_CONFIGURE_ARGS) \
 	$$($$(PKG)_CONF_ENV) \
 	./configure \
-		--target=$$(GNU_TARGET_NAME) \
 		--host=$$(GNU_TARGET_NAME) \
 		--build=$$(GNU_HOST_NAME) \
 		--prefix=/usr \
-- 
1.7.0.4
