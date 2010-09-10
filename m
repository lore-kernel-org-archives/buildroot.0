From: Aurele Traynard <aurele.traynard@laposte.net>
Date: Fri, 10 Sep 2010 16:17:26 +0200
Subject: [Buildroot] troubles with intltool
In-Reply-To: <20100909105838.5ae25c27@surf>
References: <AANLkTikqwN4vkKaXWrA0SiGTwoYUYrST8vggtUwRVJRN@mail.gmail.com>
	<20100909105838.5ae25c27@surf>
Message-ID: <AANLkTin+PxSeuX_kTy6n=yYkf1keqqMdXormidcRWzcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

i think i found the problem : i cant compile under fedora 7 but i tried with
Debian 5.0.4 and it works fine...
sory to disturb you
thanks a lot for your help

Aurele


2010/9/9 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>
>
> Hello,
>
> On Thu, 9 Sep 2010 10:27:30 +0200
> Aurele Traynard <aurele.traynard@laposte.net> wrote:
>
> > I am trying to build an image with X11, an I am experimenting some
> > problems with intltool
> > the problem is when the script call /usr/bin/perl -e "require
> > XML::Parser" i tried to use the following command : /usr/bin/perl -e
> > "require XML::Parser"  to know what is the problem but it says
> > nothing... could someone help, me next is the report
>
> I've just tested, and xkeyboard-config builds fine here.
> xkeyboard-config has a dependency on host-intltool, which itself has a
> dependency on host-libxml-parser-perl.
>
> And as you can see, we are properly passing:
>  PERLLIB="/media/disk3/buildroot-2010.08/output/host/usr/lib/perl"
> to the xkeyboard-config ./configure script.
>
> Can you check
> in /media/disk3/buildroot-2010.08/output/host/usr/lib/perl if
> libxml-parser-perl is installed ?
>
> Could you restart the build from scratch and keep the full build log:
>  make 2>&1 | tee build.log
> and then put online somewhere the full build log and your Buildroot
> configuration ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100910/6b536c9a/attachment.html>
