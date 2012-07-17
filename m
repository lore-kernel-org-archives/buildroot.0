From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 19:42:04 +0200
Subject: [Buildroot] [git commit] doc: Add FAQ entries from the old
	HTML-only documentation
Message-ID: <20120717174314.CFBF396A7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6580011f12e6ca8f7eb87af11d4e9d6def4316f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/faq.txt    |   38 ++++++++++++++++++++++++++++++++++++++
 docs/manual/manual.txt |    2 ++
 2 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/docs/manual/faq.txt b/docs/manual/faq.txt
new file mode 100644
index 0000000..575d019
--- /dev/null
+++ b/docs/manual/faq.txt
@@ -0,0 +1,38 @@
+Frequently Asked Questions
+==========================
+
+The boot hangs after 'Starting network...'
+------------------------------------------
+
+If the boot process seems to hand after the following messages
+(messages not necessarily exactly similar, depending on the list of
+packages selected):
+
+------------------------
+Freeing init memory: 3972K
+Initializing random number generator... done.
+Starting network...
+Starting dropbear sshd: generating rsa key... generating dsa key... OK
+------------------------
+
+then it means that your system is running, but didn't start a shell on
+the serial console. In order to have the system start a shell on your
+serial console, you have to go in the Buildroot configuration, +System
+configuration+, and modify +Port to run a getty (login prompt) on+ and
++Baudrate to use+ as appropriate. This will automatically tune the
++/etc/inittab+ file of the generated system so that a shell starts on
+the correct serial port.
+
+module-init-tools fails to build with 'cannot find -lc'
+-------------------------------------------------------
+
+If the build of +module-init-tools+ for the host fails with:
+
+------------------------
+/usr/bin/ld: cannot find -lc
+------------------------
+
+then probably you are running a Fedora (or similar) distribution, and
+you should install the +glibc-static+ package. This is because the
++module-init-tools+ build process wants to link statically against the
+C library.
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 732b50c..de4b594 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -31,4 +31,6 @@ include::download-location.txt[]
 
 include::adding-packages.txt[]
 
+include::faq.txt[]
+
 include::appendix.txt[]
