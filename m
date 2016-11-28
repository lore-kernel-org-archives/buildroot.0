From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2016 22:25:14 +0100
Subject: [Buildroot] [git commit] autossh: honour LDFLAGS
Message-ID: <20161128212549.9913B81A06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=114f5a9310744c2ce5dcc1d254d443d172b25a42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 http://autobuild.buildroot.net/results/08a458572a2e9c599dd32b837b1e5c02a6721973

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/autossh/0001-honour-LDFLAGS.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/autossh/0001-honour-LDFLAGS.patch b/package/autossh/0001-honour-LDFLAGS.patch
new file mode 100644
index 0000000..2e6160b
--- /dev/null
+++ b/package/autossh/0001-honour-LDFLAGS.patch
@@ -0,0 +1,16 @@
+Honour LDFLAGS, especially required when static linking
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur autossh-1.4e.orig/Makefile.in autossh-1.4e/Makefile.in
+--- autossh-1.4e.orig/Makefile.in	2015-02-10 05:41:58.000000000 +0100
++++ autossh-1.4e/Makefile.in	2016-11-25 12:49:06.052122855 +0100
+@@ -31,7 +31,7 @@
+ 
+ 
+ $(TARGET):	$(OFILES)
+-		$(CC) $(CPPFLAGS) -o $(TARGET) $(OFILES) $(LIBS)
++		$(CC) $(CPPFLAGS) $(LDFLAGS) -o $(TARGET) $(OFILES) $(LIBS)
+ 
+ clean:
+ 		- /bin/rm -f *.o *.a *.core *~
