From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 20:04:06 +0200
Subject: [Buildroot] [git commit] docs/manual: document location of hash
 files for multi-versions packages
Message-ID: <20181020180239.68D9B7FF87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e293a63868741428f0d324f7f0117791d7eaefb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-directory.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 9f85ac63e6..e6201bb86b 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -446,6 +446,13 @@ contains the hashes of the downloaded files for the +libfoo+
 package. The only reason for not adding a +.hash+ file is when hash
 checking is not possible due to how the package is downloaded.
 
+When a package has a version selection choice, then the hash file may be
+stored in a subdirectory named after the version, e.g.
++package/libfoo/1.2.3/libfoo.hash+. This is especially important if the
+different versions have different licensing terms, but they are stored
+in the same file. Otherwise, the hash file should stay in the package's
+directory.
+
 The hashes stored in that file are used to validate the integrity of the
 downloaded files and of the license files.
 
