From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Feb 2021 22:45:12 +0100
Subject: [Buildroot] [PATCH] utils/scanpypi: use python3 explicitly
Message-ID: <20210216214513.273743-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

scanpypi is python3 compatible. In addition, it executes the setup.py
of Python modules to extract the relevant information. Since these are
more and more commonly using python3 constructs, using "python" to run
scanpypi causes problems on systems that have python2 installed as
python, when trying to parse setup.py scripts with python3 constructs.

Fixes part of #13516.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scanpypi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 51bc249f9e..47c7c00c60 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 """
 
 Utility for building Buildroot packages for existing PyPI packages
-- 
2.29.2
