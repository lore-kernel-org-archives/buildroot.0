From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Jan 2015 13:26:27 +0100
Subject: [Buildroot] [git commit] xz-utils: needs threads
Message-ID: <20150109122634.A4514800EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=799c12ebe6c830338124f90a81d12feaa08de391
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's one of the major features of the 5.2.0 release. Fixes:
http://autobuild.buildroot.net/results/e86/e86e97ff7887f1bdc6bf913498392ff50f56ea88/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xz/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/xz/Config.in b/package/xz/Config.in
index 50116f2..55beb42 100644
--- a/package/xz/Config.in
+++ b/package/xz/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XZ
 	bool "xz-utils"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  XZ is the successor to the Lempel-Ziv/Markov-chain Algorithm
 	  compression format, which provides memory-hungry but powerful
@@ -12,3 +13,6 @@ config BR2_PACKAGE_XZ
 	  package.
 
 	  http://tukaani.org/xz/
+
+comment "xz-utils needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
