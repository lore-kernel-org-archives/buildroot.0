From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Apr 2012 11:17:05 -0300
Subject: [Buildroot] [PATCH 4/6] ncftp: needs MMU
In-Reply-To: <1333635427-24526-1-git-send-email-gustavo@zacarias.com.ar>
References: <1333635427-24526-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1333635427-24526-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ncftp/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ncftp/Config.in b/package/ncftp/Config.in
index 7b6ae64..4aaa62d 100644
--- a/package/ncftp/Config.in
+++ b/package/ncftp/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_NCFTP
 	bool "ncftp"
+	# fork()
+	depends on BR2_USE_MMU
 	help
 	  NcFTP Client (also known as just NcFTP) is a set of FREE application
 	  programs implementing the File Transfer Protocol (FTP).
-- 
1.7.3.4
