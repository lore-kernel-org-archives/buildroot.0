From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon,  3 Sep 2018 11:16:07 -0700
Subject: [Buildroot] [PATCH 1/1] utils/checkpackagelib: fix python3
 compatibility
Message-ID: <20180903181607.817-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
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
index 86e9aa2d97..263b7b010d 100644
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
2.18.0
