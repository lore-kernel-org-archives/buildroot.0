From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Apr 2012 11:17:03 -0300
Subject: [Buildroot] [PATCH 2/6] openntpd: needs MMU
In-Reply-To: <1333635427-24526-1-git-send-email-gustavo@zacarias.com.ar>
References: <1333635427-24526-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1333635427-24526-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openntpd/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/openntpd/Config.in b/package/openntpd/Config.in
index 32d0d8b..4dd9a29 100644
--- a/package/openntpd/Config.in
+++ b/package/openntpd/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_OPENNTPD
 	bool "openntpd"
+	# fork()
+	depends on BR2_USE_MMU
 	help
 	  OpenNTPD is an easy to use implementation of the Network Time
 	  Protocol. It provides the ability to sync the local clock
-- 
1.7.3.4
