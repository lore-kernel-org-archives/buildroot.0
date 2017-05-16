From: YUAN Linyu <Linyu.Yuan@alcatel-sbell.com.cn>
Date: Tue, 16 May 2017 02:23:33 +0000
Subject: [Buildroot] how to install package ltp-testsuite outside of target
	directory
Message-ID: <8729016553E3654398EA69218DA29EEF15B99E23@cnshjmbx02>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

When I build ltp-testsuite into a ARM initramfs image, it's very big, 
so system can't load module which can load without ltp-testsuite built.

section 3 reloc 1 sym 'vmalloc_to_page': relocation 28 out of range
 (0xbf000034 -> 0xc1a18f1c)

I try to build ltp-testsuite outside the target rootfs.,
for example, $(BASE_DIR)/ ltp-testsuite, 
it need change below configuration in pkg-autotools.mk,
and add one configuration item to enable user define a directory for install.

$(2)_INSTALL_TARGET_OPTS                ?= DESTDIR=$$(TARGET_DIR) install
==>
$(2)_TARGET_DIR		?= $$(TARGET_DIR)
$(2)_INSTALL_TARGET_OPTS                ?= DESTDIR=$$($(2)_TARGET_DIR) install

anyone have a better solution?

thanks
