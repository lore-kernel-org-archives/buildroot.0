From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Thu, 17 Jan 2013 15:50:20 +0200
Subject: [Buildroot] RTLD_DEEPBIND and uClibc
In-Reply-To: <20130117093159.2d46ecfd@skate>
References: <50F6A26D.4030607@petroprogram.com>
 <20130117000037.39ccc628@skate> <50F74776.60503@petroprogram.com>
 <20130117093159.2d46ecfd@skate>
Message-ID: <50F8019C.4000003@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

17.1.2013 10:31, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Thu, 17 Jan 2013 02:36:06 +0200, Stefan Fr?berg wrote:
>
>> Well, it's not *that* big.
> It's not that big, but compared it to the size difference between
> uClibc and glibc, and you'll see that switching to glibc is reasonable.
>
> My perception is that uClibc is very relevant for non-MMU systems or
> small systems (having limited quantity of flash/RAM), and on those
> systems, we are not going to run a full-blown X.org stack with a window
> manager and so on.
>
> Whenever you start having X.org on a system and a window manager, most
> likely you have hundreds of megabytes of flash, and therefore, the size
> difference between uClibc and glibc (probably somewhere between 1 and
> 1.5 MB) isn't that much of a problem anymore.

Eh... I think it's more than 1 - 1.5 MB :-)


http://www.etalabs.net/compare_libcs.html

In that comparison it's eglibc (the smaller brother of glibc) vs. other,
more lighter c-libraries.
And even then it's 1.5 MB or more vs uClibc's 336 KB with .a files and 2
MB or more vs. 520 KB.

Even tought in my case, Im targeting to running my system with low-end,
ancient PC desktop's (2000 or earlier),
so it's not really exactly comparable with todays embedded systems, it's
still a huge saving of space when
you start thinking about all the lib's and binaries that go to normal
desktop system.

In a related note, my *full* Live-CD system is now uncompressed to 520
MB (194 MB, if using squashfs xz-compressed image with loopdevice),
and the absolute minimum runtime RAM requirement for starting it
(Xorg,fluxbox, firefox,  etc...) is
now about 120 MB (bigger part of that goes to tmp files and other stuff
that are automatically created in initramfs from which it runs directly).

I don't think I could have done that with glibc or eglibc ...

And I haven't even started using GCC 4.7.2 Linktime optimizations yet.
which I expect to cut about 10 - 20 KB per binary away
and finally UPX compression of selected few binaries and libs.

And if even *that* is not enought then I could consider maybe switching
to musl ... maybe ...

So all in all, Im very happy with buildroot and uClibc and not going to
turn back to glibc and bloat

Regards
Stefan
