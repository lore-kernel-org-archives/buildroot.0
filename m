From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 21 Jan 2018 22:44:33 -0200
Subject: [Buildroot] [PATCH 05/14] size-stats: fix code style
In-Reply-To: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1516581882-30582-6-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix these warnings:
E302 expected 2 blank lines, found 1
E305 expected 2 blank lines after class or function definition, found 1
E713 test for membership should be 'not in'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/size-stats | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index 85e7c15..deea92e 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -35,6 +35,7 @@ except ImportError:
 colors = ['#e60004', '#009836', '#2e1d86', '#ffed00',
           '#0068b5', '#f28e00', '#940084', '#97c000']
 
+
 #
 # This function adds a new file to 'filesdict', after checking its
 # size. The 'filesdict' contain the relative path of the file as the
@@ -54,6 +55,7 @@ def add_file(filesdict, relpath, abspath, pkg):
     sz = os.stat(abspath).st_size
     filesdict[relpath] = (pkg, sz)
 
+
 #
 # This function returns a dict where each key is the path of a file in
 # the root filesystem, and the value is a tuple containing two
@@ -73,6 +75,7 @@ def build_package_dict(builddir):
             add_file(filesdict, fpath, fullpath, pkg)
     return filesdict
 
+
 #
 # This function builds a dictionary that contains the name of a
 # package as key, and the size of the files installed by this package
@@ -103,7 +106,7 @@ def build_package_size(filesdict, builddir):
                 seeninodes.add(st.st_ino)
 
             frelpath = os.path.relpath(fpath, os.path.join(builddir, "target"))
-            if not frelpath in filesdict:
+            if frelpath not in filesdict:
                 print("WARNING: %s is not part of any package" % frelpath)
                 pkg = "unknown"
             else:
@@ -113,6 +116,7 @@ def build_package_size(filesdict, builddir):
 
     return pkgsize
 
+
 #
 # Given a dict returned by build_package_size(), this function
 # generates a pie chart of the size installed by each package.
@@ -150,6 +154,7 @@ def draw_graph(pkgsize, outputf):
     plt.title("Total filesystem size: %d kB" % (total / 1000.), fontsize=10, y=.96)
     plt.savefig(outputf)
 
+
 #
 # Generate a CSV file with statistics about the size of each file, its
 # size contribution to the package and to the overall system.
@@ -208,6 +213,7 @@ def gen_packages_csv(pkgsizes, outputf):
         for (pkg, size) in pkgsizes.items():
             wr.writerow([pkg, size, "%.1f" % (float(size) / total * 100)])
 
+
 parser = argparse.ArgumentParser(description='Draw size statistics graphs')
 
 parser.add_argument("--builddir", '-i', metavar="BUILDDIR", required=True,
-- 
2.7.4
