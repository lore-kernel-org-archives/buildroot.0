From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue, 15 Jan 2019 18:15:45 +0100
Subject: [Buildroot] [PATCH] utils/check-package: use explicit relative
 imports
Message-ID: <20190115171545.8337-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The syntax for explicit relative imports was introduced in
Python2.6, and the implicit relative imports were removed
in Python3.

According to PEP394, Python source files that use the `python`
shebang line should be compatible with both Python2 and Python3.
With this patch, users of distros where Python3 is the default
are able to use check-package

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 utils/checkpackagelib/lib.py        |  2 +-
 utils/checkpackagelib/lib_config.py | 10 +++++-----
 utils/checkpackagelib/lib_hash.py   | 10 +++++-----
 utils/checkpackagelib/lib_mk.py     | 10 +++++-----
 utils/checkpackagelib/lib_patch.py  |  4 ++--
 5 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/utils/checkpackagelib/lib.py b/utils/checkpackagelib/lib.py
index 91f4ad49b7..06b147a470 100644
--- a/utils/checkpackagelib/lib.py
+++ b/utils/checkpackagelib/lib.py
@@ -1,6 +1,6 @@
 # See utils/checkpackagelib/readme.txt before editing this file.
 
-from base import _CheckFunction
+from .base import _CheckFunction
 
 
 class ConsecutiveEmptyLines(_CheckFunction):
diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 1d273f1c5f..f6dc583a08 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -5,11 +5,11 @@
 
 import re
 
-from base import _CheckFunction
-from lib import ConsecutiveEmptyLines  # noqa: F401
-from lib import EmptyLastLine          # noqa: F401
-from lib import NewlineAtEof           # noqa: F401
-from lib import TrailingSpace          # noqa: F401
+from .base import _CheckFunction
+from .lib import ConsecutiveEmptyLines  # noqa: F401
+from .lib import EmptyLastLine          # noqa: F401
+from .lib import NewlineAtEof           # noqa: F401
+from .lib import TrailingSpace          # noqa: F401
 
 
 def _empty_or_comment(text):
diff --git a/utils/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
index 6d4cc9fd62..3ddd88bae9 100644
--- a/utils/checkpackagelib/lib_hash.py
+++ b/utils/checkpackagelib/lib_hash.py
@@ -5,11 +5,11 @@
 
 import re
 
-from base import _CheckFunction
-from lib import ConsecutiveEmptyLines  # noqa: F401
-from lib import EmptyLastLine          # noqa: F401
-from lib import NewlineAtEof           # noqa: F401
-from lib import TrailingSpace          # noqa: F401
+from .base import _CheckFunction
+from .lib import ConsecutiveEmptyLines  # noqa: F401
+from .lib import EmptyLastLine          # noqa: F401
+from .lib import NewlineAtEof           # noqa: F401
+from .lib import TrailingSpace          # noqa: F401
 
 
 def _empty_line_or_comment(text):
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 0e430a2f12..857d7b16ad 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -6,11 +6,11 @@
 
 import re
 
-from base import _CheckFunction
-from lib import ConsecutiveEmptyLines  # noqa: F401
-from lib import EmptyLastLine          # noqa: F401
-from lib import NewlineAtEof           # noqa: F401
-from lib import TrailingSpace          # noqa: F401
+from .base import _CheckFunction
+from .lib import ConsecutiveEmptyLines  # noqa: F401
+from .lib import EmptyLastLine          # noqa: F401
+from .lib import NewlineAtEof           # noqa: F401
+from .lib import TrailingSpace          # noqa: F401
 
 
 class Indent(_CheckFunction):
diff --git a/utils/checkpackagelib/lib_patch.py b/utils/checkpackagelib/lib_patch.py
index 555621afa1..4b1b48e6ca 100644
--- a/utils/checkpackagelib/lib_patch.py
+++ b/utils/checkpackagelib/lib_patch.py
@@ -5,8 +5,8 @@
 
 import re
 
-from base import _CheckFunction
-from lib import NewlineAtEof           # noqa: F401
+from .base import _CheckFunction
+from .lib import NewlineAtEof           # noqa: F401
 
 
 class ApplyOrder(_CheckFunction):
-- 
2.19.2
