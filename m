From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Aug 2015 17:36:59 +0200
Subject: [Buildroot] [git commit] website: make a symlink for the manual at
	the root of the website
Message-ID: <20150826153725.9AAA981EAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0af33406a7df270adb1a1b28089d259eb02d0537
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will give us a shorter URL, that we can more easily refer to in the
documetation itself, in help texts, on IRC...

[Peter: Use buildroot.org everywhere]
Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/contribute.html    |    2 +-
 docs/website/docs.html          |    2 +-
 docs/website/manual.html        |    1 +
 package/Config.in               |   23 +++++++++++------------
 package/rpi-firmware/config.txt |    2 +-
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/docs/website/contribute.html b/docs/website/contribute.html
index 17ed26f..c68a8a7 100644
--- a/docs/website/contribute.html
+++ b/docs/website/contribute.html
@@ -26,7 +26,7 @@ There are many different ways to contribute:</p>
 </ul>
 
 <p>For more details on these topics, check out the
-<a href="http://buildroot.uclibc.org/downloads/manual/manual.html#_contributing_to_buildroot">
+<a href="http://buildroot.org/manual.html#_contributing_to_buildroot">
 Contributing to buildroot</a> chapter in the Buildroot manual. Thanks for your help!</p>
 
 <p>If you need any support yourself, have a look at <a href="./support.html">
diff --git a/docs/website/docs.html b/docs/website/docs.html
index 3bd3172..6edc989 100644
--- a/docs/website/docs.html
+++ b/docs/website/docs.html
@@ -11,7 +11,7 @@ things. It is available as:</p>
 
 <h4>Latest stable release</h4>
 <ul>
-  <li><a href="/downloads/manual/manual.html">Online HTML</a></li>
+  <li><a href="/manual.html">Online HTML</a></li>
   <li><a href="/downloads/manual/manual.pdf">PDF document</a></li>
   <li><a href="/downloads/manual/manual.text">ASCII text</a></li>
 </ul>
diff --git a/docs/website/manual.html b/docs/website/manual.html
new file mode 120000
index 0000000..bd5552e
--- /dev/null
+++ b/docs/website/manual.html
@@ -0,0 +1 @@
+/downloads/manual/manual.html
\ No newline at end of file
diff --git a/package/Config.in b/package/Config.in
index eb28ccb..783fbb4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1373,18 +1373,17 @@ endif
 endmenu
 
 menu "Package managers"
-comment "-----------------------------------------------------"
-comment "Please note:                                         "
-comment "- Buildroot does *not* generate binary packages,     "
-comment "- Buildroot does *not* install any package database. "
-comment "*                                                    "
-comment "It is up to you to provide those by yourself if you  "
-comment "want to use any of those package managers.           "
-comment "*                                                    "
-comment "See the manual:                                      "
-comment "http://buildroot.org/downloads/manual/manual.html#faq"
-comment "-no-binary-packages                                  "
-comment "-----------------------------------------------------"
+comment "-------------------------------------------------------"
+comment "Please note:                                           "
+comment "- Buildroot does *not* generate binary packages,       "
+comment "- Buildroot does *not* install any package database.   "
+comment "*                                                      "
+comment "It is up to you to provide those by yourself if you    "
+comment "want to use any of those package managers.             "
+comment "*                                                      "
+comment "See the manual:                                        "
+comment "http://buildroot.org/manual.html#faq-no-binary-packages"
+comment "-------------------------------------------------------"
 	source "package/ipkg/Config.in"
 	source "package/opkg/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/rpi-firmware/config.txt b/package/rpi-firmware/config.txt
index aa8d2ab..58cc966 100644
--- a/package/rpi-firmware/config.txt
+++ b/package/rpi-firmware/config.txt
@@ -1,7 +1,7 @@
 # Please note that this is only a sample, we recommend you to change it to fit
 # your needs.
 # You should override this file using a post-build script.
-# See http://buildroot.org/downloads/manual/manual.html#rootfs-custom
+# See http://buildroot.org/manual.html#rootfs-custom
 # and http://elinux.org/RPiconfig for a description of config.txt syntax
 
 kernel=zImage
