From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 11 Dec 2010 00:25:05 +0100
Subject: [Buildroot] [PATCH 1/1] fix libcgi build
In-Reply-To: <mailman.1020.1292018149.23999.buildroot@busybox.net>
Message-ID: <D55DC39915444C6D8659D9A0CCA2EAFD@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
In response to RE: buildroot Digest, Vol 54, Issue 80 msg 3

Here is the fix


diff -rupN package/libcgiorg/libcgi.mk package/libcgi/libcgi.mk
--- package/libcgiorg/libcgi.mk	2010-11-30 16:52:43.000000000 +0100
+++ package/libcgi/libcgi.mk	2010-12-11 00:10:21.000000000 +0100
@@ -7,5 +7,6 @@ LIBCGI_VERSION:=1.0
 LIBCGI_SOURCE:=libcgi-$(LIBCGI_VERSION).tar.gz
 
LIBCGI_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge
/libcgi
 LIBCGI_INSTALL_STAGING=YES
+LIBCGI_MAKE_ENV = CC="$(TARGET_CC)" AR="$(TARGET_AR)"
 
 $(eval $(call AUTOTARGETS,package,libcgi))
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br_libcgi.patch
Type: application/octet-stream
Size: 495 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101211/09941102/attachment-0001.obj>
