From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 10:41:05 +0200
Subject: [Buildroot] how to install package ltp-testsuite outside of
	target directory
In-Reply-To: <8729016553E3654398EA69218DA29EEF15B99E23@cnshjmbx02> (YUAN
 Linyu's message of "Tue, 16 May 2017 02:23:33 +0000")
References: <8729016553E3654398EA69218DA29EEF15B99E23@cnshjmbx02>
Message-ID: <8760gz7u5a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "YUAN" == YUAN Linyu <Linyu.Yuan@alcatel-sbell.com.cn> writes:

 > Hi,
 > When I build ltp-testsuite into a ARM initramfs image, it's very big, 
 > so system can't load module which can load without ltp-testsuite built.

 > section 3 reloc 1 sym 'vmalloc_to_page': relocation 28 out of range
 >  (0xbf000034 -> 0xc1a18f1c)

 > I try to build ltp-testsuite outside the target rootfs.,
 > for example, $(BASE_DIR)/ ltp-testsuite, 
 > it need change below configuration in pkg-autotools.mk,
 > and add one configuration item to enable user define a directory for install.

 > $(2)_INSTALL_TARGET_OPTS                ?= DESTDIR=$$(TARGET_DIR) install
 > ==>
 > $(2)_TARGET_DIR		?= $$(TARGET_DIR)
 > $(2)_INSTALL_TARGET_OPTS                ?= DESTDIR=$$($(2)_TARGET_DIR) install

 > anyone have a better solution?

An alternative is to write a post-build script to remove these files
from the rootfs and instead create a seperate filesystem with the ltp
files.

-- 
Bye, Peter Korsgaard
