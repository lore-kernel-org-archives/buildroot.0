From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  7 Jan 2021 14:39:41 +0100
Subject: [Buildroot] [PATCH 04/10] support/scripts/pkg-stats: drop unused
 --cpeid option
In-Reply-To: <20210107133948.2997849-1-thomas.petazzoni@bootlin.com>
References: <20210107133948.2997849-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210107133948.2997849-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The --cpeid option was mistakenly introduced by commit
92e7089a8ca9f7dba5a5d690b7f768352cd6b983 ("support/script/pkg-stats:
show CPE ID in results") but is in fact not necessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 9d28087d96..cf206e6533 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1053,7 +1053,6 @@ def parse_args():
                           help='List of packages (comma separated)')
     parser.add_argument('--nvd-path', dest='nvd_path',
                         help='Path to the local NVD database', type=resolvepath)
-    parser.add_argument("--cpeid", action='store_true')
     args = parser.parse_args()
     if not args.html and not args.json:
         parser.error('at least one of --html or --json (or both) is required')
-- 
2.29.2
