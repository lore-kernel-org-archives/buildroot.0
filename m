From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Nov 2018 10:21:20 +0100
Subject: [Buildroot] [git commit] package/glibc: update hash of LICENSES
 file for ARC version
Message-ID: <20181202071556.E93AC8843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b59a09503786f5c9c7387c3bcf44450a0a91edf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 5d4f23cbe65c79826b1b2071e972803a453934cb ("toolchain: Bump
ARC tools to arc-2018.09-rc1"), the glibc version for the ARC
architecture was bumped, but the hashes of the license files were not
updated accordingly, causing a build failure during "legal-info":

ERROR: LICENSES has wrong sha256 hash:
ERROR: expected: 61abdd6930c9c599062d89e916b3e7968783879b6be0ee1c6229dd6169def431
ERROR: got     : 35bdb41dc0bcb10702ddacbd51ec4c0fe6fb3129f734e8c85fc02e4d3eb0ce3f

The changes between the previous LICENSES file and the new one are:

 - The text related to libidn has been removed from the LICENSES file,
   following the switch to libidn2:

   https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=7f9f1ecb710eac4d65bb02785ddf288cac098323#patch2

 - The text related to stdio-common/tst-printf.c has been removed from
   the LICENSES file, following the removal of this non-free code from
   glibc:

   https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=5a357506659f9a00fcf5bc9c5d8fc676175c89a7#patch2

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/arc-2018.09-rc2/glibc.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/arc-2018.09-rc2/glibc.hash b/package/glibc/arc-2018.09-rc2/glibc.hash
index 4a8c4eae2b..9182271131 100644
--- a/package/glibc/arc-2018.09-rc2/glibc.hash
+++ b/package/glibc/arc-2018.09-rc2/glibc.hash
@@ -4,4 +4,4 @@ sha256  017dce426a4f4db2d77783e318c32f29b75b01e231f65052e10c7d935b8b22e3  glibc-
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  61abdd6930c9c599062d89e916b3e7968783879b6be0ee1c6229dd6169def431  LICENSES
+sha256  35bdb41dc0bcb10702ddacbd51ec4c0fe6fb3129f734e8c85fc02e4d3eb0ce3f  LICENSES
