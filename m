From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 7 May 2013 16:43:29 -0500
Subject: [Buildroot] [PATCH v2 2/2] lockdev: add lockdev
In-Reply-To: <20130507210506.GD22338@free.fr>
References: <1367618887-25757-1-git-send-email-spenser@gillilanding.com>
 <1367959620-17176-1-git-send-email-spenser@gillilanding.com>
 <1367959620-17176-2-git-send-email-spenser@gillilanding.com>
 <20130507210506.GD22338@free.fr>
Message-ID: <CAEBucnAKerXvtXSEzwxLma+=seVEqBH65QiMaZC4fcgrsm-CGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

> Alphabetical order, please ('o' comes after 'm', as far as I know! ;-) )

Fixed. Will resubmit.

> What is the SONAME of the library? You only need to install the library
> to a file named as the SONAME, not any other symlink is required.
>
> But of course, if "development files on target" are selected you need
> the .so symlink (but devel-files-on-target this is deprecated now).

$ objdump liblockdev.1.0.3.so -p | grep SONAME
  SONAME               liblockdev.so.1

So, just install liblockdev.so.1 .  This needs to be changed in the
TARGET_CMDS not the STAGING_CMDS, correct? IE.

+define LOCKDEV_INSTALL_TARGET_CMDS
+     $(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) install
+     ln -sf $(TARGET_DIR)/usr/lib/liblockdev.$(LOCKDEV_VERSION).so
$(TARGET_DIR)/usr/lib/liblockdev.so.1

Thanks, I'll shoot another patch out soon.

Spenser
