From: Atharva Lele <itsatharva@gmail.com>
Date: Tue,  6 Aug 2019 23:42:49 +0530
Subject: [Buildroot] [PATCH 4/6] autobuild-run: make diffoscope output to a
 JSON-formatted file
In-Reply-To: <20190806181251.21885-1-itsatharva@gmail.com>
References: <20190806181251.21885-1-itsatharva@gmail.com>
Message-ID: <20190806181251.21885-4-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Normal diffoscope output is readable by humans but not really
convenient when working with it in code. JSON can be easily
read and extracted information from.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 69766b2..520cfe2 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -453,7 +453,7 @@ class Builder:
                 prefix = prefix[13:-1]
                 log_write(self.log, "INFO: running diffoscope on images")
                 subprocess.call(["diffoscope", build_1_image, build_2_image,
-                                "--tool-prefix-binutils", prefix], stdout=diff, stderr=self.log)
+                                 "--tool-prefix-binutils", prefix, "--json", "-"], stdout=diff, stderr=self.log)
             else:
                 log_write(self.log, "INFO: diffoscope not installed, falling back to cmp")
                 subprocess.call(["cmp", "-b", build_1_image, build_2_image], stdout=diff, stderr=self.log)
-- 
2.22.0
