From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 21 Jan 2018 22:44:31 -0200
Subject: [Buildroot] [PATCH 03/14] graph-build-time: fix code style
In-Reply-To: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1516581882-30582-4-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix these warnings:
E201 whitespace after '['
E202 whitespace before ']'
E302 expected 2 blank lines, found 1
E305 expected 2 blank lines after class or function definition, found 1

Ignore these warnings:
E402 module level import not at top of file

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/graph-build-time | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index 9d05f22..415d431 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -64,14 +64,14 @@ except ImportError:
 # Note: matplotlib.use() must be called *before* matplotlib.pyplot.
 mpl.use('Agg')
 
-import matplotlib.pyplot as plt
-import matplotlib.font_manager as fm
-import csv
-import argparse
+import matplotlib.pyplot as plt       # noqa: E402
+import matplotlib.font_manager as fm  # noqa: E402
+import csv                            # noqa: E402
+import argparse                       # noqa: E402
 
-steps = [ 'extract', 'patch', 'configure', 'build',
-          'install-target', 'install-staging', 'install-images',
-          'install-host']
+steps = ['extract', 'patch', 'configure', 'build',
+         'install-target', 'install-staging', 'install-images',
+         'install-host']
 
 default_colors = ['#e60004', '#009836', '#2e1d86', '#ffed00',
                   '#0068b5', '#f28e00', '#940084', '#97c000']
@@ -79,6 +79,7 @@ default_colors = ['#e60004', '#009836', '#2e1d86', '#ffed00',
 alternate_colors = ['#00e0e0', '#3f7f7f', '#ff0000', '#00c000',
                     '#0080ff', '#c000ff', '#00eeee', '#e0e000']
 
+
 class Package:
     def __init__(self, name):
         self.name = name
@@ -104,6 +105,7 @@ class Package:
             return self.steps_duration[step]
         return 0
 
+
 # Generate an histogram of the time spent in each step of each
 # package.
 def pkg_histogram(data, output, order="build"):
@@ -132,10 +134,10 @@ def pkg_histogram(data, output, order="build"):
     for i in range(0, len(vals)):
         b = plt.bar(ind+0.1, vals[i], width=0.8, color=colors[i], bottom=bottom, linewidth=0.25)
         legenditems.append(b[0])
-        bottom = [ bottom[j] + vals[i][j] for j in range(0, len(vals[i])) ]
+        bottom = [bottom[j] + vals[i][j] for j in range(0, len(vals[i]))]
 
     # Draw the package names
-    plt.xticks(ind + .6, [ p.name for p in data ], rotation=-60, rotation_mode="anchor", fontsize=8, ha='left')
+    plt.xticks(ind + .6, [p.name for p in data], rotation=-60, rotation_mode="anchor", fontsize=8, ha='left')
 
     # Adjust size of graph depending on the number of packages
     # Ensure a minimal size twice as the default
@@ -172,6 +174,7 @@ def pkg_histogram(data, output, order="build"):
     # Save graph
     plt.savefig(output)
 
+
 # Generate a pie chart with the time spent building each package.
 def pkg_pie_time_per_package(data, output):
     # Compute total build duration
@@ -210,6 +213,7 @@ def pkg_pie_time_per_package(data, output):
     plt.title('Build time per package')
     plt.savefig(output)
 
+
 # Generate a pie chart with a portion for the overall time spent in
 # each step for all packages.
 def pkg_pie_time_per_step(data, output):
@@ -236,6 +240,7 @@ def pkg_pie_time_per_step(data, output):
     plt.title('Build time per step')
     plt.savefig(output)
 
+
 # Parses the csv file passed on standard input and returns a list of
 # Package objects, filed with the duration of each step and the total
 # duration of the package.
@@ -269,6 +274,7 @@ def read_data(input_file):
 
     return pkgs
 
+
 parser = argparse.ArgumentParser(description='Draw build time graphs')
 parser.add_argument("--type", '-t', metavar="GRAPH_TYPE",
                     help="Type of graph (histogram, pie-packages, pie-steps)")
-- 
2.7.4
