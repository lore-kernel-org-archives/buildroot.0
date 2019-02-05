From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  5 Feb 2019 11:23:48 +0100
Subject: [Buildroot] [PATCH v2 5/5] package/mender: adding a readme file
In-Reply-To: <1549362228-5731-1-git-send-email-angelo@amarulasolutions.com>
References: <1549362228-5731-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1549362228-5731-6-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a readme file with basic instructions to get mender up
and running on a production system.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/mender/readme.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/mender/readme.txt

diff --git a/package/mender/readme.txt b/package/mender/readme.txt
new file mode 100644
index 0000000..329b2a4
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
+Mender uses TLS to communicate with the management server and, if you use a
+CA-signed certificate on the server, you should select the ca-certificates
+package otherwise it doesn't work.
-- 
2.7.4
