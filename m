From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Dec 2015 11:12:50 -0300
Subject: [Buildroot] [PATCH v2] subversion: add missing comment when
	building static
Message-ID: <1451398370-25116-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.4.10
