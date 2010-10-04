From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Mon, 04 Oct 2010 17:11:51 +0100
Subject: [Buildroot] =?utf-8?b?Z2V0a3ZlcnNpb24uYzoxNzogZXJyb3I6IOKAmFVU?=
 =?utf-8?q?S=5FRELEASE=E2=80=99_undeclared_=28first_use_in_this_function?=
 =?utf-8?q?=29?=
Message-ID: <1286208711.32376.10.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 
After read this:
http://www.mail-archive.com/blfs-support at linuxfromscratch.org/msg06766.html
found this patch solve the problem : 

--- nfs-utils-1.0.9/tools/Makefile.am.orig  2006-07-07 20:04:32.000000000 -0400
+++ nfs-utils-1.0.9/tools/Makefile.am   2006-09-11 14:39:11.000000000 -0400
@@ -1,5 +1,5 @@
 ## Process this file with automake to produce Makefile.in
 
-SUBDIRS = getiversion getkversion locktest rpcdebug rpcgen nlmtest
+SUBDIRS = locktest rpcdebug rpcgen nlmtest
 
 MAINTAINERCLEANFILES = Makefile.in


For this compile error: 
Making install in getkversion
make[3]: Entering directory `/home/sergio/hardware/moviecube/buildroot/output/build/nfs-utils-1.0.10/tools/getkversion'
(...)
getkversion.c: In function ?main?:
getkversion.c:17: error: ?UTS_RELEASE? undeclared (first use in this function)
getkversion.c:17: error: (Each undeclared identifier is reported only once
getkversion.c:17: error: for each function it appears in.)
make[3]: *** [getkversion-getkversion.o] Error 1
make[3]: Leaving directory `/home/sergio/hardware/moviecube/buildroot/output/build/nfs-utils-1.0.10/tools/getkversion'
make[2]: *** [install-recursive] Error 1
make[2]: Leaving directory `/home/sergio/hardware/moviecube/buildroot/output/build/nfs-utils-1.0.10/tools'
make[1]: *** [install-recursive] Error 1
make[1]: Leaving directory `/home/sergio/hardware/moviecube/buildroot/output/build/nfs-utils-1.0.10'

Best regards
-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3293 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101004/2b34eacc/attachment.bin>
