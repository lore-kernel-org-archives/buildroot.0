From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 27 Dec 2012 20:45:18 +0200
Subject: [Buildroot] [PATCH v2 2/2] rxvt-unicode: new package
In-Reply-To: <1356633918-16114-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1356633918-16114-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1356633918-16114-2-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will ensure that rxvt-terminfo files will be created.
Upstream-Status: Pending

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 .../rxvt-unicode/rxvt-unicode-9.15-terminfo.patch  |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch

diff --git a/package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch b/package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch
new file mode 100644
index 0000000..910ce76
--- /dev/null
+++ b/package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch
@@ -0,0 +1,12 @@
+diff -Naur rxvt-unicode-9.15.org/doc/Makefile.in rxvt-unicode-9.15/doc/Makefile.in
+--- rxvt-unicode-9.15.org/doc/Makefile.in	2012-04-11 23:57:47.105465883 +0300
++++ rxvt-unicode-9.15/doc/Makefile.in	2012-04-12 00:02:13.848367530 +0300
+@@ -102,7 +102,7 @@
+ 	$(INSTALL_DATA) rxvt.7.man  $(DESTDIR)$(man7dir)/$(RXVTNAME).$(man7ext)
+ @IF_PERL@	$(INSTALL) -d $(DESTDIR)$(man3dir)
+ @IF_PERL@	$(INSTALL_DATA) rxvtperl.3.man $(DESTDIR)$(man3dir)/$(RXVTNAME)perl.$(man3ext)
+-	@TIC@ $(srcdir)/etc/rxvt-unicode.terminfo
++	@TIC@ $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)/usr/share/terminfo
+ 
+ distdepend: alldoc
+ 
-- 
1.7.7.6
