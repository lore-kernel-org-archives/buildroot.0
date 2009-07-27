From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Jul 2009 14:47:53 +0200
Subject: [Buildroot] [git commit] docs: describe BR2_ROOTFS_POST_BUILD_SCRIPT
Message-ID: <20090727124839.E146277804@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=53fd73611c93f55215356444a15d3f615fd74003
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Mack <daniel@caiaq.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index e97d601..b49208c 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -37,6 +37,7 @@
       <li><a href="#external_toolchain">Use an external toolchain</a></li>
       <li><a href="#downloaded_packages">Location of downloaded packages</a>
       </li>
+      <li><a href="#adapting_rootfs">Adapting the rootfs for own binaries</a></li>
       <li><a href="#add_software">Extending Buildroot with more
       Software</a></li>
       <li><a href="#links">Resources</a></li>
@@ -877,6 +878,22 @@ It allows to generate toolchains based on <i>uClibc</i>, <i>glibc</i>
 and <i>eglibc</i> for a wide range of architectures, and has good
 community support.</p>
 
+      <h2><a name="adapting_rootfs" id="adapting_rootfs">Adapting the rootfs
+      for own binaries</h2>
+
+      <p>When using BR2 in an environment where own software binaries or
+      static data should be part of the generated rootfs package, the
+      <code>BR2_ROOTFS_POST_BUILD_SCRIPT</code> feature might interest
+      you. You can specify a command here which is called <i>after</i> BR2
+      built all the selected software, but <i>before</i> the the rootfs
+      packages are assembled. The destination rootfs folder is given as
+      first argument. You can add own components here, change
+      default configurations and remove unwanted files.</p>
+      <p>You should, however, use that feature with care. Whenever you
+      find that a certain package generates wrong or unneeded files, you
+      should rather fix than package than working around it with a
+      cleanup script.</p>
+
     <h2><a name="add_software" id="add_software"></a>Extending Buildroot with
     more software</h2>
 
-- 
1.6.3.3
