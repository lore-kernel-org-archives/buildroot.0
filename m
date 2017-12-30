From: Patrick Doyle <wpdster@gmail.com>
Date: Sat, 30 Dec 2017 11:32:02 -0500
Subject: [Buildroot] Bug report or teaching moment -- downloading kernel
 patches
Message-ID: <CAF_dkJCrv_M-bXkXGtoY0esM6GS_MW6+Pjeb9aJWUCRFstST8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I can't figure this out...am I doing something wrong or have I uncovered a bug?

$ export BR2_DL_DIR=
# (make sure we start with an empty download directory)
$ git clone git://git.buildroot.net/buildroot buildroot.test
# (I am working with master=2a604ddcd8d8bf093cdedaefc074a8c61933a4b6
from a few days ago)
$ cd buildroot.test
$ make atmel_sama5d27_som1_ek_mmc_dev_defconfig
$ make menuconfig
-- navigate to Kernel ---> Custom kernel patches
-- enter https://cdn.kernel.org/pub/linux/kernel/projects/rt/4.9/patches-4.9.61-rt61.tar.gz
-- Exit, Exit, Exit, save changes, etc...
$ make linux-patch

When I do this, a kernel gets downloaded, but no patches get applied.
If I follow that up with

$ cd dl
$ wget https://cdn.kernel.org/pub/linux/kernel/projects/rt/4.9/patches-4.9.61-rt61.tar.gz
$ cd ..
$ make linux-dirclean
$ make linux-patch

The patches I manually downloaded get applied.

Can somebody help me figure out what's going on here?  From everything
I've read (and from Yann's email earlier), I would expect the patch
file to be downloaded by the machinery.

If it makes any difference, I have attached the .config file from my build.
Also, for full disclosure, as I just tried this again, I didn't
actually clone from git://git.buildroot.net, I cloned from my existing
(unmodified) buildroot directory, just to save some time.

--wpd
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 91848 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171230/8e4e8693/attachment.obj>
