From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Jan 2011 08:45:47 +0100
Subject: [Buildroot] Can Buildroot be configured to use the ELDK
 toolchain as an External Toolchain?
In-Reply-To: <2B25428B-FDE1-4E48-A13D-45B6B7E9706B@gmail.com>
References: <2B25428B-FDE1-4E48-A13D-45B6B7E9706B@gmail.com>
Message-ID: <20110126084547.0a47a506@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Davis,

On Tue, 25 Jan 2011 18:44:58 -0500
Davis Mcpherson <davis.mcpherson@gmail.com> wrote:
 
> I'm working on a project that is using the ELDK toolchain and would
> like to use these tools to build Buildroot, I followed the
> instructions to configure an external toolchain via 'make menuconfig'
> but when I do 'make' i get an error that the the c library has been
> specified, i'm using glibc

Unfortunately, last time I checked, the ELDK toolchains did not support
the --sysroot option, which is mandatory to use a given toolchain as an
external toolchain in Buildroot. We have tried to support non
sysroot-capable toolchains, but it was the source of various issues,
and since sysroot is now quite ancient and available in most
toolchains, it sounded like a reasonable tradeoff.

> but I think the problem is rooted in the SYSROOT value being used to
> verify glibc...
> 
> has anyone configured Buildroot to use ELDK as the external toolchain
> to use for builds? 

I wanted to, but I never understood how to get just the ELDK toolchain
and not a complete distribution. I'll try to see if I can test this
toolchain, but if you have some simple setup instructions to get just
the toolchain, that would be great.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
