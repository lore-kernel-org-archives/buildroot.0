From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Thu, 18 Oct 2012 08:17:31 +0200
Subject: [Buildroot] export ARCH and CROSS_COMPILE for the post build script
Message-ID: <507F9EFB.60601@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Could we make the export of PATH and CROSS_COMPILE to the post-build 
script ?
This would be really useful for building an external user application in 
one shot (and I need it in my case).

eg something like this in the top Makefile:

ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
     @$(call MESSAGE,"Executing post-build script")
*ARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS)* 
$(BR2_ROOTFS_POST_BUILD_SCRIPT) $(TARGET_DIR)
endif

Of course this could be implemented as an option.

What do you think about it ?

Thanks
Thierry
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121018/62f707dd/attachment-0001.html>
