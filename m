From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 12:03:12 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix flake8
 warnings
Message-ID: <20210131104322.B249A807F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52a53c97e5bc71ba633d65c8466f6cdd6e562c87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

support/scripts/pkg-stats:148:17: E741 ambiguous variable name 'l'
support/scripts/pkg-stats:379:9: E741 ambiguous variable name 'l'

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index e549a0ac54..d222ba37c3 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -144,8 +144,8 @@ class Package:
         self.infras = list()
         with open(os.path.join(brpath, self.path), 'r') as f:
             lines = f.readlines()
-            for l in lines:
-                match = INFRA_RE.match(l)
+            for line in lines:
+                match = INFRA_RE.match(line)
                 if not match:
                     continue
                 infra = match.group(1)
