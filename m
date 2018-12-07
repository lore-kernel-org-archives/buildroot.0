From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  7 Dec 2018 10:40:41 +0100
Subject: [Buildroot] [PATCH] scanpypi: import third party modules after the
 standard ones
Message-ID: <20181207094041.20140-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Move imports from six package after the standard modules. Resolves
pylint warnings.
---
 utils/scanpypi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 3d3e604435..9335bedee4 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -10,9 +10,6 @@ from __future__ import print_function
 from __future__ import absolute_import
 import argparse
 import json
-import six.moves.urllib.request
-import six.moves.urllib.error
-import six.moves.urllib.parse
 import sys
 import os
 import shutil
@@ -25,6 +22,9 @@ import textwrap
 import tempfile
 import imp
 from functools import wraps
+import six.moves.urllib.request
+import six.moves.urllib.error
+import six.moves.urllib.parse
 from six.moves import map
 from six.moves import zip
 from six.moves import input
-- 
2.17.0
