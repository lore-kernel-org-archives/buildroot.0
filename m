From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2019 23:05:37 +0100
Subject: [Buildroot] [PATCH 15/19] support/check-uniq-files: use argparse to
 enfore required options
In-Reply-To: <cover.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <81ed4adcc2260053f46fc0f1cb75a896828896e6.1546898693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/check-uniq-files | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
index f42edeb534..2cee95d048 100755
--- a/support/scripts/check-uniq-files
+++ b/support/scripts/check-uniq-files
@@ -20,21 +20,13 @@ def str_decode(s):
 
 def main():
     parser = argparse.ArgumentParser()
-    parser.add_argument('packages_file_list', nargs='*',
+    parser.add_argument('packages_file_list', nargs=1,
                         help='The packages-file-list to check from')
-    parser.add_argument('-t', '--type', metavar="TYPE",
+    parser.add_argument('-t', '--type', metavar="TYPE", required=True,
                         help='Report as a TYPE file (TYPE is either target, staging, or host)')
 
     args = parser.parse_args()
 
-    if not len(args.packages_file_list) == 1:
-        sys.stderr.write('No packages-file-list was provided.\n')
-        return False
-
-    if args.type is None:
-        sys.stderr.write('No type was provided\n')
-        return False
-
     file_to_pkg = defaultdict(set)
     file_md5 = defaultdict(set)
     for record in parse_pkg_file_list(args.packages_file_list[0]):
-- 
2.14.1
