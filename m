From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Feb 2013 18:04:02 +0100
Subject: [Buildroot] [PATCH] add pre-build script
In-Reply-To: <CAEBucnCBe83aOfTPOTfjvVjKNAdE0CbYp540-OPZy-ecgEYuMA@mail.gmail.com>
References: <05255DE50A102443A25D42F2CCAC151FA58C25@LUMEXCH.luminatorusa.com>
 <511C1281.5040502@mind.be>
 <CAEBucnA1BebDBHWb4PcQBGiUpyiAcT0=vs3Tu4D+LVw1YdN0_A@mail.gmail.com>
 <20130214085604.52619b06@skate>
 <CAEBucnCBe83aOfTPOTfjvVjKNAdE0CbYp540-OPZy-ecgEYuMA@mail.gmail.com>
Message-ID: <20130214180402.6b2dbb17@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Thu, 14 Feb 2013 10:28:24 -0600, Spenser Gilliland wrote:

> I'm not doing this with the specific implementation posted.  I'm just
> saying it would be a nice feature to have.  Many device trees specify
> processor/arch features and optimized cflags can be constructed from
> this data.
> 
> I currently do this outside of buildroot and just provide
> BR2_TARGET_OPTIMIZATION on the make command line from the buildscripts
> for the hardware.
> 
> It would be nice to have buildroot completely self contained and not
> require the software developers to download the additional hardware
> files.

Indeed, but the pre-build script approach you posted would not allow to
customize the CFLAGS. The CFLAGS are part of Buildroot .config file,
which is loaded at the time you run "make". So when your pre-build
script gets executed by Buildroot, make has already loaded the value of
BR2_TARGET_OPTIMIZATION.

You would have to make a specific script that returns custom CFLAGS,
and add some code in Buildroot that does:

CUSTOM_CFLAGS = $(shell ./your/custom/script)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
