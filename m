From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 30 Sep 2009 12:20:30 +0200
Subject: [Buildroot] multiple architectures
In-Reply-To: <20090930103137.304aa012@surf>
References: <20090930062658.GG25852@moomers.org> <20090930090102.0189852d@surf>
	<5f2b60909300113o53ef97b7j6910562af6ebb8be@mail.gmail.com>
	<20090930103137.304aa012@surf>
Message-ID: <5f2b60909300320s49960173x193b324f432f7aef@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2009/9/30 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Le Wed, 30 Sep 2009 10:13:22 +0200,
> Bj?rn Forsman <bjorn.forsman@gmail.com> a ?crit :
>
>> How about that the default BR output directory contains an arch
>> postfix? This would eliminate the need for manually setting O=
>> according to the current .config. Instead it would happen
>> automatically.
>
> This was the case previously. But I don't think it's a good idea, since
> it only solves partially the problem: what if you have several
> projects, but all these projects use the same architecture ?
>
> This is even more common than multiple architectures projects: you work
> on ARM (for example), but you build different filesystems for different
> usages of the device. In that case, a default output-arm/ directory
> would not solve the problem.

Oops, I forgot about multi-arch + multi-projects :-)

A solution to the multi-arch + multi-project problem is what OE (OpenEmbedded)
uses; a hierarchy of arch/libc/target/image combinations. This enables
multi-arch + multi-projects in the same tree. But BR does not have the
equivalent of an OE image (a named set of predefined packages to put into
the rootfs). In BR you have to manually define your "image" in the
.config file. But this image, IMO, is not as "clean" as the OE image,
because a .config file defines much more than what packages are supposed
to be in your rootfs. And that makes me realize that the OE output directory
model is probably unsuitable for BR.

> A possibility would be to add a configuration option to set the output
> directory path, instead of passing O=. I don't have a strong opinion on
> this, but I'd prefer not to have both solutions. The fact that
> Buildroot has multiple solutions to do approximately the same thing is
> a large part of the confusion for our new users, and I would like to
> reduce this confusion.

I realize now that it takes more than a simple output-ARCH directory,
so I'd like to keep the current functionality with O=.
(Because BR should not be as complex as OE!)

Regards,
Bj?rn Forsman
