From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  6 Mar 2017 18:17:23 +0100
Subject: [Buildroot] [PATCH] package/python-pyliftdi: fix patch
Message-ID: <1488820643-21912-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 0001 patch introduces leading tabs, when the rest of the file is
using leading spaces, and python3 does not like that.

Fixes:
    http://autobuild.buildroot.org/results/e24/e24a8e6f62139ab0efbce7a32c3d88c2cba839c6/
    http://autobuild.buildroot.org/results/7b1/7b14c4bb4cac3ff006e77330cbd7b839ad80192a/
    http://autobuild.buildroot.org/results/67c/67cddfdb801e83acfd9f197f5661fd43fa38a092/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Christian Kellermann <christian.kellermann@solectrix.de>
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
  
-- 
2.7.4
