From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Feb 2018 23:13:41 +0100
Subject: [Buildroot] Read only rootfs with writable (aufs) overlay
In-Reply-To: <5a8b48c6.06581c0a.8860b.c092@mx.google.com> (Alex Hildebrand's
 message of "Mon, 19 Feb 2018 22:59:34 +0100")
References: <5a8b48c6.06581c0a.8860b.c092@mx.google.com>
Message-ID: <87r2pghbl6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alex" == Alex Hildebrand <alexander.hildebrand@googlemail.com> writes:

 > So switch_root does not work when used without an initramfs?

Correct. switch_root is specific to initramfs. See the description at
the bottom of switch_root.c:

https://git.buildroot.net/busybox/tree/util-linux/switch_root.c


 > Tried it directly from my read only rootfs but it does not change the
 > root...  Is this the same with in-kernel overlayfs?

Yes, this is independent of the overlay fs implementation. If you only
want to add the overlay to a subset of the tree (E.G /etc), then you can
do it from your rootfs, but not when you want to replace /.

-- 
Bye, Peter Korsgaard
