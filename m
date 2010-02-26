From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 26 Feb 2010 11:27:37 +0100
Subject: [Buildroot] Reduce rootfs size
In-Reply-To: <13abadeb1002260205t514e1150wc23e4ba75a427e53@mail.gmail.com>
	(Nuno Pereira's message of "Fri, 26 Feb 2010 10:05:31 +0000")
References: <13abadeb1002250943r17888defs4976934b3718d5d9@mail.gmail.com>
	<87wry13yhs.fsf@macbook.be.48ers.dk>
	<13abadeb1002260205t514e1150wc23e4ba75a427e53@mail.gmail.com>
Message-ID: <87ocjc47hi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nuno" == Nuno Pereira <fxss@iol.pt> writes:

 Nuno> Hi,
 Nuno> I'm using a PPC architecture and the maximum size available for the
 Nuno> rootfs is 1.114.111 bytes.

 Nuno> My config is:

 Nuno> BR2_BUSYBOX_VERSION_1_16_X=y
 Nuno> BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.16.x.config"

You probably don't need all the busybox applets provided in the default
config. Run make busybox-menuconfig; make to tweak the config.

 Nuno> #
 Nuno> # text rendering libraries
 Nuno> #
 Nuno> BR2_PACKAGE_NCURSES=y

Do you really need ncurses?

 Nuno> BR2_TARGET_ROOTFS_CRAMFS=y

Consider using squashfs instead for better compression.

 Nuno> Concerning libstdc++ I prefer to link dynamically.

Ok.

-- 
Bye, Peter Korsgaard
