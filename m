From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 20:54:19 +0100
Subject: [Buildroot] [git commit] Add basic config infrastructure for host
	utilities
Message-ID: <20120202201521.6FF9D9099F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d06e802223b20a1ee3e365cbfbce4ae2ca7da1b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most of the host packages don't have to be exposed to the user as they
are only used as build dependencies of target packages.

However, some host utilities, such as flashing utilities, image
creation programs, specific debuggers, might be useful and should be
presented to the user.

Therefore, we have a new global menu, which lists those host
utilities. These utilities are described in package/*/Config.in.host
files, which will be sourced by package/Config.in.host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in              |    2 ++
 package/Config.in.host |    3 +++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index ab77ef3..8579a63 100644
--- a/Config.in
+++ b/Config.in
@@ -371,6 +371,8 @@ source "target/generic/Config.in"
 
 source "package/Config.in"
 
+source "package/Config.in.host"
+
 source "fs/Config.in"
 
 source "boot/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
new file mode 100644
index 0000000..54f6a59
--- /dev/null
+++ b/package/Config.in.host
@@ -0,0 +1,3 @@
+menu "Host utilities"
+
+endmenu
