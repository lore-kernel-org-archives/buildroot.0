From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Jan 2009 10:01:22 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/sudo
In-Reply-To: <3E6BC440132F4E6AAB290D7AFA898029@aeglos> (Ulf Samuelsson's
	message of "Mon\, 12 Jan 2009 09\:42\:31 +0100")
References: <20090112000650.6225C76736@busybox.osuosl.org>
	<87bpudjaxl.fsf@macbook.be.48ers.dk>
	<3E6BC440132F4E6AAB290D7AFA898029@aeglos>
Message-ID: <87hc44j3tp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 >> Ok, so this reverts your revert and we're now back to my 24763
 >> version?
 >> 

 Ulf> No, your patch breaks the build, because the filename has changed
 Ulf> from the original name.

Huh, it built here.

Are you saying that sudo_1.6.8p12.orig.tar.gz doesn't exist on your
Debian mirror of choice?

Here's r24763 again for your reference.

commit 5c3d918e2f5cbf48aba250c2da1d9c9a3eb440b8
Author: jacmet <jacmet@69ca8d6d-28ef-0310-b511-8ec308f3f277>
Date:   Sun Jan 11 20:36:17 2009 +0000

    sudo: use Debian as upstream
    
    As we are using a Debian/Ubuntu patch, it makes more sense to get the
    tarball from there as well.
    
    git-svn-id: svn+ssh://uclibc.org/svn/trunk/buildroot at 24763 69ca8d6d-28ef-0310-b511-8ec308f3f277

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index d36b531..fc76955 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -5,15 +5,13 @@
 #############################################################
 
 SUDO_VERSION:=1.6.8p12
-#SUDO_SITE:=ftp://ftp.sudo.ws/pub/sudo/
-SUDO_SITE:=$(BR2_ATMEL_MIRROR)
+SUDO_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sudo
 
 #SUDO_VERSION:=1.7.0
 #SUDO_SITE:=http://www.courtesan.com/sudo/dist
 # 1.7.0 Needs update Cross-Compiler patches
 
-
-SUDO_SOURCE:=sudo-$(SUDO_VERSION).tar.gz
+SUDO_SOURCE:=sudo_$(SUDO_VERSION).orig.tar.gz
 SUDO_DIR:=$(BUILD_DIR)/sudo-$(SUDO_VERSION)
 SUDO_UNZIP:=$(ZCAT)

-- 
Bye, Peter Korsgaard
