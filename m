From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Nov 2010 22:36:28 +0100
Subject: [Buildroot] [git commit master 1/1] documentation: add FAQ entry
	about glibc-static issue on Fedora
Message-ID: <20101127214027.79F688CA80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=706683b8b912aa3304d71652d7a4a74d8b74f58e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index bb02f17..f471962 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1599,6 +1599,8 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
     <ul>
       <li><a href="#faq-boot-hangs">The boot hangs
       after <code>Starting network...</code></a></li>
+      <li><a href="#module-init-tools-doesnt-build">module-init-tools
+      fails to build with <code>cannot find -lc</code></a></li>
     </ul>
 
     <h3 id="faq-boot-hangs">The boot hangs after <code>Starting
@@ -1622,6 +1624,19 @@ Starting dropbear sshd: generating rsa key... generating dsa key... OK</pre>
     the <code>/etc/inittab</code> file of the generated system so that
     a shell starts on the correct serial port.</p>
 
+    <h3 id="module-init-tools-doesnt-build">module-init-tools
+      fails to build with <code>cannot find -lc</code></h3>
+
+    <p>If the build of <i>module-init-tools</i> for the host fails
+    with:</p>
+
+    <pre>/usr/bin/ld: cannot find -lc </pre>
+
+    <p>then probably you are running a Fedora (or similar)
+    distribution, and you should install the <code>glibc-static</code>
+    package. This is because the <i>module-init-tools</i> build
+    process wants to link statically against the C library.</p>
+
     <h2 id="links">Resources</h2>
 
     <p>To learn more about Buildroot you can visit these websites:</p>
-- 
1.7.2.2
