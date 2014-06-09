From: Anders Darander <anders.darander@gmail.com>
Date: Mon, 9 Jun 2014 08:07:19 +0200
Subject: [Buildroot] new TI kernel version for beaglebone black
In-Reply-To: <538AE6B7.8030202@gmx.net>
References: <5388F5A2.1080008@ethertek.ca>
	<538AE6B7.8030202@gmx.net>
Message-ID: <CAE4k23_Gjq+OmuibdpstJJYiF0fuFg-0MVYa2eOQxykiE-5RGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1 June 2014 10:39, Peter K?mmel <syntheticpp@gmx.net> wrote:
> On 30.05.2014 23:18, Dan Pattison wrote:
>> In buildroot I used make beaglebone_defconfig.
>> Under the Kernel menu, Custom Git repository is selected.
>> The git URL is https://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
>
>
> BTW, does someone know how this repository relates to
> https://git.kernel.org/cgit/linux/kernel/git/arm/arm-soc.git?

The arm-soc.git repository is the integration repository controlled
the by maintainers
of the arm architecture in the Linux kernel. Thus, this is the last
step before getting your
patches into the mainline kernel. (Linus pulls from arm-soc.git among
other repos).

The TI repo is were TI themselves develops (at least it's the
externally visible point) the
kernels for their own SoC's and BSP's. This means that normally you'll
have better SoC
support (support for more peripherals) in the vendor tree (i.e. the TI
repo). However,
you can'? be sure that when (if) support for these peripherals goes
into the mainline kernel,
that their interface will always be exactly the same as in the TI
repo. The review process
for the mainline kernel might require further changes, that's
currently not reflected in the
TI repo.

> Is the ti-linux-kernel repository _THE_ reference for TI kernels or
> are there better starting points?
>
> When looking for kernel sources also the Arago projects pops up and
> for sure Linaro.

Arago is one of TI's embedded distributions. Currently it's a layer
for OpenEmbedded.

Then there's also the paches that you can find in
https://github.com/beagleboard/kernel. This
is yet another kernel for the SoC's in the Beagle* family of boards.
Instead of keeping a patched
kernel in this repo, they're keeping a set of patches to be applied to
a mainline kernel. This repo,
and their 3.8 branch is likely what you want if you need support for
capemgr etc.

Personally, unless I need some specific perifpheral that I can only
get from a certain tree, I usually
prefer mainline kernels. In this specific case, I've mostly been using
the TI repository (as you can
guess from my occasional updates to the beaglebone_defconfig).

> Does someone have a link or an explanation how all these repositories
> relate?
> That would be great!

Well, not a link but a short summary of what I've learned playing
around with primarily the BeagleBone,
but also a number of other TI SoC's.

Cheers,
Anders

-- 
Anders Darander
EPO guidelines 1978: "If the contribution to the known art resides
solely in a computer program then the subject matter is not
patentable in whatever manner it may be presented in the claims."
