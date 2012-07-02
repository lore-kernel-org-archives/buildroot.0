From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  2 Jul 2012 16:21:14 +0200
Subject: [Buildroot] [PATCH 2/2] Ensure DESTDIR will not confuse the build
In-Reply-To: <1341238874-1309-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1341238874-1309-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1341238874-1309-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Having DESTDIR defined will confuse the build of certain packages, so
we ensure that it is undefined from the environment when Buildroot
starts.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index bcbe9fc..b80477f 100644
--- a/Makefile
+++ b/Makefile
@@ -168,6 +168,10 @@ export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
 # Make sure pkg-config doesn't look outside the buildroot tree
 unexport PKG_CONFIG_PATH
 
+# Having DESTDIR set in the environment confuses the installation
+# steps of some packages.
+unexport DESTDIR
+
 # bash prints the name of the directory on 'cd <dir>' if CDPATH is
 # set, so unset it here to not cause problems. Notice that the export
 # line doesn't affect the environment of $(shell ..) calls, so
-- 
1.7.9.5
