From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 25 Nov 2019 11:38:50 -0800
Subject: [Buildroot] [PATCH/next 3/3] package/python-daemon: select
 python-lockfile
In-Reply-To: <20191125193850.862709-1-aduskett@gmail.com>
References: <20191125193850.862709-1-aduskett@gmail.com>
Message-ID: <20191125193850.862709-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@greenlots.com>

python-lockfile is needed for runtime. Without it, importing python-daemon
results in an import error.

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
---
 package/python-daemon/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-daemon/Config.in b/package/python-daemon/Config.in
index 21f4407452..9944bb9e35 100644
--- a/package/python-daemon/Config.in
+++ b/package/python-daemon/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_DAEMON
 	bool "python-daemon"
 	select BR2_PACKAGE_PYTHON_DOCUTILS # runtime
+	select BR2_PACKAGE_PYTHON_LOCKFILE # runtime
 	help
 	  Library to implement a well-behaved Unix daemon process.
 
-- 
2.23.0
