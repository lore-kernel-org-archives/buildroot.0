From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Aug 2018 18:33:04 +0200
Subject: [Buildroot] [PATCH 2/3] docs/manual: expand on why using a branch
 name is not supported
In-Reply-To: <cover.1533400367.git.yann.morin.1998@free.fr>
References: <cover.1533400367.git.yann.morin.1998@free.fr>
Message-ID: <7f01fc03df91561ce5163e1e300d36f2c642f913.1533400367.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 docs/manual/adding-packages-generic.txt | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index cc91e894bd..b17d225a3e 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -200,11 +200,22 @@ information is (assuming the package name is +libfoo+) :
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
+  1. Due to local caching, Buildroot will not re-fetch the repository,
+     so people that expect to be able to follow the remote repository
+     will be quite surprised and disapointed;
+  2. if the user removes the local cache, then the build is no longer
+     reproducible, because the remote repository may change any time
+     between two builds, and people will be quite surprised and
+     disapointed.
 
 * +LIBFOO_SOURCE+ may contain the name of the tarball of the package,
   which Buildroot will use to download the tarball from
-- 
2.14.1
