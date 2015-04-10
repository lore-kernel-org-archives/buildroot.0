From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Apr 2015 09:19:25 +0200
Subject: [Buildroot] [git commit] package/boost: boost-log needs NPTL threads
Message-ID: <20150410071942.F196481790@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30aff9cf9267988295f3c4d3078bd93cb3b5afbb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
[xtensa]
http://autobuild.buildroot.net/results/664/6642dc9c569b2820a9d0e273fc2fb1d5a635ba0a
[arc]
http://autobuild.buildroot.net/results/ba5/ba5836e9a77e1b48e24ace46ca1611c22524261d
[bfin]
http://autobuild.buildroot.net/results/8cd/8cdac9cc67394aaae09ee816a9adddec762e3bd0

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 65bf605..5444c42 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -89,6 +89,10 @@ comment "boost-locale needs a toolchain w/ wchar"
 
 config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+
+comment "boost-log needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
