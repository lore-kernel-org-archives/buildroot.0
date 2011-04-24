From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Sun, 24 Apr 2011 19:30:01 +0100
Subject: [Buildroot] [patch] add trival depencies on lockfile-progs,
 should I  open a bug report ?
Message-ID: <1303669801.6869.13.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 
I saw this problem a some months ago, is not a new problem.
lockfile-progs must have liblockfile compiled first. 
This patch prevents a compile error when I am building buildroot. And as
work around I have to done:
make liblockfile; make 
to continue the build.

diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk                                           
index f8d8cee..031712e 100644                                                                                                              
--- a/package/lockfile-progs/lockfile-progs.mk                                                                                             
+++ b/package/lockfile-progs/lockfile-progs.mk                                                                                             
@@ -6,6 +6,7 @@                                                                                                                            
 LOCKFILE_PROGS_VERSION = 0.1.15                                                                                                           
 LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz                                                                   
 LOCKFILE_PROGS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs/                                                             
+LOCKFILE_PROGS_DEPENDENCIES = liblockfile                                                                                                 
                                                                                                                                           
 LOCKFILE_BINS = \                                                                                                                         
    $(addprefix lockfile-,check create remove touch) \       

Best regards,               
-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3309 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110424/efa3ef13/attachment.bin>
