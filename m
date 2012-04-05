From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Apr 2012 11:17:04 -0300
Subject: [Buildroot] [PATCH 3/6] wget: needs MMU
In-Reply-To: <1333635427-24526-1-git-send-email-gustavo@zacarias.com.ar>
References: <1333635427-24526-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1333635427-24526-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wget/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/wget/Config.in b/package/wget/Config.in
index 3877a3a..3f79a64 100644
--- a/package/wget/Config.in
+++ b/package/wget/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_WGET
 	bool "wget"
+	# fork()
+	depends on BR2_USE_MMU
 	help
 	  Network utility to retrieve files from http, https and ftp.
 
-- 
1.7.3.4
