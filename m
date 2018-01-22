From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 21 Jan 2018 22:44:30 -0200
Subject: [Buildroot] [PATCH 02/14] check-uniq-files: fix code style
In-Reply-To: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1516581882-30582-3-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix these warnings:
E128 continuation line under-indented for visual indent
E302 expected 2 blank lines, found 1
E305 expected 2 blank lines after class or function definition, found 1

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/check-uniq-files | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
index ea5afdb..a3d1767 100755
--- a/support/scripts/check-uniq-files
+++ b/support/scripts/check-uniq-files
@@ -7,10 +7,11 @@ from collections import defaultdict
 
 warn = 'Warning: {} file "{}" is touched by more than one package: {}\n'
 
+
 def main():
     parser = argparse.ArgumentParser()
     parser.add_argument('packages_file_list', nargs='*',
-                    help='The packages-file-list to check from')
+                        help='The packages-file-list to check from')
     parser.add_argument('-t', '--type', metavar="TYPE",
                         help='Report as a TYPE file (TYPE is either target, staging, or host)')
 
@@ -36,5 +37,6 @@ def main():
         if len(file_to_pkg[file]) > 1:
             sys.stderr.write(warn.format(args.type, file, file_to_pkg[file]))
 
+
 if __name__ == "__main__":
     sys.exit(main())
-- 
2.7.4
