From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 23:55:47 +0200
Subject: [Buildroot] [PATCH 1/1] support/script/check-bin-arch: ignore
 /usr/lib/grub
In-Reply-To: <4ff5a5e7-a7bd-c4e2-9dcb-a2953f2f3790@igneoussystems.com>
References: <20170816173935.2361-1-andrewpilloud@igneoussystems.com>
 <20170816232738.69c2c142@windsurf>
 <4ff5a5e7-a7bd-c4e2-9dcb-a2953f2f3790@igneoussystems.com>
Message-ID: <20170816235547.01799dae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Aug 2017 14:42:04 -0700, Andrew Pilloud wrote:

> The grub2 package that ships with buildroot does not install the grub2 
> tools or modules in the target. I have a version of the grub2 package 
> that does install the tools and modules in the target in my EXTERNAL 
> tree.

OK. Why would the grub2 tools be built for a different architecture
than the target architecture ?

I do understand that grub2 modules can be built 32-bit, while the
target is 64-bit. But the grub2 tools ?

> (I could submit a patch to make that an option on the grub2 
> package that ships with buildroot.) As best as I can tell, there is no 
> way for a package to request specific files or folders be exempt from 
> this check. There also doesn't appear to be a way to disable the test.

For your information, Erico Nunes has submitted a patch series on
grub2, which includes adding a grub2-tools package, that allows
installing the grub2 tools to the target. See:

Subject: [Buildroot] [PATCH v2 2/8] grub2-tools: new package
Date: Wed, 26 Apr 2017 23:39:47 +0200

in the mailing list archives. It hasn't been merged yet, as some
comments were made, but it's definitely something we want to merge
ultimately.

Regarding the ability for a package to specify some folders to be
excluded from the architecture check, we indeed did not implement such
a thing because there was no real need so far. What you're bringing is
really the first package-specific exclusion, so I think we would still
prefer to handle it in check-bin-arch for now rather than adding a more
involved mechanism.

However, I'm not a big fan of adding such a exclusion in check-bin-arch
if there is no package in Buildroot that installs stuff
in /usr/lib/grub that makes the exclusion needed.

Could you work with Erico Nunes, and get your grub2 patches upstream?
Adding the exclusion to check-bin-arch would then of course be part of
such a patch series, and would be accepted with no problem.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
