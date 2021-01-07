From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  7 Jan 2021 14:39:40 +0100
Subject: [Buildroot] [PATCH 03/10] support/scripts/pkg-stats: drop unused
 cpeid_name() function
In-Reply-To: <20210107133948.2997849-1-thomas.petazzoni@bootlin.com>
References: <20210107133948.2997849-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210107133948.2997849-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The cpeid_name() function is not used anywhere, drop it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index c084c54b60..9d28087d96 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1060,13 +1060,6 @@ def parse_args():
     return args
 
 
-def cpeid_name(pkg):
-    try:
-        return pkg.cpeid.split(':')[1]
-    except Exception:  # cpeid may be None, or improperly formatted
-        return ''
-
-
 def __main__():
     args = parse_args()
     if args.packages:
-- 
2.29.2
