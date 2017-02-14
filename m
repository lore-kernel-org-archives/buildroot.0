From: Ron Eggler <ron.eggler@gmail.com>
Date: Tue, 14 Feb 2017 07:04:11 -0800
Subject: [Buildroot] gcc 5.2.0 not supported?
In-Reply-To: <20170214052702.sugb3oh6asnuq5xg@tarshish>
References: <e71f5729-1da1-eb07-67d1-4d99b795fd44@gmail.com>
 <20170214052702.sugb3oh6asnuq5xg@tarshish>
Message-ID: <CAHxBh_SWYAsAROWBJOCv=w+fGC-hNEC7Y7srjVsRGtOHyrVYwQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 13, 2017 at 9:27 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Ron,
>
> On Mon, Feb 13, 2017 at 07:38:36PM -0800, Ron Eggler wrote:
> > I've build a crosstoolchain for powerpc using crosstools-NG today and I
> > wanted to use buildroot to compile a kernel for my system.
> > Now, turns out I'm getting:
> >
> > >>> toolchain-external Configuring Incorrect selection of gcc version:
> > expected 4.3.x, got 5.2.0
>

Alright, I think that's what I was missing.


>
> You need to select your external toolchain version in Toolchain -> External
> toolchain gcc version. 4.3.x is the default, you need to change it to 5.x.


> > on make and when I started Googling around, I found this thread
> > http://lists.busybox.net/pipermail/buildroot/2015-July/133170.html from
> July
> > 2015 that essentially says that gcc 5.2.0 is not supported.
> > Now I'm wondering if this is this still the case?
>
> The linked messages is about the Buildroot internal toolchain. It has
> noting
> to do with you case.
>
> > Also, before I had set the kernel headers to 4.3.x in menu config, I
> would
> > get the same error but saying:
> >
> > >>> toolchain-external Configuring Incorrect selection of kernel headers:
> > expected 2.6.x, got 4.3.x
> >
> > Now as I've moved up the header version to match 4.3.x, I get the error
> > pasted above. How can that be? How can I get my kernel built using the
> > crosstools-NG toolchain?
>
> Here again you need to set 'External toolchain kernel headers series' to
> the
> version of your toolchain kernel headers.
>
> Hope this helps,
>

Yes, Thanks it did help!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170214/c83a6a82/attachment.html>
