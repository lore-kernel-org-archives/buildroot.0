From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Feb 2020 18:17:37 +0100
Subject: [Buildroot] [git commit] package/boost: annotate _IGNORE_CVES for
 CVE-2009-3654
Message-ID: <20200229170651.B14098EF36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8c5660a818c9a367e46d4188f5f87b2dfe74a71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This CVE does not affect the boost package, but is misclassified by our
CVS tracker. As per the advisory:

    Unspecified vulnerability in Boost before 6.x-1.03, a module for
    Drupal, allows remote attackers to create new webroot directories
    via unknown attack vectors.

Ignore the CVS, and expand a comment to explain it.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: expand the comment]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/boost/boost.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 322429a10c..2daf7f5a96 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -11,6 +11,10 @@ BOOST_INSTALL_STAGING = YES
 BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
 
+# CVE-2009-3654 is misclassified (by our CVE tracker) as affecting to boost,
+# while in fact it affects Drupal (a module called boost in there).
+BOOST_IGNORE_CVES += CVE-2009-3654
+
 # keep host variant as minimal as possible
 HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
