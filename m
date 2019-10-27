From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 27 Oct 2019 10:35:06 +0100
Subject: [Buildroot] [git commit] utils/check-package: report := that
 appends to variables
Message-ID: <20191027092901.B096E88F4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e03a2e89eef2539ca78a24ccfcfaf09f0eef9bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
