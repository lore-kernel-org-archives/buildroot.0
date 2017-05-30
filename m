From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 May 2017 08:59:45 +0200
Subject: [Buildroot] [git commit] mosh: add notes to clarify runtime issues
Message-ID: <20170530071503.DCAE882290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eddaf1f00eb0b54b21f2e450fc66f0db8b7dbdca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added notes to the mosh package help to clarify some runtime
issues related with it to ensure mosh will work properly after adding it.
This includes adding a proper LOCALE and an extra flag when using
mosh with dropbear.

Signed-off-by: Gon??alo Salazar <glbsalazar@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosh/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index e0ff2cf..1806520 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -24,4 +24,11 @@ config BR2_PACKAGE_MOSH
 	  allows roaming, and provides speculative local echo and line editing
 	  of user keystrokes.
 
+	  Mosh requires that the remote machine has a locale setting matching
+	  the one on the client.
+
+	  When using mosh with dropbear on a remote machine, the client needs mosh
+	  with a version above 1.3.0 and the --no-ssh-pty option needs to be passed
+	  when starting the connection.
+
 	  https://mosh.mit.edu
