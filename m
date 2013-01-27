From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 27 Jan 2013 17:21:45 +0100
Subject: [Buildroot] [git commit] polkit: don't build documentation and
	examples
Message-ID: <20130127162359.48E479A82E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e69cf9411d4f15abdee9ede99a21650c86de4830
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building the manpages of polkit fails with issues in xsltproc. Since
we are generally not that much interested in documentation, we disable
them. This solves the build issues like
http://autobuild.buildroot.org/results/751b71a594fa04924c7c3bb8f2c460ce1e44aa90/build-end.log.

While we're at it, we also disable the build of the polkit example
programs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/polkit/polkit.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

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
