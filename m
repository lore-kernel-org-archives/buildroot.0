From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 19 Oct 2007 09:38:04 +0200
Subject: [Buildroot] how can make buildroot work
References: <ed4892840710181815i6e42a7fbg97f4083f28a90590@mail.gmail.com>
Message-ID: <002f01c81223$039941f0$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Steven Woody" <narkewoody@gmail.com>
To: <buildroot@uclibc.org>
Sent: Friday, October 19, 2007 3:15 AM
Subject: [Buildroot] how can make buildroot work


> hi forks,
> 
> i have not yet make buildroot work on my linux. i found following two
> problems and need help from you experts.
> 
> 1,  even after completed the `make source',  in the middle of `make'
> process, buildroot still need to download many other packages.  it's
> wired.  for example,  in the `make source' stage, it did not download
> the linux-2.6.xx.tar.bz2  but do it when i run `make'.   i can not
> understand.

So there is a bug somewhere, find it,   fix it,   send in the patch.
Hopefully someone will apply it

This is a collaborative effort and you can't expect anyone to do
any work for you.

> 
> 2,  in the `make',  i failed because i don't have a `.config'  file
> for the kernel.  but havn't buildroot provided any help to make a
> baisc .config file for my 920 ARM target?  i don't believe it and
> asked this list.  but i have not get a answer.
> 
Yes you have, you just did not read the answers.

Buildroot supplies, in a very few cases, a linux ".config" file.

The normal case is that the user generates his/her own linux ".config" file
by entering the linux directory and type

make ARCH=<arch> xconfig

I.E::
make ARCH=arm xconfig
for the "arm" architecture.

Then set the options you need to set for your specific linux kernel.

Buildroot is not the place where to learn how to configure linux.
If you do not know how to configure linux, then you need to
find someone else who knows this.

I have suggested the vendor of your chip as a source of ".config".

If they do not supply you with ready made .config examples,
then I suggest you switch to another chip.

Once you have a ".config", you need to configure buildroot to 
use it, and this is done in the kernel part of make menuconfig.

> 
> does this mean buildroot hard to use and understand?
> 


Buildroot is real easy to use, once you know what to expect from it.
You are expecting that a ".config" exist for any conceivable chip,
and that is not the case.

> 
> thanks in advance.
> 
> 
> -- 
> woody
> 


Best Regards
Ulf Samuelsson 
