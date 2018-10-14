From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 10:00:23 +0200
Subject: [Buildroot] [git commit] python-psycopg2: add patch to avoid
 installing tests
Message-ID: <20181014075903.D4B9483662@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5afc1582211b319d79c08915bc3c656fa528be5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's already on upstream, and will be removed on the next bump.

Fixes:
http://autobuild.buildroot.org/results/31c/31c942a43064fc012286724e545773cba6e57cc3/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...y-avoid-installing-tests-to-site-packages.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/python-psycopg2/0001-setup.py-avoid-installing-tests-to-site-packages.patch b/package/python-psycopg2/0001-setup.py-avoid-installing-tests-to-site-packages.patch
new file mode 100644
index 0000000000..f2dc3adca9
--- /dev/null
+++ b/package/python-psycopg2/0001-setup.py-avoid-installing-tests-to-site-packages.patch
@@ -0,0 +1,31 @@
+From 46c50849584d254b81ad058e1a53adcef1eb4c53 Mon Sep 17 00:00:00 2001
+From: Asaf Kahlon <asafka7@gmail.com>
+Date: Fri, 12 Oct 2018 07:57:23 +0300
+Subject: [PATCH 1/1] setup.py: avoid installing tests to site-packages
+
+This patch update only setup.py from upstream patch
+(389f6c08d9536060184bfd5c8ea2491a4a91c2fb).
+
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
+---
+ setup.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index b521290..3f309fc 100644
+--- a/setup.py
++++ b/setup.py
+@@ -674,8 +674,8 @@ setup(name="psycopg2",
+       long_description="\n".join(readme.split("\n")[2:]).lstrip(),
+       classifiers=[x for x in classifiers.split("\n") if x],
+       data_files=data_files,
+-      package_dir={'psycopg2': 'lib', 'psycopg2.tests': 'tests'},
+-      packages=['psycopg2', 'psycopg2.tests'],
++      package_dir={'psycopg2': 'lib'},
++      packages=['psycopg2'],
+       cmdclass={
+           'build_ext': psycopg_build_ext,
+           'build_py': build_py, },
+-- 
+2.17.1
+
