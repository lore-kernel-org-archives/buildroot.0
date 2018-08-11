From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 10 Aug 2018 20:02:26 -0500
Subject: [Buildroot] [PATCH] support/testing/infra: rm extra log flush in
 builder.py
Message-ID: <1533949346-7465-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While integrating proxy support in builder.py, a log flush
was left in the code.  This commit cleans/removes that code.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 support/testing/infra/builder.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index 30230fd..fc318fe 100644
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
-- 
1.9.1
