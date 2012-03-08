From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 8 Mar 2012 08:50:11 -0500
Subject: [Buildroot] BeagleBone patches
Message-ID: <CA+-urNQF5PfTt_i1xhtPtOLSfpB=MOjWsvZ3U-FR6LQTRu6iJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had been sitting on some patches for making br builds for the
BeagleBone. I finally got the time to update and clean them up, and
they should show up to the list soon. I hope that this is better late
than never.

There were some things that I wasn't sure about:

1. I could not avoid adding a couple files under a board/beaglebone
directory. There aren't that many other configurations that do this,
so I wasn't quite sure how everyone would like BeagleBone referenced.
Please let me know if the folder structure should change.

2. You'll see that MLO gets built with U-boot rather than with the
X-Loader package. I'm not familiar with why the two were integrated,
but it seems to be the way that TI is doing it now with the bone so I
added an option.

3. There were a few Linux kernels to choose from. The one that I used
is the currently released version from the beagleboard group (I just
verified a couple days ago). Rather than commit the kernel
configuration that I use with my project, I pulled in the one from the
released kernel. This seemed more "right", but I did have to modify it
to compile in EXT2 so that it could mount the generated rootfs. I also
modified the kernel config to compress the kernel with gzip rather
than lzo to avoid requiring the person compiling the code to install
lzop. The latter is probably completely trivial, but I have found br's
minimalist dependencies really nice in the past and didn't want to add
another. The one thing that I don't like about this kernel
configuration is that enables an enormous number of features. I'm
guessing that this is an Angstrom-ism, and I wanted to pass it by the
list before spending any time modifying it.

Thanks,
Frank
