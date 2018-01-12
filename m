From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:17:01 +0100
Subject: [Buildroot] [git commit] daq: fix build against the musl C library
Message-ID: <20180112211704.6FBAD83CD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbe64f4691e8e67066b4df0c91281674bdefeced
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Musl doesn't have <sys/unistd.h>, so let's change to <unistd.h>.

Fixes:
http://autobuild.buildroot.net/results/054f6581f67338b28af4dc2203b285ae1055581c
http://autobuild.buildroot.net/results/99ec5d70b2ecf3a17fd5b5461d3e6b8ec0d22bfa

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0001-Fix-build-against-the-musl-C-library.patch | 43 +++++++++++++++++-----
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/package/daq/0001-Fix-build-against-the-musl-C-library.patch b/package/daq/0001-Fix-build-against-the-musl-C-library.patch
index a37fe9a..25f2f9c 100644
--- a/package/daq/0001-Fix-build-against-the-musl-C-library.patch
+++ b/package/daq/0001-Fix-build-against-the-musl-C-library.patch
@@ -1,29 +1,54 @@
-From d3eec1a3b7c67a5e6f524c65608fd2eacac3782b Mon Sep 17 00:00:00 2001
+From 42efa6d76a3b52f35e576a6b941a9afb5b3879e9 Mon Sep 17 00:00:00 2001
 From: Sergio Prado <sergio.prado@e-labworks.com>
-Date: Sun, 24 Dec 2017 12:58:49 -0200
+Date: Tue, 9 Jan 2018 21:39:27 -0200
 Subject: [PATCH] Fix build against the musl C library
 
 Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
 ---
  os-daq-modules/daq_ipfw.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ os-daq-modules/daq_ipq.c  | 2 +-
+ os-daq-modules/daq_nfq.c  | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/os-daq-modules/daq_ipfw.c b/os-daq-modules/daq_ipfw.c
-index 016beb06ad61..c2a41759bb04 100644
+index 016beb06ad61..98f67717f646 100644
 --- a/os-daq-modules/daq_ipfw.c
 +++ b/os-daq-modules/daq_ipfw.c
-@@ -23,10 +23,10 @@
- #include <stdlib.h>
- #include <string.h>
- #include <stdio.h>
-+#include <unistd.h>
+@@ -26,7 +26,7 @@
  
  #include <sys/types.h>
  #include <sys/time.h>
 -#include <sys/unistd.h>
++#include <unistd.h>
  
  #include <netinet/in.h>
  #include <sys/socket.h>
+diff --git a/os-daq-modules/daq_ipq.c b/os-daq-modules/daq_ipq.c
+index 77ec6e9505e5..b15e5cf82af0 100644
+--- a/os-daq-modules/daq_ipq.c
++++ b/os-daq-modules/daq_ipq.c
+@@ -27,7 +27,7 @@
+ 
+ #include <sys/types.h>
+ #include <sys/time.h>
+-#include <sys/unistd.h>
++#include <unistd.h>
+ 
+ #include <netinet/ip.h>
+ 
+diff --git a/os-daq-modules/daq_nfq.c b/os-daq-modules/daq_nfq.c
+index 33021c0ec991..0df1e61c74c4 100644
+--- a/os-daq-modules/daq_nfq.c
++++ b/os-daq-modules/daq_nfq.c
+@@ -27,7 +27,7 @@
+ 
+ #include <sys/types.h>
+ #include <sys/time.h>
+-#include <sys/unistd.h>
++#include <unistd.h>
+ 
+ #include <netinet/ip.h>
+ 
 -- 
 1.9.1
 
