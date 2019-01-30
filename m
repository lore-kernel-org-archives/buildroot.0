From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Jan 2019 22:27:13 +0100
Subject: [Buildroot] [PATCH] docker-compose: backport upstream patch for
 pyyaml 4.x support
Message-ID: <20190130212713.19245-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise docker-compose fails at runtime with:

docker-compose
Traceback (most recent call last):
  File "/usr/bin/docker-compose", line 6, in <module>
    from pkg_resources import load_entry_point
  File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3123, in <module>
  File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3107, in _call_aside
  File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3136, in _initialize_master_working_set
  File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 580, in _build_master
  File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 593, in _build_from_requirements
  File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 781, in resolve
pkg_resources.DistributionNotFound: The 'PyYAML<4,>=3.10' distribution was not found and is required by docker-compose

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-Upgrade-pyyaml-to-4.2b1.patch             | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/docker-compose/0002-Upgrade-pyyaml-to-4.2b1.patch

diff --git a/package/docker-compose/0002-Upgrade-pyyaml-to-4.2b1.patch b/package/docker-compose/0002-Upgrade-pyyaml-to-4.2b1.patch
new file mode 100644
index 0000000000..a3b4bfb853
--- /dev/null
+++ b/package/docker-compose/0002-Upgrade-pyyaml-to-4.2b1.patch
@@ -0,0 +1,27 @@
+From 8419a670aed3364c39b86a0608782aaeae3ce5df Mon Sep 17 00:00:00 2001
+From: Quentin Brunet <hello@quentinbrunet.com>
+Date: Tue, 8 Jan 2019 14:04:54 +0100
+Subject: [PATCH] Upgrade pyyaml to 4.2b1
+
+Signed-off-by: Quentin Brunet <hello@quentinbrunet.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ setup.py         | 2 +-
+ 1 file changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 4c49bab7..8b5f9d99 100644
+--- a/setup.py
++++ b/setup.py
+@@ -32,7 +32,7 @@ def find_version(*file_paths):
+ install_requires = [
+     'cached-property >= 1.2.0, < 2',
+     'docopt >= 0.6.1, < 0.7',
+-    'PyYAML >= 3.10, < 4',
++    'PyYAML >= 3.10, < 4.3',
+     'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 3.0',
+     'texttable >= 0.9.0, < 0.10',
+     'websocket-client >= 0.32.0, < 1.0',
+-- 
+2.11.0
+
-- 
2.11.0
