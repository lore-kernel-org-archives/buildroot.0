From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 15:46:52 +0100
Subject: [Buildroot] [git commit] package/python-daemon: select
 python-lockfile
Message-ID: <20191225145259.9B0038E32D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8995f599186d347c1d461fea867a5e4ef73315c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-lockfile is needed for runtime. Without it, importing python-daemon
results in an import error.

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
