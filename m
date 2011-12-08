From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Dec 2011 11:48:14 +0100
Subject: [Buildroot] buildroot with SquashFS root file system
In-Reply-To: <4EE091EE.2010504@neotion.com> (Emmanuel BOUAZIZ's message of
 "Thu, 08 Dec 2011 11:31:10 +0100")
References: <4EDE32C3.7020400@neotion.com>
 <201112060956.07523.minimod@morethan.org>
 <4EDE57E6.4040007@neotion.com>
 <201112061216.46659.minimod@morethan.org>
 <4EE091EE.2010504@neotion.com>
Message-ID: <87pqfzbaq9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Emmanuel" == Emmanuel BOUAZIZ <ebouaziz@neotion.com> writes:

Hi,

 Emmanuel> Yes it's enabled. I've put that same mechanism in squashfs
 Emmanuel> (modified fs/squashfs/squashfs.mk and added fs/squashfs/init)
 Emmanuel> and added init=/init in kernel parameters but the /init
 Emmanuel> script is not run.

Initrd uses /linuxrc, not /init.

 Emmanuel> The only remaining problem is that the whole filesystem is
 Emmanuel> read-only despite the 'rw' including /var and /tmp.

That's because you're using squashfs. Squashfs is a readonly
filesystem. Either move to initramfs or use ext2 in your initrd.

/tmp should be a tmpfs though (check /etc/fstab), and most of /var
symlinks to /tmp/.

-- 
Bye, Peter Korsgaard
