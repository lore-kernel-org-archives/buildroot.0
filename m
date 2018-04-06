From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 21:02:15 +0200
Subject: [Buildroot] Using a bootlin toolchain with buildroot
In-Reply-To: <CAF_dkJBJAouapTOfS-MEo-cLNHb1birJ74dvChGPgfVG=i6guw@mail.gmail.com>
References: <CAF_dkJBJAouapTOfS-MEo-cLNHb1birJ74dvChGPgfVG=i6guw@mail.gmail.com>
Message-ID: <20180406210215.6c276c4f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Patrick,

On Fri, 6 Apr 2018 10:44:24 -0400, Patrick Doyle wrote:
> Are there any tips or tricks to using a bootlin toolchain with
> buildroot(.2018.02)?
> 
> I have downloaded armv7-eabihf--musl--stable-2018.02-2.tar.bz2
> unpacket it into /opt.
> I have selected BR2_TOOLCHAIN_EXTERNAL
> I have selected BR2_TOOLCHAIN_EXTERNAL_CUSTOM
> I have selected BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED
> I have specified /opt/armv7-eabihf--musl--stable-2018.02-2/bin for
> BR2_TOOLCHAIN_EXTERNAL_PATH
> 
> I could keep listing all of these settings, but I'm not sure how
> useful that would be.
> 
> Basically, I'm asking: If I want to use a bootline toolchain, do I
> just go through and choose the options that best seem to match the
> toolchain options, or is there more documentation about doing this
> someplace?

There are two things that will help you :)

First thing, that is currently hidden is that the
toolchains.bootlin.com website has a defconfig fragment for each
toolchain, that is ready to use with Buildroot.

For example, for the toolchain you tried to use, you can simply use the
defconfig at
https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/fragments/armv7-eabihf--musl--stable-2018.02-2.frag.

In general, for any toolchain, you can go to:

https://toolchains.bootlin.com/downloads/releases/toolchains/<ARCH-TUPLE>/fragments/

and find defconfig files for Buildroot.

The second thing that should help is that I'm working on adding the
Bootlin toolchains as "pre-defined" external toolchains in Buildroot,
very much like the Linaro/Sourcery toolchains we already have. I've
started a patch doing that, but it needs more work, especially because
we have so many Bootlin toolchains for various architectures/C
libraries.

Hope this helps,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
