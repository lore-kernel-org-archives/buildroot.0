From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 20 Jul 2011 17:29:26 +0200
Subject: [Buildroot] devtmpfs and initramfs
In-Reply-To: <201107201710.45727.arnout@mind.be> (Arnout Vandecappelle's
 message of "Wed, 20 Jul 2011 17:10:45 +0200")
References: <201107191222.19313.arnout@mind.be>
 <CALR4fELkEBNtLS2WYXVkLkpttsMrzbHb04i+KZS+wfp3_TwMzQ@mail.gmail.com>
 <201107201057.48006.arnout@mind.be>
 <201107201710.45727.arnout@mind.be>
Message-ID: <87y5zt0y3t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout>  Okay, I should have shut up and listened to the buildroot master...

;)

 Arnout>  The inittab thing won't work (well) because init needs /dev to
 Arnout> have a console.

I just pushed a commit adding the pre-init shell wrapper I mentioned
earlier. Seems to work fine based on a quick test in qemu.

Alternatively we could try to convince the kernel people that it makes
sense to make CONFIG_DEVTMPFS_MOUNT work with initramfs as well. It's
simple to do so (just stick a devtmpfs_mount("dev") at the bottom of
populate_rootfs), but it could potentially break existing initramfs
scripts as the mount -t devtmpfs devtmpfs /dev command will then fail.

-- 
Bye, Peter Korsgaard
