From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Dec 2012 12:12:29 +0100
Subject: [Buildroot] [git commit] vsftpd: needs mmu
Message-ID: <20121228111228.0C7289A4D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2eb995759d2e24e4e1f584439d2a272be68b4bba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/067cfbab9fa26e9e5f321f661e8f4ac0e19249e1

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vsftpd/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/vsftpd/Config.in b/package/vsftpd/Config.in
index 8414c88..3d4cff1 100644
--- a/package/vsftpd/Config.in
+++ b/package/vsftpd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_VSFTPD
 	bool "vsftpd"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # fork()
 	help
 	  vsftpd is an ftp daemon written with security in mind.
 	  http://vsftpd.beasts.org/
