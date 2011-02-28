From: Charles Krinke <charles.krinke@gmail.com>
Date: Sun, 27 Feb 2011 16:13:04 -0800
Subject: [Buildroot] Question about buildroot generated toolchain
	binaries
In-Reply-To: <AANLkTin5E0ig9oa0m-=L-xd-eg-QoeA9xOREO2mwBYEP@mail.gmail.com>
References: <AANLkTikLie3Zj9hqYV=BvGEN+efJm0_eVKWbc-66L3wt@mail.gmail.com>
	<AANLkTi=4GCSBMgvC6M8Dh0LrpOdpOOX2J+jk6+3X5tOo@mail.gmail.com>
	<AANLkTin5E0ig9oa0m-=L-xd-eg-QoeA9xOREO2mwBYEP@mail.gmail.com>
Message-ID: <AANLkTik50wEG+D=pUFuAihFdD7XnjPwHUOQ80dY0RP7a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hmmm. Well perhaps a "ls -l" might shed more light as the printout below
shows two entries with the same size which are probably the same file.

I would suspect that one is a softlink to the other.

Charles

On Sun, Feb 27, 2011 at 2:40 PM, Steve Johnson <sjohnson228@gmail.com>wrote:

> Dear Charles,
>
> Actually, there are two copies of gcc:
>
> one in /usr/arm-linux/bin:
>
> -rwxr-xr-x. 1 na na  252289 Feb 21 20:10 gcc
>
> and one in /usr/bin:
>
> -rwxr-xr-x.  2 na na  252289 Feb 21 20:10
> arm-unknown-linux-uclibcgnueabi-gcc
>
> Thanks
>
> On Fri, Feb 25, 2011 at 7:43 AM, Charles Krinke
> <charles.krinke@gmail.com> wrote:
> > Dear Steve:
> >
> > I suspect you will find that only one set exists and the others are all
> > soft-links to the *real* set.
> >
> > This has to do with name expectations of various software using those
> > binaries, but I believe there is only one set.
> >
> > Charles
> >
> > On Thu, Feb 24, 2011 at 5:54 PM, Steve Johnson <sjohnson228@gmail.com>
> > wrote:
> >>
> >> Hi,
> >>
> >> In my toolchain output directory I seem to have
> >> multiple copies of the same binaries..
> >> In directory /usr/bin I have the gcc compiler (and other binaries) and
> in
> >> directory /usr/arm-linux/bin I also have gcc? Why is that?
> >>
> >>
> >> Thanks,
> >>
> >> Steve
> >>
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot
> >
> >
> >
> > --
> > Charles Krinke
> >
> >
> >
>



-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110227/76a4b8d5/attachment.html>
