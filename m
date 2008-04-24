From: John Voltz <john.voltz@gmail.com>
Date: Thu, 24 Apr 2008 10:31:27 -0400
Subject: [Buildroot] Question regarding CUPS package
In-Reply-To: <6090c5eb0804240603r1c89303eg4977bd66af67f4a7@mail.gmail.com>
References: <6090c5eb0804240603r1c89303eg4977bd66af67f4a7@mail.gmail.com>
Message-ID: <46a136670804240731u105be48bvbd77665e64bdfa36@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Check out the line CUPS_MAKE_OPT in package/cups/cups.mk, and make sure it
only lists the sections you want to build

also make sure that BR2_PACKAGE_XSERVER_none is selected when you run
menuconfig, that will remove the X dependency during the build.

John


On Thu, Apr 24, 2008 at 9:03 AM, Jorge S. <jorgesolla@gmail.com> wrote:

> Hello all,
>
> I'm creating a rootfs for a custom AT91RM9200 board.
> I'm planning to use the board as kind of a printer server and i need to
> use CUPS.
>
> The problem comes when building the CUPS package because it depends on X11
> libs.
> Just reading on the cups project documentation and some forums posts i've
> discovered that CUPS only needs X11 libs
> when you are planning to build/use GUI config tools, but if only need
> cups-base and lpr are needed you can remove
> the X11 libs dependence.
>
> Does somebody on the list is using CUPS without X11 libs? Any available
> patch? Any ideas on how to solve this?
>
>
> Thanks in advance.
>
> Regards,
>
> Jorge.
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080424/bd034c93/attachment.htm 
