From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:19:16 +0200
Subject: [Buildroot] [git commit] boost: fix build for sparc
Message-ID: <20150722152058.E75667F9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74461e56b371be4ca335102d5e84dd479965faab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using upstream patch, fixes:
http://autobuild.buildroot.net/results/dd0/dd032aa7b387f3ba5b25bffcaf833ba0ea9ba199/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0003-Remove-bogus-c3-cpu-varant-for-SPARC.patch |   42 ++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/boost/0003-Remove-bogus-c3-cpu-varant-for-SPARC.patch b/package/boost/0003-Remove-bogus-c3-cpu-varant-for-SPARC.patch
new file mode 100644
index 0000000..a4d39b3
--- /dev/null
+++ b/package/boost/0003-Remove-bogus-c3-cpu-varant-for-SPARC.patch
@@ -0,0 +1,42 @@
+From ec60c37295146bb80aa44a92cf416027b75b5ff7 Mon Sep 17 00:00:00 2001
+From: Vladimir Prus <vladimir@codesourcery.com>
+Date: Mon, 27 Apr 2015 19:12:54 +0300
+Subject: [PATCH] Remove bogus 'c3' cpu varant for SPARC.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ src/tools/gcc.jam | 3 +--
+ src/tools/gcc.py  | 3 +--
+ 2 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/src/tools/gcc.jam b/src/tools/gcc.jam
+index eff95ae..128ab84 100644
+--- a/tools/build/src/tools/gcc.jam
++++ b/tools/build/src/tools/gcc.jam
+@@ -1138,8 +1138,7 @@ cpu-flags gcc OPTIONS : x86 : c3-2 : -march=c3-2 ;
+ ##
+ cpu-flags gcc OPTIONS : x86 : atom : -march=atom ;
+ # Sparc
+-cpu-flags gcc OPTIONS : sparc : c3 : -mcpu=c3 : default ;
+-cpu-flags gcc OPTIONS : sparc : v7 : -mcpu=v7 ;
++cpu-flags gcc OPTIONS : sparc : v7 : -mcpu=v7 : default ;
+ cpu-flags gcc OPTIONS : sparc : cypress : -mcpu=cypress ;
+ cpu-flags gcc OPTIONS : sparc : v8 : -mcpu=v8 ;
+ cpu-flags gcc OPTIONS : sparc : supersparc : -mcpu=supersparc ;
+diff --git a/src/tools/gcc.py b/src/tools/gcc.py
+index a13ce7a..d2d3294 100644
+--- a/tools/build/src/tools/gcc.py
++++ b/tools/build/src/tools/gcc.py
+@@ -789,8 +789,7 @@ cpu_flags('gcc', 'OPTIONS', 'x86', 'atom', ['-march=atom'])
+ # Sparc
+ flags('gcc', 'OPTIONS', ['<architecture>sparc/<address-model>32'], ['-m32'])
+ flags('gcc', 'OPTIONS', ['<architecture>sparc/<address-model>64'], ['-m64'])
+-cpu_flags('gcc', 'OPTIONS', 'sparc', 'c3', ['-mcpu=c3'], default=True)
+-cpu_flags('gcc', 'OPTIONS', 'sparc', 'v7', ['-mcpu=v7'])
++cpu_flags('gcc', 'OPTIONS', 'sparc', 'v7', ['-mcpu=v7'], default=True)
+ cpu_flags('gcc', 'OPTIONS', 'sparc', 'cypress', ['-mcpu=cypress'])
+ cpu_flags('gcc', 'OPTIONS', 'sparc', 'v8', ['-mcpu=v8'])
+ cpu_flags('gcc', 'OPTIONS', 'sparc', 'supersparc', ['-mcpu=supersparc'])
+-- 
+2.3.6
+
