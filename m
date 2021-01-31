From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 12:03:11 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: drop unused
 --cpeid option
Message-ID: <20210131104322.A70EC807F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67768e97b02b22fd73bfa3ac066c6f636d8c984a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The --cpeid option was mistakenly introduced by commit
92e7089a8ca9f7dba5a5d690b7f768352cd6b983 ("support/script/pkg-stats:
show CPE ID in results") but is in fact not necessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 66d612ee7b..e549a0ac54 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1052,7 +1052,6 @@ def parse_args():
                           help='List of packages (comma separated)')
     parser.add_argument('--nvd-path', dest='nvd_path',
                         help='Path to the local NVD database', type=resolvepath)
-    parser.add_argument("--cpeid", action='store_true')
     args = parser.parse_args()
     if not args.html and not args.json:
         parser.error('at least one of --html or --json (or both) is required')
