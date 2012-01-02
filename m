From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 1 Jan 2012 20:03:04 -0500
Subject: [Buildroot] [PATCH] Add ttyO devices to the mdev configuration
 and the static device table.
In-Reply-To: <20120101215010.3911add4@skate>
References: <1325438796-3287-1-git-send-email-fhunleth@troodon-software.com>
 <20120101215010.3911add4@skate>
Message-ID: <CA+-urNT0KPeUy9ST0UndxjkGeUNEYSap3KKGifc8WT6EFTwdEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Got it. That makes sense.

What about the other part of the patch for adding ttyO to mdev.conf? That
one is more important to me since I am currently using mdev (and probably
shouldn't have tried to cram the static dev table change in the patch
anyway).

Thanks,
Frank

On Sun, Jan 1, 2012 at 3:50 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello Frank,
>
> Le Sun,  1 Jan 2012 12:26:36 -0500,
> Frank Hunleth <fhunleth@troodon-software.com> a ?crit :
>
> > +/dev/ttyO    c       666     0       0       253     0       0       1
>       4
>
> Unfortunately, this does not work. The omap-serial driver does not
> define its major number, its gets allocated by alloc_chrdev_region()
> dynamically at runtime. Therefore, depending on the drivers that are
> compiled into the kernel and their initialization order, the major
> number of the omap-serial devices might be 253 or 252 or 251, etc.
>
> Basically, with the omap-serial driver, there is no other choice than
> using devtmpfs (optionally with mdev or udev).
>
> Best regards,
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot




-- 
Frank Hunleth
Troodon Software LLC
240.397.8766 | fhunleth at troodon-software.com
http://troodon-software.com/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120101/44abe87f/attachment.html>
