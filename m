From: Anders Darander <anders@chargestorm.se>
Date: Sun, 8 Dec 2013 14:47:20 +0100
Subject: [Buildroot] [PATCH 1/1] ktap: new package
Message-ID: <F9EA2A807ACC1C459AC6ABD87662881C0D9EE58F21@STOEXMBXC04.domain01.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for the feedback (both in email and the other one), I hope to send out a v2 in a couple of days.

On 8 Dec 2013 14:24, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Anders Darander,
>
> On Mon, 11 Nov 2013 13:24:26 +0100, Anders Darander wrote:
>
> > diff --git a/package/ktap/Config.in b/package/ktap/Config.in
> > new file mode 100644
> > index 0000000..97bcd9c
> > --- /dev/null
> > +++ b/package/ktap/Config.in
> > @@ -0,0 +1,21 @@
> > +config BR2_PACKAGE_KTAP
> > +     bool "ktap"
> > +     depends on BR2_LINUX_KERNEL
>
> Are you sure it doesn't need any specific C library functionality?
>
> For example, the Makefile seems to link the program against the pthread
> library, so ktap should probably "depends on BR2_TOOLCHAIN_HAS_THREADS".

I'll have a look at this, though it sounds correct to me. I'll also see of I'll find some more issues.

Cheers,
Anders

> See
> http://buildroot.org/downloads/manual/manual.html#dependencies-target-toolchain-options
> for details about this topic.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131208/486009f9/attachment.html>
