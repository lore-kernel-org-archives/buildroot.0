From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 May 2019 10:20:38 +0200
Subject: [Buildroot] [git commit] utils/check-package: fix flake8 warning
Message-ID: <20190520081505.00E2681322@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9b081d53acef7e0ec9d03eee04e2dc48220f1d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix flake 8 warning (introduced with commit [1]):

  utils/checkpackagelib/lib.py:56:1: E302 expected 2 blank lines, found 1

[1] https://git.buildroot.net/buildroot/commit/?id=8e352c32b0beded97a8a5c1e9edc9d618514ee7b

Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/checkpackagelib/lib.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/checkpackagelib/lib.py b/utils/checkpackagelib/lib.py
index c65a2ed939..457b3c3171 100644
--- a/utils/checkpackagelib/lib.py
+++ b/utils/checkpackagelib/lib.py
@@ -53,6 +53,7 @@ class TrailingSpace(_CheckFunction):
                     .format(self.filename, lineno),
                     text]
 
+
 class Utf8Characters(_CheckFunction):
     def is_ascii(self, s):
         try:
