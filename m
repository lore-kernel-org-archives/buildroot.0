From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Nov 2019 21:17:57 +0100
Subject: [Buildroot] [git commit] legacy: add missing entry for openvmtools'
 procps removal
Message-ID: <20191110201048.1EE6E8ECB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b6630156d3a8f953f70290d593f13724ff5581c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 2be4232d98 removed the config option for openvmtools' procps
support, but forgot to add it to the legacy menu.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index fcb10b1291..848551cfce 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2019.11"
 
+config BR2_PACKAGE_OPENVMTOOLS_PROCPS
+	bool "oenvmtools' procps support was removed"
+	select BR2_LEGACY
+	help
+	  Upstream stopped supporting this option a while ago.
+
 config BR2_PACKAGE_ALLJOYN
 	bool "alljoyn was removed"
 	select BR2_LEGACY
