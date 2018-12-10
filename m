From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 11:46:36 +0100
Subject: [Buildroot] [git commit] utils/scanpypi: import third party modules
 after the standard ones
Message-ID: <20181210104410.53A0080404@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e273c36ad086189c081a41f2de7966348e085e37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move imports from six package after the standard modules. Resolves
pylint warnings.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
