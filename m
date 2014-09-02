From: Romain Naour <romain.naour@openwide.fr>
Date: Tue,  2 Sep 2014 21:01:03 +0200
Subject: [Buildroot] [PATCH 2/2] package/setserial: remove documentation
In-Reply-To: <1409684463-7457-1-git-send-email-romain.naour@openwide.fr>
References: <1409684463-7457-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1409684463-7457-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/4d6/4d61f60ed94a7a1ddb1bc1b11173967e1d65c8d3/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../setserial-003-remove-documentation.patch       | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/setserial/setserial-003-remove-documentation.patch

diff --git a/package/setserial/setserial-003-remove-documentation.patch b/package/setserial/setserial-003-remove-documentation.patch
new file mode 100644
index 0000000..e3919c9
--- /dev/null
+++ b/package/setserial/setserial-003-remove-documentation.patch
@@ -0,0 +1,39 @@
+From 0058e1a2c537ff5f98472f78f8f69f6d60e9283f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Tue, 2 Sep 2014 20:49:30 +0200
+Subject: [PATCH 1/1] setserial: remove documentation
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Makefile.in | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index ad8b2ef..872bd80 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -17,19 +17,14 @@ DEFS = @DEFS@
+ INCS = -I.
+ TAR = tar
+ 
+-all: setserial setserial.cat
++all: setserial
+ 
+ setserial: setserial.c
+ 	$(CC) $(CFLAGS) $(DEFS) $(INCS) setserial.c -o setserial
+ 
+-setserial.cat: setserial.8
+-	nroff -man setserial.8 > setserial.cat
+-
+-install: setserial setserial.8
++install: setserial
+ 	mkdir -p $(DESTDIR)/usr/bin
+ 	$(INSTALL_PROGRAM) setserial $(DESTDIR)/usr/bin
+-	mkdir -p $(DESTDIR)/usr/share/man/man8
+-	$(INSTALL_DATA) setserial.8 $(DESTDIR)/usr/share/man/man8
+ 
+ clean:
+ 	$(RM) setserial setserial.o setserial.cat *~
+-- 
+1.9.3
+
-- 
1.9.3
