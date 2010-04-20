From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Apr 2010 13:19:30 +0200
Subject: [Buildroot] makedev questions
In-Reply-To: <4BCD83D4.6000306@carallon.com> (William Wagner's message of
	"Tue, 20 Apr 2010 11:37:08 +0100")
References: <4BCD83D4.6000306@carallon.com>
Message-ID: <8739yqbccd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "William" == William Wagner <will_wagner@carallon.com> writes:

 William> Hello,
 William> Just trying to get everything working again following recent changes
 William> in git. After the makedev change I have a couple of questions.

 William> Should the default value for BR2_PACKAGE_MAKEDEVS not be y?
 William> Without it you get a rootfs without any device nodes. Or am I
 William> missing something?

No, BR2_PACKAGE_MAKEDEVS is for compiling makedevs to run on the target
(unlikely to be interesting).

Don't you have build/host-makedevs built? It seems to work here.

 William> Also am I right to think that TARGET_DEVICE_TABLE has been removed?

Yes, it was removed in 64ec20e6c0 - Replaced by BR2_ROOTFS_DEVICE_TABLE.

 William> There still appears to be a reference to it at
 William> package\busybox\initramfs.mk(106): echo "$(HOST_DIR)/usr/bin/makedevs
 William> -d 
 William> $(TARGET_DEVICE_TABLE) $(BUILD_DIR)/initramfs"; \

That file isn't used anywhere - I've removed it now.

-- 
Bye, Peter Korsgaard
