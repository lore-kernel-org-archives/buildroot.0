From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Wed,  7 Mar 2018 10:48:12 +0100
Subject: [Buildroot] [PATCH 1/1] check-package: Flag usage of '\t \\$'.
Message-ID: <20180307094812.11293-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

check-package would flag tabs before a backslash ('\t\\'),
two spaces before a backslash ('  \\') but would not flag a tab before space
before backslash ('\t \\'), allowing someone to bypass the check.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

---
There is no occurence of this in buildroot.
 utils/checkpackagelib/lib_mk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 2df2e1a884..cfd4d05117 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -123,7 +123,7 @@ class RemoveDefaultPackageSourceVariable(_CheckFunction):
 
 
 class SpaceBeforeBackslash(_CheckFunction):
-    TAB_OR_MULTIPLE_SPACES_BEFORE_BACKSLASH = re.compile(r"^.*(  |\t)\\$")
+    TAB_OR_MULTIPLE_SPACES_BEFORE_BACKSLASH = re.compile(r"^.*(  |\t ?)\\$")
 
     def check_line(self, lineno, text):
         if self.TAB_OR_MULTIPLE_SPACES_BEFORE_BACKSLASH.match(text.rstrip()):
-- 
2.16.2
