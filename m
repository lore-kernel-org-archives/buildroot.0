From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 11 Dec 2007 11:26:45 +1100
Subject: [Buildroot] Using custom kernel
In-Reply-To: <474AC5BC.30407@carallon.com>
References: <474AC5BC.30407@carallon.com>
Message-ID: <20071211002645.GA5825@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 26, 2007 at 01:10:20PM +0000, Will Wagner wrote:
> I would like to use buildroot with a custom kernel. We have the kernel 
> source we want to use checked into cvs, rather than downloading it from 
> the net.
> 
> Is this currently possible with buildroot? If so where should I look? If 
> I have to try to customise buildroot myself any suggestions on where to 
> get started?

Hi Will,

(Apologies for the delayed reply; I'm only catching up on the list now
after a recent vacation.)

I've done something similar here, though it's messy.
I added a new directory target/linux-xyz, with my whole kernel source
tree checked into target/linux-xyz/2.6.15-uc0.

The kernel source tree supports building into a separate objects
directory, which I have located in project_build_<arch>/<project> as per
standard buildroot practice.

Building out-of-tree modules is even more messy, because now you have
kernel source in one place, kernel objects (including the include/asm
symlink and the include/linux/autoconf.h file) in a second place, and
module binaries going a third place again. But it's workable.

A simpler solution would be to copy the kernel source into
project_build_<arch>/<project> and build it in-tree. However that isn't
very good for development, unless you can rig up some complicated
dependencies between the original source and the copy.

I can share a patch if it would be useful.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
