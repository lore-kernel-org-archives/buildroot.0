From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 22:04:12 +0100
Subject: [Buildroot] [git commit] package/haserl: do not select Lua,
	depend on it
Message-ID: <20151218210516.E77B27FD46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6180ad224021d11e64cf8e52efa2af9a6f942803
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lua is a provider for the virtual package lua-interpreter, so it cannot
be selected, as explained in the manual.

Turn the 'select' into a 'depends on'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/haserl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/haserl/Config.in b/package/haserl/Config.in
index 1620d72..9ccc392 100644
--- a/package/haserl/Config.in
+++ b/package/haserl/Config.in
@@ -11,6 +11,6 @@ config BR2_PACKAGE_HASERL
 config BR2_PACKAGE_HASERL_WITH_LUA
 	bool "Lua support"
 	depends on BR2_PACKAGE_HASERL
-	select BR2_PACKAGE_LUA
+	depends on BR2_PACKAGE_LUA
 	help
 	  Enable Lua support for haserl
