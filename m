From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2014 19:05:40 +0200
Subject: [Buildroot] [git commit] manual: Add note about uses of github
	helper
Message-ID: <20141016170601.EA118B30AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e11ba97a724c571a28813312692781456cbb7093
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a little comment regarding the uses of the github helper for the releases.

[Arnout: extend the comment a little]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-tips.txt |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 0d4fcb0..0c6018a 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -52,3 +52,20 @@ FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
   Buildroot (e.g.: +foo-f6fb6654af62045239caed5950bc6c7971965e60.tar.gz+),
   so it is not necessary to specify it in the +.mk+ file.
 - When using a commit ID as version, you should use the full 40 hex characters.
+
+If the package you wish to add does have a release section on GitHub, the
+maintainer may have uploaded a release tarball, or the release may just point
+to the automatically generated tarball from the git tag. If there is a
+release tarball uploaded by the maintainer, we prefer to use that since it
+may be slightly different (e.g. it contains a configure script so we don't
+need to do AUTORECONF).
+
+You can see on the release page if it's an uploaded tarball or a git tag:
+- If there is a green download button, like
+  https://github.com/zedshaw/mongrel2/releases/tag/v1.9.1[mongrel2], then it
+  was uploaded by the maintainer and you should use the link of that button to
+  specify +FOO_SITE+.
+- If there is grey download button, like
+  https://github.com/xbmc/xbmc/releases/tag/13.2-Gotham[xbmc], then it's an
+  automatically generated tarball and you should use the 'github' helper
+  function.
