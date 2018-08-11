From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Aug 2018 12:38:45 +0200
Subject: [Buildroot] [git commit branch/next] support/testing/infra: rm
 extra log flush in builder.py
Message-ID: <20180811103211.002658B873@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b25c39ebd98b824a5e3aba0ee4a73f3179b40c5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

While integrating proxy support in builder.py, a log flush
was left in the code.  This commit cleans/removes that code.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/builder.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index 30230fdb17..fc318fe26e 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -38,7 +38,6 @@ class Builder(object):
         if "http_proxy" in os.environ:
             self.logfile.write("Using system proxy: " +
                                os.environ["http_proxy"] + "\n")
-            self.logfile.flush()
             env['http_proxy'] = os.environ["http_proxy"]
             env['https_proxy'] = os.environ["http_proxy"]
         cmd = ["make", "-C", self.builddir]
