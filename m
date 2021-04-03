From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 09:47:23 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] docs/manual: add
 documentation for the gitlab macro
Message-ID: <20210403072612.8D0A88AF32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a59ee82c9a02d6bb26bdf640514a29fae10030ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1e12cc90a750fe6b430668bf3c1c3819e299af2a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-tips.txt | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 6e4241d570..d8c2eceb10 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -210,3 +210,33 @@ image::github_hash_mongrel2.png[]
 - On the other hand, if there's is *only* the "Source code" link, then
   it's an automatically generated tarball and you should use the
   'github' helper function.
+
+[[gitlab-download-url]]
+==== How to add a package from Gitlab
+
+In a similar way to the +github+ macro described in
+xref:github-download-url[], Buildroot also provides the +gitlab+ macro
+to download from Gitlab repositories. It can be used to download
+auto-generated tarballs produced by Gitlab, either for specific tags
+or commits:
+
+------------------------
+# Use a tag or a full commit ID
+FOO_VERSION = 1.0
+FOO_SITE = $(call gitlab,<user>,<package>,v$(FOO_VERSION))
+------------------------
+
+By default, it will use a +.tar.gz+ tarball, but Gitlab also provides
++.tar.bz2+ tarballs, so by adding a +<pkg>_SOURCE+ variable, this
++.tar.bz2+ tarball can be used:
+
+------------------------
+# Use a tag or a full commit ID
+FOO_VERSION = 1.0
+FOO_SITE = $(call gitlab,<user>,<package>,v$(FOO_VERSION))
+FOO_SOURCE = foo-$(FOO_VERSION).tar.bz2
+------------------------
+
+If there is a specific tarball uploaded by the upstream developers in
++https://gitlab.com/<project>/releases/+, do not use this macro, but
+rather use directly the link to the tarball.
