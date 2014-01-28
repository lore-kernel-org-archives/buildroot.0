From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 23:10:44 +0100
Subject: [Buildroot] [PATCH] uboot-tools: Allow users to use uboot's
 sources
In-Reply-To: <CAAXf6LWTv2M+AsoXNkzckUzdZdLnPJL_d5TxvLiPK03VTm=dhA@mail.gmail.com>
References: <1390696553-4163-1-git-send-email-maxime.hadjinlian@gmail.com>
 <52E530D5.20405@lucaceresoli.net>
 <CAGduivwtd5SeEOSi6NNCegk7L7oem0+dF9eqkvoGtYk1_xODVw@mail.gmail.com>
 <52E5816F.9080102@lucaceresoli.net> <52E69898.2080805@mind.be>
 <CAAXf6LWTv2M+AsoXNkzckUzdZdLnPJL_d5TxvLiPK03VTm=dhA@mail.gmail.com>
Message-ID: <20140128231044.71270cec@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 28 Jan 2014 07:02:56 +0100, Thomas De Schampheleire wrote:

> >  Actually, I don't even see the need to ask the user anything. If we are
> building U-Boot, I don't see why we would ever want to use the U-Boot tools
> from upstream - that just adds a risk of incompatibility between the two.
> >
> >  So I would propose to remove the BR2_PACKAGE_UBOOT_TOOLS_UBOOT_SOURCE
> option, and instead make it conditional on BR2_TARGET_UBOOT.
> 
> I don't agree here. Real life example: we are using vendor-provided uboot,
> and want to set an env-image in our flash devices' factory image. While
> this version of uboot clearly supports handling the env at a specified
> location, it does not (yet) provide the mkenvimage tool.
> In this case, we actually want a more recent uboot tools package that does
> have mkenvimage. My conclusion is thus that we should provide the choice.

Then maybe you should just patch your vendor U-Boot to add mkenvimage,
and that's it? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
