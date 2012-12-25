From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 24 Dec 2012 19:52:19 -0800
Subject: [Buildroot] [RFC] How to handle targets that need more than one
 file system to boot?
In-Reply-To: <201212240100.17473.yann.morin.1998@free.fr>
References: <201212240100.17473.yann.morin.1998@free.fr>
Message-ID: <CAJJ6jxuKWz3-que3MYwBSrLh_F2-L_XhMvE-+oUog+kL_2mobA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 23, 2012 at 4:00 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Hello All!
>
> Some systems require a specific partition layout to be able to boot.
> For example:
>   - the RaspberryPi:
>     - the first, primary partition, and vfat-formatted, with the bootloader
>       files and the kernel
>     - the rest of the filesystem hierarchy can be dispatched at will
>   - on i.MX:
>     - the first, (primary?) partition must be non-FAT (special type?), with
>       the bootloader raw-binary inside
>     - the rest of the filesystem hierarchy can be whatever
>   - on OMAP paltforms:
>     - similar to the PI, but the kernel can be on ext2/3/4 (as wel as VFAT?)
>
> For now, buildroot can build a single filesystem image. This is not useable
> for these systems. The only possibility as of today is to configure BR to
> generate a tarball, and have a custom script that does the required split up
> of the different components.
>
> It would be nice to have buildroot smoothly handle these cases.
>
> After a quick talk on IRC with Thomas, here are a few proposals.
>
> 0) Keep as-is
>
> Buildroot can not handle all possibilities, we can't even *think* about
> all such possibilities. This is the easiest for buildroot, and pushes the
> complexity down to the users.
>
This is my favorite. There are no known situations that cannot be
handled by buildroot. Quit adding to the makefile. It adds
complexities, and only fixes the one, current users complaint. Keep
mechanism separate from policy. Buildroot should be a simple
consistent way to build a root file system. People who have weird
build/target desires can do that in an external script.

Regards, Steve
