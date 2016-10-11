From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Oct 2016 11:21:59 +0200
Subject: [Buildroot] [git commit] Revert "Revert "libglib2: add
	host-util-linux for host variant""
Message-ID: <20161011092220.AFA447FD0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bec4e518be7dc094b9158973c3d34acd2ca95a79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 2f556ab99f51a0b90183610a7fecb9ed22ed4aa3.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglib2/libglib2.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 5bc6ed5..f199a4a 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -105,7 +105,12 @@ LIBGLIB2_DEPENDENCIES = \
 	libffi pcre util-linux zlib $(if $(BR2_NEEDS_GETTEXT),gettext)
 
 HOST_LIBGLIB2_DEPENDENCIES = \
-	host-gettext host-libffi host-pcre host-pkgconf host-zlib
+	host-gettext \
+	host-libffi \
+	host-pcre \
+	host-pkgconf \
+	host-util-linux \
+	host-zlib
 
 LIBGLIB2_CONF_OPTS = \
 	--with-pcre=system
