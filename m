From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Apr 2018 20:58:41 +0200
Subject: [Buildroot] bash: /dev/fd/62: No such file or directory
In-Reply-To: <3dd2f190fef3d71e1b2f1f5ec6f4323e8ee8c745.camel@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?= Krause"'s message of "Wed, 04 Apr 2018 20:12:08
 +0200")
References: <1521154501.16532.15.camel@embedded.rocks>
 <874llggl14.fsf@dell.be.48ers.dk>
 <d624af0cde7298851332a2fc009f173562d99d98.camel@embedded.rocks>
 <877ept7r7w.fsf@dell.be.48ers.dk>
 <3dd2f190fef3d71e1b2f1f5ec6f4323e8ee8c745.camel@embedded.rocks>
Message-ID: <87d0zeol26.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

Hi,

 >> > but I am unsure how to add those symlinks to the static
 >> > /dev. makedevs does not support symbolic links.
 >> 
 >> Heh, you are right. We can either:
 >> 
 >> - Add a BASH_ROOTFS_PRE_CMD_HOOKS hook in bash.mk if static /dev is used
 >> to create these symlinks
 >> 
 >> - Extend the makedevs code to also support symlinks
 >> 
 >> - Completely ignore this issue for static /dev
 >> 
 >> The first option is probably the easiest/nicest.

 > It turned out that nothing needs to be done for static /dev as the
 > symlinks are created now by the init system.

But how can that work? static /dev normally means readonly /dev.

-- 
Bye, Peter Korsgaard
