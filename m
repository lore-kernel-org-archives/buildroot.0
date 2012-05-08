From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 May 2012 11:27:22 +0200
Subject: [Buildroot] [PATCH 4/4] m4: not available on noMMU platforms
In-Reply-To: <1336469242-1099-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1336469242-1099-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1336469242-1099-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/m4/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/m4/Config.in b/package/m4/Config.in
index 56b2859..dee2d83 100644
--- a/package/m4/Config.in
+++ b/package/m4/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_M4
 	bool "m4"
 	depends on BR2_USE_WCHAR
+	# uses fork()
+	depends on BR2_USE_MMU
 	help
 	  An implementation of the traditional Unix macro processor.
 
-- 
1.7.9.5
