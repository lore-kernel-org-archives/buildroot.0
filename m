From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Oct 2012 21:25:45 +0200
Subject: [Buildroot] [git commit] Add FAQ entry how to properly add package
	from github.
Message-ID: <20121008192757.37AA0997E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a84840bfe9c8e00be6dbbed1d8c55a2a54cb13e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/faq.txt |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/docs/manual/faq.txt b/docs/manual/faq.txt
index 575d019..97a754b 100644
--- a/docs/manual/faq.txt
+++ b/docs/manual/faq.txt
@@ -36,3 +36,24 @@ then probably you are running a Fedora (or similar) distribution, and
 you should install the +glibc-static+ package. This is because the
 +module-init-tools+ build process wants to link statically against the
 C library.
+
+How to add package from github
+------------------------------
+
+If the package has no release version, or its version cannot be
+identified using tag, then the sha1 of the particular commit should be
+used to identify the version (the first 7 characters of the sha1 are
+enough):
+
+------------------------
+FOO_VERSION = 1234567
+FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>
+------------------------
+
+If the package version matches a tag, then this tag should be used to
+identify the version:
+
+------------------------
+FOO_VERSION = v1.0
+FOO_SITE = http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
+------------------------
