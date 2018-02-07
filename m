From: Adam Duskett <aduskett@gmail.com>
Date: Wed,  7 Feb 2018 16:23:52 -0500
Subject: [Buildroot] [RFCv2 0/1] gobject-introspection: new series
Message-ID: <20180207212355.7464-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After a lot more pounding away at the keyboard, I am now ready to release
version 2 of the gobject-introspection series patch.

This new series has the following upgrades:
  - It now works on arm.  (More on that later)
  - Gstreamer1 can now use it.
  - General makefile cleanups.
  - New patches that make cross-compiling a bit nicer (thanks, yocto!)

To start:

I have tested this with a cortex-a9/gcc7.3 and of course glibc.
So far GStreamer can now compile, which means that everything as far
as I can tell is setup correctly to give this thing a genuine shot finally
at being put into mainline Buildroot!

What doesn't work:
For some reason, x86_64/i7 does not work. Qemu segfaults. I have a
suspicion that this is why Yocto does pre-linking, but I am not 100%
sure.

What I could use help with:

- Obviously automated testing. I had a conversation in IRC with Yann, and he
said that perhaps just merging it in now with only a small set of architectures
might be an excellent way to go. 

- Package updates: I will get around to updating python-gobject as it's needed
  for GStreamer-python (the entire reason I started this venture)

- Comments on the patches themselves would also be appreciated!.

Thanks!

Adam

Adam Duskett (3):
  qemu: add BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
  gobject-introspection: new package
  gstreamer1: support gobject-introspection

 package/gstreamer1/gstreamer1/gstreamer1.mk | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.14.3
