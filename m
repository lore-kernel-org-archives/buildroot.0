From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Apr 2012 11:17:06 -0300
Subject: [Buildroot] [PATCH 5/6] rsync: needs MMU
In-Reply-To: <1333635427-24526-1-git-send-email-gustavo@zacarias.com.ar>
References: <1333635427-24526-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1333635427-24526-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rsync/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/rsync/Config.in b/package/rsync/Config.in
index 0f33774..be95a7c 100644
--- a/package/rsync/Config.in
+++ b/package/rsync/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_RSYNC
 	bool "rsync"
+	# fork()
+	depends on BR2_USE_MMU
 	help
 	  File transfer program to keep remote files in sync.
 
-- 
1.7.3.4
