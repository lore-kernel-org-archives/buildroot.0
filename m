From: Daniel James Laird <daniel.j.laird@nxp.com>
Date: Wed, 14 Jan 2009 09:30:00 +0100
Subject: [Buildroot] external toolchain --sysroot
In-Reply-To: <20090113231130.GA24352@cloud.net.au>
References: <20090113043014.GA5238@cloud.net.au>
	<eaeb93bb0901122045p6e653f67of6172a11f28010d8@mail.gmail.com>
	<eaeb93bb0901122046g2ed61992n672221d163c74971@mail.gmail.com>
	<eaeb93bb0901122052o16f639f8nbc8c25d989fdb876@mail.gmail.com>
	<20090113231130.GA24352@cloud.net.au>
Message-ID: <C13DBBE85AD6974B85C118C35890CA5F1A85149FE4@EU1RDCRDC1WX029.exi.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I submitted a change to ext-tool.mk that should now check if your toolchain is built with sysroot support and if it is do the copying and if it is not then don't. 
I have tested by building my buildroot with ELDK4.0 (no sysroot support)  and my own toolchain (With Sysroot) and they both work.

However do you mean we pass --sysroot= in both cases as well?
In which case a similar fix to the one I made to ext-tool.mk should be used to decide whether to add --sysroot=....

What do you think?
Cheers
Dan laird


-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Hamish Moffatt
Sent: 2009 Jan 13 23:12
To: buildroot at busybox.net; buildroot at uclibc.org
Subject: Re: [Buildroot] external toolchain --sysroot

On Mon, Jan 12, 2009 at 10:52:49PM -0600, Eric wrote:
> Also I did build my tool chain with sysroot support ... so you would have to
> do the same to get that to work.

Right. I notice that --sysroot is being used even if gcc is compiled
without it. And it appears that sysroot is buggy in gcc 4.1.2, which is
what I'm using currently.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
