From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Nov 2012 23:09:46 +0100
Subject: [Buildroot] [PATCH 1/2] Deprecate the support for the toolchain
 on target
In-Reply-To: <CA+wH294SsYiTG9AP9_q==F2-3MKf_Oe75yCM21rSDSgyNTeGcA@mail.gmail.com>
References: <cover.1352586949.git.thomas.petazzoni@free-electrons.com>
 <4afe9c298939f3701caa09c2cc5c4bc04f6d4408.1352586949.git.thomas.petazzoni@free-electrons.com>
 <CA+wH294SsYiTG9AP9_q==F2-3MKf_Oe75yCM21rSDSgyNTeGcA@mail.gmail.com>
Message-ID: <20121111230946.43e57600@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex,

On Sat, 10 Nov 2012 23:26:19 +0000, Alex Bradbury wrote:

> If someone took lead on reintroducing this functionality would it be
> accepted? There are at least a couple of cases where installing
> development files are useful:
> * When using buildroot to build a rootfs that is used as a sysroot for
> an external build system

To build a sysroot containing a cross-compiler + header files and
libraries you don't need the support for the toolchain on target.

> * When using e.g. luajit packages which can make use of header files
> to generate bindings (not exploited all that much right now due to
> lack of preprocessor support in luajit)

What do you need the toolchain on target for this? Header files are
available in the toolchain sysroot, i.e in
output/host/usr/<arch-tuple>/sysroot/.

So unless I'm wrong, none of those use-cases require a toolchain on the
target. Or maybe you could provide more details about those use cases
to convince us that having a toolchain on the target is important?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
