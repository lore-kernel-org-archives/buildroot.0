From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 21:53:21 +0200
Subject: [Buildroot] buildroot, python{,3}, and pip
In-Reply-To: <CAF_dkJCw8P3YcUOgsODcrX_YrdYaYfcxriBFs+dxRSRjUrXf+w@mail.gmail.com>
References: <CAF_dkJCw8P3YcUOgsODcrX_YrdYaYfcxriBFs+dxRSRjUrXf+w@mail.gmail.com>
Message-ID: <20180810215321.3b1d840d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Patrick,

On Fri, 10 Aug 2018 13:11:04 -0400, Patrick Doyle wrote:
> Does anybody have experience using pip on a buildroot generated system?
> 
> Poking around, I have found patches to add a python-pip module, (for
> example http://lists.busybox.net/pipermail/buildroot/2013-July/075194.html)
> but I don't see that in my 2018.02 release.
> 
> I have a severely memory constrained system and have already found that
> 
> # python3 -mensure-pip
> 
> ...will add a "pip" command to my rootfs once I have booted up... but
> sometimes that command fails (apparently depending on the amount of
> free RAM I have, as a first pass diagnosis) and "pip install
> <some_package>" works sometimes, and fails other times, again
> apparently package size/free RAM relatedly.
> 
> So, I might have other system issues to deal with, but in the mean
> time, I thought I would ask why pip isn't available as an option to
> begin with.
> 
> Yes... I get the whole philosophy of "buildroot doesn't support
> package managers".  Is that the primary reason it isn't supported?  Or
> am I setting myself up for failure should I go down the rathole of
> adding support myself?

The bigger question is why do you need python-pip in the first place ?
It goes against the Buildroot principle of reproducible builds. Why
don't you create Buildroot packages for the Python modules that you
need ? The utils/scanpypi script makes this relatively easy for most
Python modules.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
