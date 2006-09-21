From: Qiu Yu <unicell@gmail.com>
Date: Thu, 21 Sep 2006 22:40:26 +0800
Subject: [Buildroot] can't resolve symbol bcopy
In-Reply-To: <20060920162406.GA9098@aon.at>
References: <e068c5c30609200634i6b222c86r298f1fabe57a3049@mail.gmail.com>
	<20060920162406.GA9098@aon.at>
Message-ID: <e068c5c30609210740t1fef65cp16eb6d81ff6e3331@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9/21/06, Bernhard Fischer <rep.nop@aon.at> wrote:
>
> On Wed, Sep 20, 2006 at 09:34:24PM +0800, Qiu Yu wrote:
> >Hi, all
> >
> >Paid some effort, I finally got my first buildroot-made rootfs image for
> >mipsel platform, but this pleasure did't last long.
> >
> >When I mount it on my board, after kernel started, I got an error
> message:
> >"bin/sh" can't resolve symbol bcopy
>
> Either enable legacy support in uClibc (i wouldn't do this), or make
> sure that busybox doesn't contain bcopy which itself is flagged
> DEPRECATED
>
> Same goes for bzero which, too, is deprecated and generates equal size
> to a plain memset with any reasonable version of gcc anyway.
>
> That said, current busybox trunk doesn't contain bcopy, i don't have a
> 1.2 tarball at hand to see if it's erroneously used there.
>
> Only recently one instance of bzero was erroneously added to busybox:
> http://www.busybox.net/lists/busybox/2006-September/024328.html
>
> If uClibc was cleaned up properly NOT to provide fallback defines behind
> your back for e.g. bzero, then you'd have seen a proper compile failure
> (there most likely was an error about a call to "(bcopy)(s,d,sz)"
> somewhere in your make output anyway...).
>
> >
> >I tried to google it, and only got this page "
> >http://mailman.uclinux.org/pipermail/uclinux-dev/2006-April/037797.html".
> I
> >contacted the guy who sent this message, and he did't find out the cause
> of
> >the problem. All he suggests me is to try different version, and maybe
> >change some compiler option.
> >
> >But...any body knows why and how to fix it? Please help me out and
> thanks!
> >
> >My buildroot configuration:
> >
> >Kernel Headers (Linux 2.4.31 kernel headers)       <-- I'm using Linux
> >2.4.17 to boot the board, can this be a problem?
> >Binutils Version (binutils 2.16.1)
> >GCC compiler Version (gcc 3.4.2)
> >uClibc-0.9.28
> >busybox-1.2.1
> >
> >--
> >Qiu, Yu
> >-----------------------------------------------------------
> >http://www.unibeing.net
> >-----------------------------------------------------------
>
> >_______________________________________________
> >buildroot mailing list
> >buildroot at uclibc.org
> >http://busybox.net/mailman/listinfo/buildroot
>


FYI, I tried busybox 1.3, and the problem no longer exists. :)

-- 
Qiu, Yu
-----------------------------------------------------------
http://www.unibeing.net
-----------------------------------------------------------
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20060921/5212c1c8/attachment.htm 
