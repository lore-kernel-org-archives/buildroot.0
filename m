From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Aug 2018 00:04:40 +0200
Subject: [Buildroot] [git commit] docs/manual: expand on why using a branch
 name is not supported
Message-ID: <20180824215656.D231E8E73D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2e00031412ec0c0968539bc1e0adb7fb9b0cd67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-generic.txt | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index cc91e894bd..7be1754f54 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -200,11 +200,24 @@ information is (assuming the package name is +libfoo+) :
   package. Note that if +HOST_LIBFOO_VERSION+ doesn't exist, it is
   assumed to be the same as +LIBFOO_VERSION+. It can also be a
   revision number or a tag for packages that are fetched directly
-  from their version control system. Do not use a branch name as
-  version; it does not work. Examples:
+  from their version control system. Examples:
   ** a version for a release tarball: +LIBFOO_VERSION = 0.1.2+
   ** a sha1 for a git tree: +LIBFOO_VERSION = cb9d6aa9429e838f0e54faa3d455bcbab5eef057+
   ** a tag for a git tree +LIBFOO_VERSION = v0.1.2+
++
+.Note:
+Using a branch name as +FOO_VERSION+ is not supported, because it does
+not and can not work as people would expect it should:
++
+  1. due to local caching, Buildroot will not re-fetch the repository,
+     so people who expect to be able to follow the remote repository
+     would be quite surprised and disappointed;
+  2. because two builds can never be perfectly simultaneous, and because
+     the remote repository may get new commits on the branch anytime,
+     two users, using the same Buildroot tree and building the same
+     configuration, may get different source, thus rendering the build
+     non reproducible, and people would be quite surprised and
+     disappointed.
 
 * +LIBFOO_SOURCE+ may contain the name of the tarball of the package,
   which Buildroot will use to download the tarball from
