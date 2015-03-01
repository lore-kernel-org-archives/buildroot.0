From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Mar 2015 22:02:15 +0100
Subject: [Buildroot] [git commit] package/efl/libevas: add optional
	dependency on libfribidi
Message-ID: <20150301214632.E4C6A7FC7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a74ed49f661caebd51378b9ed9840be50b20ffdd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following message when libfribidi is enabled but not already
built:
Package fribidi was not found in the pkg-config search path.
Perhaps you should add the directory containing `fribidi.pc'
No package 'fribidi' found

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/libevas/libevas.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 40a01e7..10c3bc3 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -225,6 +225,13 @@ else
 LIBEVAS_CONF_OPTS += --disable-fontconfig
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
+LIBEVAS_CONF_OPTS += --enable-fribidi
+LIBEVAS_DEPENDENCIES += libfribidi
+else
+LIBEVAS_CONF_OPTS += --disable-fribidi
+endif
+
 # libevas installs the source code of examples on the target, which
 # are generally not useful.
 define LIBEVAS_REMOVE_EXAMPLES
