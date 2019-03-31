From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 Mar 2019 19:48:24 +0200
Subject: [Buildroot] [PATCH 2/2] [AUTOBUILD] autobuild-run: also copy
 packages files lists if they exist
In-Reply-To: <cover.1554054435.git.yann.morin.1998@free.fr>
References: <cover.1554054435.git.yann.morin.1998@free.fr>
Message-ID: <1414cf2855df133bd02c1a32d8ebe3e632f37734.1554054435.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 scripts/autobuild-run | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index b65d8fb..3523772 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -485,6 +485,9 @@ def send_results(result, **kwargs):
                             os.path.join(resultdir, src if dst is None else dst))
 
     copy_if_exists("build", "build-time.log")
+    copy_if_exists("build", "packages-file-list.txt")
+    copy_if_exists("build", "packages-file-list-host.txt")
+    copy_if_exists("build", "packages-file-list-staging.txt")
     copy_if_exists("legal-info", "manifest.csv", "licenses-manifest.csv")
 
     subprocess.call(["git log -n 1 --pretty=format:%%H > %s" % \
-- 
2.14.1
