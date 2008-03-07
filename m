From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 7 Mar 2008 13:57:00 +1100
Subject: [Buildroot] Huge update
In-Reply-To: <46a136670803061710ka7f2c40u223e1348b1a04d21@mail.gmail.com>
References: <46a136670803061710ka7f2c40u223e1348b1a04d21@mail.gmail.com>
Message-ID: <20080307025700.GA31483@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 06, 2008 at 08:10:41PM -0500, John Voltz wrote:
>  > --- trunk/buildroot/scripts/build-ext3-img
>  (rev 0)
> > +++ trunk/buildroot/scripts/build-ext3-img    2008-03-06 17:52:37 UTC (rev
> 21176)
> 
> Why isn't this just a normal target? Or an option to the current ext2
> target?
> 
> I would like to do that once I find a good way to do it. It will create a
> bootable ext3 image with grub that can be run directly with qemu or vmware.

Right, I see that it's building a whole hard disk image rather than just
an ext3 file system image.

> The move to /usr/lib was partly because a few embedded systems have the root
> file system stored in a smallish flash device on the main board, sufficient

OK. I'm a bit concerned that we might have some binaries installed in
/bin or /sbin which need those libraries that moved.

Also we don't any targets (image generators) capable of generating
separate root and /usr images afaik. But they can be developed later.


Thanks for all your patches by the way. I don't mean to be a harsh
critic.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
