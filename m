From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Dec 2017 18:10:21 +0100
Subject: [Buildroot] Bug report or teaching moment -- downloading kernel
 patches
In-Reply-To: <CAF_dkJCrv_M-bXkXGtoY0esM6GS_MW6+Pjeb9aJWUCRFstST8A@mail.gmail.com>
References: <CAF_dkJCrv_M-bXkXGtoY0esM6GS_MW6+Pjeb9aJWUCRFstST8A@mail.gmail.com>
Message-ID: <20171230171021.GG2921@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patrick, All,

On 2017-12-30 11:32 -0500, Patrick Doyle spake thusly:
> I can't figure this out...am I doing something wrong or have I uncovered a bug?

Bug.

It's a known bug, where extra downloads are not downloaded when the main
download is something that is not a tarball.

And for atmel_sama5d27_som1_ek_mmc_dev_defconfig, the kernel is from a
git tree, so is not downloaded with wget, so the extra dowenloads are
not downloaded.

Regards,
Yann E. MORIN.

> $ export BR2_DL_DIR=
> # (make sure we start with an empty download directory)
> $ git clone git://git.buildroot.net/buildroot buildroot.test
> # (I am working with master=2a604ddcd8d8bf093cdedaefc074a8c61933a4b6
> from a few days ago)
> $ cd buildroot.test
> $ make atmel_sama5d27_som1_ek_mmc_dev_defconfig
> $ make menuconfig
> -- navigate to Kernel ---> Custom kernel patches
> -- enter https://cdn.kernel.org/pub/linux/kernel/projects/rt/4.9/patches-4.9.61-rt61.tar.gz
> -- Exit, Exit, Exit, save changes, etc...
> $ make linux-patch
> 
> When I do this, a kernel gets downloaded, but no patches get applied.
> If I follow that up with
> 
> $ cd dl
> $ wget https://cdn.kernel.org/pub/linux/kernel/projects/rt/4.9/patches-4.9.61-rt61.tar.gz
> $ cd ..
> $ make linux-dirclean
> $ make linux-patch
> 
> The patches I manually downloaded get applied.
> 
> Can somebody help me figure out what's going on here?  From everything
> I've read (and from Yann's email earlier), I would expect the patch
> file to be downloaded by the machinery.
> 
> If it makes any difference, I have attached the .config file from my build.
> Also, for full disclosure, as I just tried this again, I didn't
> actually clone from git://git.buildroot.net, I cloned from my existing
> (unmodified) buildroot directory, just to save some time.
> 
> --wpd


> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
