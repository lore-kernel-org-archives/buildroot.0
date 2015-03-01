From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Mar 2015 22:02:31 +0100
Subject: [Buildroot] [git commit] package/libfribidi: add optional
	dependency on libglib2
Message-ID: <20150301214632.F2F1E7FC7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2eca9eb907dfe376946a814d53d53f48051815f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following message when libglib2 is enabled but not already
built:
Package glib-2.0 was not found in the pkg-config search path.
Perhaps you should add the directory containing `glib-2.0.pc'
No package 'glib-2.0' found

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfribidi/libfribidi.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 20a5df0..12e7664 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -15,4 +15,10 @@ LIBFRIBIDI_INSTALL_STAGING = YES
 LIBFRIBIDI_AUTORECONF = YES
 LIBFRIBIDI_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+ LIBFRIBIDI_DEPENDENCIES += libglib2
+else
+ LIBFRIBIDI_CONF_OPTS += --with-glib=no
+endif
+
 $(eval $(autotools-package))
