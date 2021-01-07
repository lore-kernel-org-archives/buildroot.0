From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  7 Jan 2021 14:39:42 +0100
Subject: [Buildroot] [PATCH 05/10] support/scripts/pkg-stats: fix flake8
 warnings
In-Reply-To: <20210107133948.2997849-1-thomas.petazzoni@bootlin.com>
References: <20210107133948.2997849-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210107133948.2997849-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

support/scripts/pkg-stats:148:17: E741 ambiguous variable name 'l'
support/scripts/pkg-stats:379:9: E741 ambiguous variable name 'l'

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index cf206e6533..854ece389d 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -145,8 +145,8 @@ class Package:
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
-- 
2.29.2
