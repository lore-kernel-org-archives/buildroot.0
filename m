From: ing. Federico Fuga <fuga@studiofuga.com>
Date: Fri, 16 Nov 2007 17:50:44 +0100
Subject: [Buildroot] Alsa problem with arm 2.6.23.1 and uclibc
In-Reply-To: <473D82AE.5040907@promwad.com>
References: <473D70A4.3000901@studiofuga.com> <473D82AE.5040907@promwad.com>
Message-ID: <473DCA64.3060505@studiofuga.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ivan,


which kernel version and kernel headers are you using? Mine are 2.6.23.1
and 2.6.23, but now I am trying to move the kernel headers to 2.6.21
(Angstrom  linux works without problems, but are based on different
kernel headers).
uclibc I am using are 0.9.29, alsa 1.0.14.
The failing ioctl is identical both in the working (Angstrom) and not
working versions, and since the kernel is the same (really the same!) I
am thinking that is only a problem between the "glue" of uclibc and
kernel...
I'll keep you informed.

Regards,

ing. Federico Fuga

(sorry for the duplicate mail!)


Ivan Kuten ha scritto:

> > Hi Federico!
> >
> > I'm observing the same problem with ALSA as you.
> >
> >   
>   
>> >> ioctl(4, USBDEVFS_CONTROL, 0xbef809cc)  = 0
>> >> ioctl(4, UI_DEV_CREATE, 0xbef80ab0)     = 0
>> >> ioctl(4, USBDEVFS_CONNECTINFO, 0xbef80634) = 0
>> >> ioctl(4, USBDEVFS_HUB_PORTINFO, 0xbef80748) = -1 ENOTTY (Inappropriate
>> >> ioctl for device)
>> >>     
>>     
> >
> > Think these lines are key to understanding what the problem is.
> >
> > Regards,
> > Ivan
> >
> >
> >   
>   
