From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 17:24:52 +0100
Subject: [Buildroot] [git commit] libqmi: fix autobuild failures
Message-ID: <20131111162620.4474E9BBC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a3bff298e0026fbbbea46aea1a859a30691a560
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libqmi build specifies -Werror in the CFLAGS by default. This causes
build failures such as the following.

  http://autobuild.buildroot.net/results/070/070449299aa9025c4bc6769524a6e22d66c92a65/

The -Werror flag can be disabled using a configuration switch.

[Peter: use =no instead and add a comment explaining why]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libqmi/libqmi.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 911b1a7..4f3f9a9 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -13,4 +13,7 @@ LIBQMI_INSTALL_STAGING = YES
 
 LIBQMI_DEPENDENCIES = libglib2
 
+# we don't want -Werror
+LIBQMI_CONF_OPT = --enable-more-warnings=no
+
 $(eval $(autotools-package))
