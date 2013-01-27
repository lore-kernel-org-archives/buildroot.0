From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jan 2013 16:07:19 +0100
Subject: [Buildroot] [PATCH] polkit: don't build documentation and examples
Message-ID: <1359299240-19915-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building the manpages of polkit fails with issues in xsltproc. Since
we are generally not that much interested in documentation, we disable
them. This solves the build issues like
http://autobuild.buildroot.org/results/751b71a594fa04924c7c3bb8f2c460ce1e44aa90/build-end.log.

While we're at it, we also disable the build of the polkit example
programs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/polkit/polkit.mk |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 3eb0422..54782dd 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -16,6 +16,8 @@ POLKIT_DEPENDENCIES = libglib2 host-intltool expat
 # We could also support --with-authfw=pam
 POLKIT_CONF_OPT = \
 	--with-authfw=shadow \
-	--with-os-type=unknown
+	--with-os-type=unknown \
+	--disable-man-pages \
+	--disable-examples
 
 $(eval $(autotools-package))
-- 
1.7.9.5
