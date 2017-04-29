From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:57:28 +0200
Subject: [Buildroot] [git commit] package/qt5: drop option for license
	approved
Message-ID: <20170429135924.1DBAF8047C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6836f2a70acd259a846c88968924d60afef8cc16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As stated in previous commits, Buildroot only ever uses the free
license, and we do not have a click-wrap approval for any such free
license for any other package.

The option to approve the license now has no prompt and is no longer
used anywhere.

Legacy handling is not added because it is not useful: when the option
was enabled, it meant "accept the open source license", which is now the
default and only existing behavior.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
[Thomas: remove legacy handling as suggested by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 044aa5d..4796fdb 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -27,10 +27,6 @@ config BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS
 	  E.g. to remove the Windows Vista style option, add the option
 	  -no-feature-style_windowsvista.
 
-config BR2_PACKAGE_QT5BASE_LICENSE_APPROVED
-	bool
-	default y
-
 config BR2_PACKAGE_QT5BASE_CONFIG_FILE
 	string "Config file"
 	help
