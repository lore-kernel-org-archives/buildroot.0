From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 23:14:24 +0100
Subject: [Buildroot] [git commit] check-package: fix code style
Message-ID: <20180129221637.C13FF87745@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=deb31a979a33fc01c22da7c9875474145ea81ebe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ignore these warnings:
F401 'lib.ConsecutiveEmptyLines' imported but unused

And remove comments that are not needed anymore.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/checkpackagelib/lib_config.py | 9 ++++-----
 utils/checkpackagelib/lib_hash.py   | 9 ++++-----
 utils/checkpackagelib/lib_mk.py     | 9 ++++-----
 utils/checkpackagelib/lib_patch.py  | 3 +--
 utils/checkpackagelib/readme.txt    | 2 --
 5 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 26ebb393d1..11d885f8c7 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -6,11 +6,10 @@
 import re
 
 from base import _CheckFunction
-# Notice: ignore 'imported but unused' from pyflakes for check functions.
-from lib import ConsecutiveEmptyLines
-from lib import EmptyLastLine
-from lib import NewlineAtEof
-from lib import TrailingSpace
+from lib import ConsecutiveEmptyLines  # noqa: F401
+from lib import EmptyLastLine          # noqa: F401
+from lib import NewlineAtEof           # noqa: F401
+from lib import TrailingSpace          # noqa: F401
 
 
 def _empty_or_comment(text):
diff --git a/utils/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
index c4d055ee22..6d4cc9fd62 100644
--- a/utils/checkpackagelib/lib_hash.py
+++ b/utils/checkpackagelib/lib_hash.py
@@ -6,11 +6,10 @@
 import re
 
 from base import _CheckFunction
-# Notice: ignore 'imported but unused' from pyflakes for check functions.
-from lib import ConsecutiveEmptyLines
-from lib import EmptyLastLine
-from lib import NewlineAtEof
-from lib import TrailingSpace
+from lib import ConsecutiveEmptyLines  # noqa: F401
+from lib import EmptyLastLine          # noqa: F401
+from lib import NewlineAtEof           # noqa: F401
+from lib import TrailingSpace          # noqa: F401
 
 
 def _empty_line_or_comment(text):
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index a6cfeb6d15..2df2e1a884 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -7,11 +7,10 @@
 import re
 
 from base import _CheckFunction
-# Notice: ignore 'imported but unused' from pyflakes for check functions.
-from lib import ConsecutiveEmptyLines
-from lib import EmptyLastLine
-from lib import NewlineAtEof
-from lib import TrailingSpace
+from lib import ConsecutiveEmptyLines  # noqa: F401
+from lib import EmptyLastLine          # noqa: F401
+from lib import NewlineAtEof           # noqa: F401
+from lib import TrailingSpace          # noqa: F401
 
 
 class Indent(_CheckFunction):
diff --git a/utils/checkpackagelib/lib_patch.py b/utils/checkpackagelib/lib_patch.py
index 591f13c494..555621afa1 100644
--- a/utils/checkpackagelib/lib_patch.py
+++ b/utils/checkpackagelib/lib_patch.py
@@ -6,8 +6,7 @@
 import re
 
 from base import _CheckFunction
-# Notice: ignore 'imported but unused' from pyflakes for check functions.
-from lib import NewlineAtEof
+from lib import NewlineAtEof           # noqa: F401
 
 
 class ApplyOrder(_CheckFunction):
diff --git a/utils/checkpackagelib/readme.txt b/utils/checkpackagelib/readme.txt
index 85e10fe34b..3bfe289607 100644
--- a/utils/checkpackagelib/readme.txt
+++ b/utils/checkpackagelib/readme.txt
@@ -28,8 +28,6 @@ Some hints when changing this code:
 - when there is no other reason for ordering, use alphabetical order (e.g. keep
   the check functions in alphabetical order, keep the imports in alphabetical
   order, and so on).
-- use pyflakes to detect and fix potential problems.
-- use pep8 formatting.
 - keep in mind that for every class the method before() will be called before
   any line is served to be checked by the method check_line(). A class that
   checks the filename should only implement the method before(). A function that
