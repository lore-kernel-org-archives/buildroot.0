From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 14:09:36 +0100
Subject: [Buildroot] [git commit] package/mender: adding a readme file
Message-ID: <20190205130901.89AF083F64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6f00c5047f90b350d81650092f204fb73c45b8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a readme file with basic instructions to get mender up
and running on a production system.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Acked-by: <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender/readme.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/mender/readme.txt b/package/mender/readme.txt
new file mode 100644
index 0000000000..329b2a42f2
--- /dev/null
+++ b/package/mender/readme.txt
@@ -0,0 +1,18 @@
+=== Notes on using Mender on Buildroot
+======================================
+Default configurations files
+----------------------------
+
+Buildroot comes with a default artifact_info and device_type configuration files
+in /etc/mender. They contain default values, and thus they should be overridden
+on a production system.
+
+The simplest way to do it is to change these files in an overlay or in a post
+build script.
+
+Configuring mender with certificates
+------------------------------------
+
+Mender uses TLS to communicate with the management server, and if you use a
+CA-signed certificate on the server, you should select the ca-certificates
+package otherwise it doesn't work.
