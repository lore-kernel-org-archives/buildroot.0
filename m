From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 18:10:22 +0200
Subject: [Buildroot] [PATCH 2/2] documentation: mention the new xconfig
	interface
In-Reply-To: <cover.1248711019.git.thomas.petazzoni@free-electrons.com>
References: <cover.1248711019.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d9a9501771d0aeb22967adeec9e0ac232e1a003d.1248711019.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES             |    2 ++
 docs/buildroot.html |   24 ++++++++++++++++++------
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0d6ac97..ba3da53 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,6 +10,8 @@
 	removed mandatory dependency on useless libraries such as
 	libXt or libXaw.
 
+	New QT-based configurator, usable using 'make xconfig'.
+
 	Issues resolved (http://bugs.uclibc.org):
 
 	#83: liblockfile fails to compile due to eaccess redefinition
diff --git a/docs/buildroot.html b/docs/buildroot.html
index b49208c..8cd705d 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -155,6 +155,17 @@
  $ make menuconfig
 </pre>
 
+<p>to run the curses-based configurator, or</p>
+
+<pre>
+ $ make xconfig
+</pre>
+
+    <p>to run the Qt3-based configurator. On Debian-like systems, the
+    <code>libncurses5-dev</code> package is required to use the
+    <i>menuconfig</i> interface, and the <code>libqt3-mt-dev</code> is
+    required to use the <i>xconfig</i> interface.</p>
+
     <p>For each entry of the configuration tool, you can find associated help
     that describes the purpose of the entry. </p>
 
@@ -219,9 +230,9 @@
     <h3><a name="offline_builds" id="offline_builds"></a>
     Offline builds</h3>
 
-    <p>If you intend to do an offline-build and just want to download all
-    sources that you previously selected in &quot;make menuconfig&quot; then
-    issue:</p>
+    <p>If you intend to do an offline-build and just want to download
+    all sources that you previously selected in the configurator
+    (<i>menuconfig</i> or <i>xconfig</i>) then issue:</p>
 <pre>
  $ make source
 </pre>
@@ -340,9 +351,10 @@ $ make me&lt;TAB&gt;
       is made. So simply rebuilding the image by running
       make should propagate any new changes to the image. </li>
 
-      <li>When configuring the build system, using <code>make menuconfig</code>,
-      you can specify the contents of the /etc/hostname and /etc/issue
-      (the welcome banner) in the <code>PROJECT</code> section</li>
+      <li>When configuring the build system, using <code>make
+      menuconfig</code> or <code>make xconfig</code>, you can specify
+      the contents of the /etc/hostname and /etc/issue (the welcome
+      banner) in the <code>PROJECT</code> section</li>
     </ul>
 
     <h2><a name="custom_busybox" id="custom_busybox"></a>Customizing the
-- 
1.6.0.4
