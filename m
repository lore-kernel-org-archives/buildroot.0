From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Oct 2012 16:02:54 +0200
Subject: [Buildroot] Question about 64Bit kernel and 32Bit applications
In-Reply-To: <CAMJ=MEd+eR2Z1yUKu541TQzQJOhu-fpa6HDLD0e-0+n-Jt-6WA@mail.gmail.com>
References: <CAMJ=MEd+eR2Z1yUKu541TQzQJOhu-fpa6HDLD0e-0+n-Jt-6WA@mail.gmail.com>
Message-ID: <20121002160254.3b94fe25@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ronny,

On Tue, 2 Oct 2012 15:57:43 +0200, Ronny Meeus wrote:

> I'm using buildroot to build an environment for MIPS (Cavium).
> For this I use a 64 bit toolchain provided by Cavium.

Just curious, is this toolchain publicly available? I would really like
to have the opportunity to test it and integrate it as an external
toolchain in Buildroot.

> Building and deploying the kernel / busybox in this configuration
> works without issues.
> 
> I want to deploy on this configuration "legacy" applications that need
> to run in 32 bit mode.
> So in fact I want to have a mixture of 32 and 64 bit
> (busybox,dropbear,...) applications to be present on the board.
> 
> Is this supported in buildroot? If it is, how can this be configured?

No, generating a userland with a mix of libraries with different ABIs
is not supported.

And my opinion is that we should not try to support this. Unless I'm
missing something, it is a really bizarre use case, and adding support
for it would create an horrible additional complexity in Buildroot.

The change you did for libfuse cannot be integrated: it is MIPS
specific, and we also have no way of specifying on a per-package basis
whether it should be built for 32 bits or 64 bits.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
