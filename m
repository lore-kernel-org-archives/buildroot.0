From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  6 Nov 2013 16:34:35 +0100
Subject: [Buildroot] [PATCH v3 2/5] sysvinit: depend on SysV selected as
	init system.
In-Reply-To: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1383752078-25315-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to prevent sysvinit and systemd to be selected at the same
time, sysvinit can now only be selected if SysV is chosen as init
system.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/sysvinit/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sysvinit/Config.in b/package/sysvinit/Config.in
index 34ec391..d91c643 100644
--- a/package/sysvinit/Config.in
+++ b/package/sysvinit/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SYSVINIT
 	bool "sysvinit"
+	depends on BR2_INIT_SYSV
 	help
 	  /sbin/init - parent of all processes
 
-- 
1.7.9.5
