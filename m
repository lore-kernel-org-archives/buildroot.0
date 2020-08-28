From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:34:28 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] utils/getdeveloperlib.py:
 use raw strings for re.compile/re.match
Message-ID: <20200828164643.0F54D85FE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=323a8ffac30609c424dce81b6fa03eb0856f7734
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fixes the following Python 3.x flake8 warning:

W605 invalid escape sequence '\s'

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c5b848d7192e615ead72419dcf5ce7286cf07a82)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/getdeveloperlib.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index 239ffa340b..dc0cc07cc7 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -10,7 +10,7 @@ import unittest
 # Patch parsing functions
 #
 
-FIND_INFRA_IN_PATCH = re.compile("^\+\$\(eval \$\((host-)?([^-]*)-package\)\)$")
+FIND_INFRA_IN_PATCH = re.compile(r"^\+\$\(eval \$\((host-)?([^-]*)-package\)\)$")
 
 
 def analyze_patch(patch):
@@ -33,7 +33,7 @@ def analyze_patch(patch):
     return (files, infras)
 
 
-FIND_INFRA_IN_MK = re.compile("^\$\(eval \$\((host-)?([^-]*)-package\)\)$")
+FIND_INFRA_IN_MK = re.compile(r"^\$\(eval \$\((host-)?([^-]*)-package\)\)$")
 
 
 def fname_get_package_infra(fname):
@@ -178,7 +178,7 @@ def parse_arches_from_config_in(fname):
                 parsing_arches = True
                 continue
             if parsing_arches:
-                m = re.match("^\s*default \"([^\"]*)\".*", line)
+                m = re.match(r"^\s*default \"([^\"]*)\".*", line)
                 if m:
                     arches.add(m.group(1))
                 else:
@@ -192,7 +192,7 @@ def parse_developer_architectures(fnames):
     developer is working on."""
     arches = set()
     for fname in fnames:
-        if not re.match("^.*/arch/Config\.in\..*$", fname):
+        if not re.match(r"^.*/arch/Config\.in\..*$", fname):
             continue
         arches = arches | parse_arches_from_config_in(fname)
     return arches
@@ -201,7 +201,7 @@ def parse_developer_architectures(fnames):
 def parse_developer_infras(fnames):
     infras = set()
     for fname in fnames:
-        m = re.match("^package/pkg-([^.]*).mk$", fname)
+        m = re.match(r"^package/pkg-([^.]*).mk$", fname)
         if m:
             infras.add(m.group(1))
     return infras
