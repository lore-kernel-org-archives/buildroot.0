From: Chris Wilkinson <winstonian36@gmail.com>
Date: Mon, 11 Mar 2013 11:49:29 -0400
Subject: [Buildroot] Q. How to use a custom kernel tree?
In-Reply-To: <20130308170521.3e8926ff@skate>
References: <CAHUKsLJM76BFzZunyc=6Jc=UUo4NKq=07_BHNRpVZwYc5VkkRg@mail.gmail.com>
 <20130308170521.3e8926ff@skate>
Message-ID: <CAHUKsLLd56BrLOeN_7xa1cx3M0M+dbQyX2fxZcc_4nof0k3cFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is this a config error on my part or a BR bug? Stephan suggests it's
currently a BR limitation that custom tarballs can only be got from an http
server not a local directory.


On Fri, Mar 8, 2013 at 11:05 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Chris Wilkinson,
>
> On Fri, 8 Mar 2013 10:47:42 -0500, Chris Wilkinson wrote:
> > I have a customized, patched kernel tree which I'd like BR to use.
> >
> > I tar'd the custom kernel tree, selected custom tarball for the kernel
> > version and put the full URL/path to the archive in
> > BR2_LINUX_KERNEL_CUSTOM_TARBALL.
>
> Can you pastebin your .config file somewhere?
>
> > The custom tree also contains a defconfig for my arch. I set
> > BR2_LINUX_KERNEL_USE_DEFCONFIG=y and gave it's name in
> > BR2_LINUX_KERNEL_DEFCONFIG.
> >
> > Using make, BR error'ed out thus.
> >
> > >>> linux custom Extracting
> > cat /home/chrisw/embedded/buildroot/dl/linux-3.4-ss4000e.tar | tar
> > --strip-components=1 -C
> > /home/chrisw/embedded/buildroot/output/build/linux-custom  -xf -
> > cat: /home/chrisw/embedded/buildroot/dl/linux-3.4-ss4000e.tar: No such
> file
> > or directory
> > tar: This does not look like a tar archive
> > tar: Exiting with failure status due to previous errors
> >
> > It appears that BR expects to find the custom tarball in <BR>/dl, not the
> > path I specified.
>
> Hum, let's see your .config first. Once we check that, we'll be able to
> tell you if it's a configuration problem  or indeed a Buildroot bug.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>



-- 
-Chris-
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130311/1757010f/attachment.html>
