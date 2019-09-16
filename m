From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 15 Sep 2019 23:09:08 -0300
Subject: [Buildroot] [PATCH] DEVELOPERS: trim runtime tests for Ricardo
 Martincoski
Message-ID: <20190916020908.8099-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Keep listing the test infra so the developer is included in reviews, but
trim the list of tests to those the developer are most interested in.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
To me, it is really hard to write a commit log for DEVELOPERS file
without using the first person :-)
Please feel free to reword.

I tested the wildcard for the python tests using:
$ utils/get-developers -f <filename>
I assumed that if this works then the e-mail notifications for runtime
test failures will work too.
---
 DEVELOPERS | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4467688779..080abccd3a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1944,7 +1944,14 @@ N:	Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
 F:	package/atop/
 
 N:	Ricardo Martincoski <ricardo.martincoski@gmail.com>
-F:	support/testing/
+F:	support/testing/infra/
+F:	support/testing/run-tests
+F:	support/testing/tests/core/test_file_capabilities.py
+F:	support/testing/tests/download/
+F:	support/testing/tests/package/*_python*.py
+F:	support/testing/tests/package/test_atop.py
+F:	support/testing/tests/package/test_syslog_ng.py
+F:	support/testing/tests/utils/test_check_package.py
 F:	utils/check-package
 F:	utils/checkpackagelib/
 
-- 
2.17.1
