From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 16:30:37 +0200
Subject: [Buildroot] [git commit] docs/manual: update the documentation
 about test-pkg
Message-ID: <20180401143040.3E6DA80FF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8c16d9c4f9d19236f6919edee60e6acd2871e38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-tips.txt | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 19577fa821..f37f9874e7 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -77,9 +77,14 @@ and what package to test:
 $ ./utils/test-pkg -c libcurl.config -p libcurl
 ----
 
-This will try to build your package against all the toolchains used
-by the autobuilders (except for the internal toolchains, because it takes
-too long to do so). The output lists all toolchains and the corresponding
+By default, +test-pkg+ will build your package against a subset of the
+toolchains used by the autobuilders, which has been selected by the
+Buildroot developers as being the most useful and representative
+subset. If you want to test all toolchains, pass the +-a+ option. Note
+that in any case, internal toolchains are excluded as they take too
+long to build.
+
+The output lists all toolchains that are tested and the corresponding
 result (excerpt, results are fake):
 
 ----
