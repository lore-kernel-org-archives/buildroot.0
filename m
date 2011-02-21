From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 21 Feb 2011 15:19:02 -0600
Subject: [Buildroot] booting JFFS2 or UBIFS created with buildroot
In-Reply-To: <AANLkTimrjTXp24EtKa1zPrf1j6-s-p1twWYA832PAGun@mail.gmail.com>
References: <AANLkTimrjTXp24EtKa1zPrf1j6-s-p1twWYA832PAGun@mail.gmail.com>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F5E11D6@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Charles Krinke
Sent: Monday, February 21, 2011 2:54 PM
To: buildroot at busybox.net
Subject: [Buildroot] booting JFFS2 or UBIFS created with buildroot

Thanks guys for bearing with my first two questions. I believe I can compile u-boot, linux and various file systems such as cpio, jffs2, ubifs so now I get to a new puzzle.

When I create a jffs2 image, I am used to giving u-boot a bootargs line that looks somewhat like:

root=/dev/mtdblock2 rootfstype=jffs2 rw mtdparts=nor:1162k(U-boot),1536k(kernel),-(JFFS2)

Which I believe essentially means that I have created mtdparts partitions on the fly and that the root filesystem should boot at the offset of JFFS2 and that the dynamic creation on the fly of the number of partitions doesnt matter as long as the jffs2 lines up with the last incantation.

But, ... this doesnt work anymore.




Define "doesn't work anymore".  The problem I'm seeing in linux-2.6.36.1 is that the kernel panics when attempting to create the devices on the fly (I think I have seen the panic around the function call add_device IIRC).  If this is a similar issue you are having, give me another week and I'll have it fixed as the MTD guys have ignored/not known the answer to my question from about a month ago.
