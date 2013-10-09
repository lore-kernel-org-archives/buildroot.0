From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 22:21:35 +0200
Subject: [Buildroot] [git commit] vpnc: needs mmu
Message-ID: <20131009202220.238339B98A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43fed5e46deb72a06234537a83d7fc5d0d85d61f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vpnc/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/vpnc/Config.in b/package/vpnc/Config.in
index 9abc0c5..bc27331 100644
--- a/package/vpnc/Config.in
+++ b/package/vpnc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_VPNC
 	bool "vpnc"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGPG_ERROR
 	help
