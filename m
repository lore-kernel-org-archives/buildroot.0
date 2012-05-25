From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 24 May 2012 21:14:43 -0700
Subject: [Buildroot] appreciate S49ntp advice
In-Reply-To: <CAFbHwiQGSZfMvxykSao=gh55TtADvbwgbdMMiw413QDx_5YaSw@mail.gmail.com>
References: <CALo-6+ghsnURLrm8ALtkd-snN9WJT+G9=tRHiwzMQ2t8X2owUA@mail.gmail.com>
 <CAFbHwiQGSZfMvxykSao=gh55TtADvbwgbdMMiw413QDx_5YaSw@mail.gmail.com>
Message-ID: <CALo-6+hunvSQ-wy700s7UodX_Rbn754ug19kXkPrSkm70L8SrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you kindly, Will. Using the post install script worked just fine.

Charles
On May 24, 2012 7:18 AM, "Will Newton" <will.newton@gmail.com> wrote:

> On Thu, May 24, 2012 at 3:11 PM, Charles Krinke
> <charles.krinke@gmail.com> wrote:
> > I have an MPC8321 target and am having a little trouble with one file.
> > We have a modified version of /etc/init.d/S49ntp in SVN and it is in
> > fs/skeleton/etc/init.d no problem.
> >
> > But, ... when we do a make clean && make, it seems that the building
> > of the ntp package itself copies the original S49ntp into
> > output/target/etc/init.d/
> >
> > The question becomes how to deal with this issue properly.
>
> If you add a post build script (BR2_ROOTFS_POST_BUILD_SCRIPT) then you
> can copy over a replacement file or modify the existing one with e.g.
> sed.
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120524/0ebaf426/attachment.html>
