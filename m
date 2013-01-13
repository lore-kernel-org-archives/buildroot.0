From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jan 2013 15:52:14 +0100
Subject: [Buildroot] [PATCH 2/2] docs/manual: mention the Eclipse integration
In-Reply-To: <1358088734-23460-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358088734-23460-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358088734-23460-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/eclipse-integration.txt |   30 ++++++++++++++++++++++++++++++
 docs/manual/working-with.txt        |    2 ++
 2 files changed, 32 insertions(+)
 create mode 100644 docs/manual/eclipse-integration.txt

diff --git a/docs/manual/eclipse-integration.txt b/docs/manual/eclipse-integration.txt
new file mode 100644
index 0000000..3d8179f
--- /dev/null
+++ b/docs/manual/eclipse-integration.txt
@@ -0,0 +1,30 @@
+// -*- mode:doc; -*-
+
+Integration with Eclipse
+------------------------
+
+While a part of the embedded Linux developers like classical text
+editors like Vim or Emacs, and command-line based interfaces, a number
+of other embedded Linux developers like richer graphical interfaces to
+do their development work. Eclipse being one of the most popular
+Integrated Development Environment, Buildroot integrates with Eclipse
+in order to ease the development work of Eclipse users.
+
+Our integration with Eclipse simplifies the compilation, remote
+execution and remote debugging of applications and libraries that are
+built on top of a Buildroot system. It does not integrate the
+Buildroot configuration and build processes themselves with
+Eclipse. Therefore, the typical usage model of our Eclipse integration
+would be:
+
+* Configure your Buildroot system with +make menuconfig+, +make
+  xconfig+ or any other configuration interface provided with
+  Buildroot.
+* Build your Buildroot system by running +make+.
+* Start Eclipse to develop, execute and debug your own custom
+  applications and libraries, that will rely on the libraries built
+  and installed by Buildroot.
+
+The Buildroot Eclipse integration installation process and usage is
+described in detail at
+https://github.com/mbats/eclipse-buildroot-bundle/wiki.
diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
index b62bacd..fb6bc40 100644
--- a/docs/manual/working-with.txt
+++ b/docs/manual/working-with.txt
@@ -14,6 +14,8 @@ include::customize.txt[]
 
 include::common-usage.txt[]
 
+include::eclipse-integration.txt[]
+
 Hacking Buildroot
 -----------------
 
-- 
1.7.9.5
