From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 21:14:14 +0100
Subject: [Buildroot] [git commit] package/python-pyliftdi: fix patch
Message-ID: <20170306201422.9DB72822A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0025e7961df22dfc5761561b67756ec49680e4f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 0001 patch introduces leading tabs, when the rest of the file is
using leading spaces, and python3 does not like that.

Fixes:
    http://autobuild.buildroot.org/results/e24/e24a8e6f62139ab0efbce7a32c3d88c2cba839c6/
    http://autobuild.buildroot.org/results/7b1/7b14c4bb4cac3ff006e77330cbd7b839ad80192a/
    http://autobuild.buildroot.org/results/67c/67cddfdb801e83acfd9f197f5661fd43fa38a092/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Christian Kellermann <christian.kellermann@solectrix.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pylibftdi/0001-do-not-use-find-library.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pylibftdi/0001-do-not-use-find-library.patch b/package/python-pylibftdi/0001-do-not-use-find-library.patch
index ae8fe2d..192ed43 100644
--- a/package/python-pylibftdi/0001-do-not-use-find-library.patch
+++ b/package/python-pylibftdi/0001-do-not-use-find-library.patch
@@ -24,7 +24,7 @@ diff -purN pylibftdi-0.15.0.orig/pylibftdi/driver.py pylibftdi-0.15.0/pylibftdi/
          if lib is None:
 -            raise LibraryMissingError('{} library not found (search: {})'.format(
 -                name, search_list))
-+		return cdll.LoadLibrary(name + '.so')
++            return cdll.LoadLibrary(name + '.so')
 +
          return lib
  
