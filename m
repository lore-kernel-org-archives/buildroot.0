From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 23:14:24 +0100
Subject: [Buildroot] [git commit] check-uniq-files: fix code style
Message-ID: <20180129221637.1FA6E88056@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=236bede6318a5dd21f7edc3d57b74f5aff3d398c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix these warnings:
E128 continuation line under-indented for visual indent
E302 expected 2 blank lines, found 1
E305 expected 2 blank lines after class or function definition, found 1

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/check-uniq-files | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
index ea5afdb0b3..a3d176710e 100755
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
