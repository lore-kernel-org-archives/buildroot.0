From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Nov 2010 22:36:28 +0100
Subject: [Buildroot] [git commit master 1/1] documentation: add FAQ entry
	concerning serial port configuration
Message-ID: <20101127214027.3AD998D1EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5a51a370f0327936b597f106c82d47af5cfbe76a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index d9df668..bb02f17 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1597,8 +1597,31 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
     <h2 id="faq">Frequently asked questions</h2>
 
     <ul>
+      <li><a href="#faq-boot-hangs">The boot hangs
+      after <code>Starting network...</code></a></li>
     </ul>
 
+    <h3 id="faq-boot-hangs">The boot hangs after <code>Starting
+    network...</code></h3>
+
+    <p>If the boot process seems to hang after the following messages
+    (messages not necessarly exactly similar, depending on the list of
+    packages selected):</p>
+
+    <pre>Freeing init memory: 3972K
+Initializing random number generator... done.
+Starting network...
+Starting dropbear sshd: generating rsa key... generating dsa key... OK</pre>
+
+    <p>then it means that your system is running, but didn't start a
+    shell on the serial console. In order to have the system start a
+    shell on your serial console, you have to go in the Buildroot
+    configuration, <code>Target options</code>, enable <code>Generic
+    serial port config</code>, and select the serial port and speed
+    you would like to use for the shell. This will automatically tune
+    the <code>/etc/inittab</code> file of the generated system so that
+    a shell starts on the correct serial port.</p>
+
     <h2 id="links">Resources</h2>
 
     <p>To learn more about Buildroot you can visit these websites:</p>
-- 
1.7.2.2
