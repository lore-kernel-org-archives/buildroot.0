From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 20 Jul 2011 12:52:08 +0200
Subject: [Buildroot] devtmpfs and initramfs
In-Reply-To: <201107201057.48006.arnout@mind.be> (Arnout Vandecappelle's
 message of "Wed, 20 Jul 2011 10:57:47 +0200")
References: <201107191222.19313.arnout@mind.be>
 <87ei1l2wru.fsf@macbook.be.48ers.dk>
 <CALR4fELkEBNtLS2WYXVkLkpttsMrzbHb04i+KZS+wfp3_TwMzQ@mail.gmail.com>
 <201107201057.48006.arnout@mind.be>
Message-ID: <874o2h2pif.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> > #!/bin/sh
 >> > # devtmpfs does not get automounted for initramfs'es
 >> > /bin/mount -t devtmpfs devtmpfs /dev
 >> > exec /sbin/init $*
 >> > 
 >> > Unless BR2_ROOTFS_DEVICE_CREATION_STATIC is enabled.
 >> 
 >> Sorry, but this solution smells just like my socks. I think wk can find a
 >> better one :)

 Arnout>  Yeah, I also would prefer not to proliferate the number of
 Arnout> ways that the init process is influenced...

I don't see what there is to dislike. With this, the non-standard
behaviour of initramfs'es is nicely self contained within the initramfs
support code, and nothing else needs to know about it. There's nothing
to tweak, and it just works out of the box (tm), no matter what init
implementation or custom inittab is used.

You could argue that the shell overhead is a bit of a turn down, but
this is no worse than a S01mountall init script.

-- 
Bye, Peter Korsgaard
