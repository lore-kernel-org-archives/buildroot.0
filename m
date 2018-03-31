From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 23:02:14 +0200
Subject: [Buildroot] [git commit] check-package: Flag usage of '\t \\$'.
Message-ID: <20180331210325.84184815BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42be6b6153ba0fdbd2152944e86f7cb180b55012
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check-package would flag tabs before a backslash ('\t\\'),
two spaces before a backslash ('  \\') but would not flag a tab before space
before backslash ('\t \\'), allowing someone to bypass the check.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
