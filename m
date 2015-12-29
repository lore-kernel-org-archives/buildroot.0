From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 17:02:00 +0100
Subject: [Buildroot] [git commit] subversion: add missing comment when
	building static
Message-ID: <20151229160227.CFE747FBA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5dc0f6aaab8f3a845b1db08439cff27832a53930
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/subversion/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/subversion/Config.in b/package/subversion/Config.in
index 61c9d3b..ffe424a 100644
--- a/package/subversion/Config.in
+++ b/package/subversion/Config.in
@@ -12,3 +12,7 @@ config BR2_PACKAGE_SUBVERSION
 	  Subversion is an open source version control system
 
 	  http://subversion.apache.org/
+
+comment "subversion needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
