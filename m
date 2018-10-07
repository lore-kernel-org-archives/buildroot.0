From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Oct 2018 13:57:43 +0200
Subject: [Buildroot] [PATCH 6/6] docs/manual: document location of hash
 files for multi-versions packages
In-Reply-To: <cover.1538913431.git.yann.morin.1998@free.fr>
References: <cover.1538913431.git.yann.morin.1998@free.fr>
Message-ID: <e2b0c44702c93f2610f58c09fd8e1aeb41d594aa.1538913431.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Baruch Siach <baruch@tkos.co.il>
---
 docs/manual/adding-packages-directory.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index f5e1e313d5..761605eda9 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -444,6 +444,13 @@ contains the hashes of the downloaded files for the +libfoo+
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
 
-- 
2.14.1
