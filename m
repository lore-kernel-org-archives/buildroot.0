From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 23:11:45 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/exiv2: really
 disable samples
Message-ID: <20200721210859.F14987FC7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5aeafd86d228f5a0b6d7ffa4a6b369548eb6403
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

EXIV2_ENABLE_BUILD_SAMPLES has been renamed into EXIV2_BUILD_SAMPLES
since version 0.27 and
https://github.com/Exiv2/exiv2/commit/60d436c96960fa314e2d12d017440253ce280d51

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 918842133127e1f95a7ba5e8832d81f439c0cff3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exiv2/exiv2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 5ca16c4747..2b2e534c38 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -21,7 +21,7 @@ EXIV2_IGNORE_CVES += CVE-2019-17402
 # 0002-fix_1011_jp2_readmetadata_loop.patch
 EXIV2_IGNORE_CVES += CVE-2019-20421
 
-EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
+EXIV2_CONF_OPTS += -DEXIV2_BUILD_SAMPLES=OFF
 
 # The following CMake variable disables a TRY_RUN call in the -pthread
 # test which is not allowed when cross-compiling.
