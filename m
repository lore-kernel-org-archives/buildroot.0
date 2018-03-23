From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Mar 2018 22:48:15 +0100
Subject: [Buildroot] [PATCH v2 3/3] docs/manual: update the documentation
 about test-pkg
In-Reply-To: <20180323214815.19831-1-thomas.petazzoni@bootlin.com>
References: <20180323214815.19831-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180323214815.19831-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
2.14.3
