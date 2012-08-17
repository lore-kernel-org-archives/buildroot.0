From: Stephan Hoffmann <sho@relinux.de>
Date: Fri, 17 Aug 2012 13:54:16 +0200
Subject: [Buildroot] [PATCH] Added QMAKESPEC to the list of unexported
	symbols
Message-ID: <1345204456-13535-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building QT might fail if QMAKESPEC is defined.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 9ab7d99..77ca4a0 100644
--- a/Makefile
+++ b/Makefile
@@ -209,6 +209,7 @@ unexport CFLAGS
 unexport CXXFLAGS
 unexport GREP_OPTIONS
 unexport CONFIG_SITE
+unexport QMAKESPEC
 
 GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
 
-- 
1.7.0.4
