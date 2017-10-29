From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 18:14:40 +0100
Subject: [Buildroot] [PATCH 5/5] docs/manual: update the documentation about
	test-pkg
In-Reply-To: <20171029171440.8095-1-thomas.petazzoni@free-electrons.com>
References: <20171029171440.8095-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171029171440.8095-6-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-tips.txt | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 824f07547d..113172d0ab 100644
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
2.13.6
