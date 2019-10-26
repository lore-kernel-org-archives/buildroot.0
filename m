From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Oct 2019 10:46:01 +0200
Subject: [Buildroot] [PATCH 9/9] utils/check-package: report := that apends
 to variables
In-Reply-To: <cover.1572079551.git.yann.morin.1998@free.fr>
References: <cover.1572079551.git.yann.morin.1998@free.fr>
Message-ID: <9c2c26f0d6e2967ef96cf5602e193a397cd4cc6a.1572079551.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/checkpackagelib/lib_mk.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index dd04ffd58f..b805cd9925 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -126,7 +126,9 @@ class OverriddenVariable(_CheckFunction):
                 self.conditionally_set.append(variable)
                 return
             if self.CONCATENATING.search(text):
-                return
+                return ["{}:{}: immediate assignment to append to variable {}"
+                        .format(self.filename, lineno, variable),
+                        text]
             if self.USUALLY_OVERRIDDEN.search(text):
                 return
             if assignment in self.OVERRIDING_ASSIGNMENTS:
-- 
2.20.1
