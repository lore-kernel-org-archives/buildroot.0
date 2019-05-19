From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 19 May 2019 23:15:28 +0200
Subject: [Buildroot] [PATCH v1] utils/check-package: fix flake8 warning
Message-ID: <20190519211528.9917-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix flake 8 warning (introduced with commit [1]):

  utils/checkpackagelib/lib.py:56:1: E302 expected 2 blank lines, found 1

[1] https://git.buildroot.net/buildroot/commit/?id=8e352c32b0beded97a8a5c1e9edc9d618514ee7b

Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
--
2.21.0
