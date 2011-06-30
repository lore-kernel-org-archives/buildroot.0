From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 30 Jun 2011 18:47:33 +0000
Subject: [Buildroot] modprobe && .xz files??
Message-ID: <F9C551623D2CBB4C9488801D14F864C603A563@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the busybox config file I select the option
"make[...]modprobe[...]understand xz" and I expect this to work -- I've
seen it work on Slackware install images before.  Anywho, I externally
(to buildroot) build the kernel, run a
make INSTALL_MOD_PATH=$(TARGET_RFS)/output/target modules_install
where TARGET_RFS == buildroot/output/target
and get the modules into the dir.  Next, I run the shell command:

@for i in `find $(TARGET_RFS)/lib/modules/$(KERNEL_VERSION) \
 -name *\.ko` ; do xz $$i ; done

and finally I do a:
make $(BUILDROOT)/output/images/rootfs.tar
make $(BUILDROOT)/output/images/rootfs.jffs2

So, I end up with three files (one is a tar.bz2).  I can insmod any of
the modules I want:

insmod /lib/modules/$(KERNEL_VERSION)/kernel/net/my_eth1.ko.xz

and I have no problems at all.  However, I _should_ be able to do a
modprobe my_eth1
and have it fire up.

I'm sure I just need to modify my modules.dep or modules.alias, but that
is the question:

How do I go about telling modprobe to look for the <mod name>.ko.xz?


Thanks,
Andy
