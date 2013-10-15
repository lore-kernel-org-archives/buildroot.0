From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Oct 2013 15:03:48 +0200
Subject: [Buildroot] [git commit] autossh: add ssh client/server depends
Message-ID: <20131015130450.CCD1F9BA15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03a5ac9b1c1f3220b759935706227598ac167f3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's not very useful without them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/autossh/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/autossh/Config.in b/package/autossh/Config.in
index e3acd8a..6d1a085 100644
--- a/package/autossh/Config.in
+++ b/package/autossh/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_AUTOSSH
 	bool "autossh"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_DROPBEAR || BR2_PACKAGE_OPENSSH
 	help
 	  autossh is a program to start a copy of ssh and monitor it,
 	  restarting it as necessary should it die or stop passing traffic.
