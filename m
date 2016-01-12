From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2016 23:35:08 +0100
Subject: [Buildroot] [git commit] dropbear: add help text about key creation
Message-ID: <20160112223529.F209F8274F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e146d82b96b471886f00c64a2661df9d4ba0d8c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit e7d04dd2d replaced /etc/dropbear with a symlink to /var/run and
updated the start scripts to replace it with a real directory, so the
keys would be persistent. However, it turns out that this is pretty
confusing even for expert users, who don't know how to make the keys
really persistent now.

Update the help text explaining what the issue is, and telling the user
to replace the /etc/dropbear symlink with a symlink to a persistent
directory. Also mention the possiblity of unionfs.

Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index c14c654..d92361f 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -4,6 +4,15 @@ config BR2_PACKAGE_DROPBEAR
 	help
 	  A small SSH 2 server designed for small memory environments.
 
+	  Note that dropbear requires a per-device unique host key. The
+	  key will be generated when dropbear starts, but it is not
+	  persistent over reboot (if you have a read-only rootfs) or
+	  upgrade (if you have a read-write rootfs). To make the key
+	  persistent, replace /etc/dropbear with a symlink to a
+	  directory on a persistent, writeable filesystem.
+	  Alternatively, mount a persistent unionfs over your root
+	  filesystem.
+
 	  http://matt.ucc.asn.au/dropbear/dropbear.html
 
 if BR2_PACKAGE_DROPBEAR
