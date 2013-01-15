From: Patrick <kpa_info@yahoo.fr>
Date: Tue, 15 Jan 2013 12:12:47 +0100
Subject: [Buildroot] CANBUs Quesetion
In-Reply-To: <002d01cdf30f$46f45890$d4dd09b0$@co.uk>
References: <001b01cdf015$9b34ca40$d19e5ec0$@co.uk>	<20130111171429.79490168@skate>	<004501cdf24a$009f6440$01de2cc0$@co.uk>	<50F40BF3.5080106@relinux.de>	<004b01cdf26d$ea1d2cb0$be578610$@co.uk>
 <20130114195101.12914c2d@skate> <002d01cdf30f$46f45890$d4dd09b0$@co.uk>
Message-ID: <50F539AF.3070004@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/15/2013 11:58 AM, Ted Wood wrote:
>>> How to do what? Sorry but your question is far from being precise
>>> enough to be understood.
>
> I'm really not sure how to make it any clearer than I did with my previous
> post. My response to Stephan Hoffman's suggestion that I integrate the
> driver into my kernel source and make a kernel patch out of it was to ask
> where I might find information on this. There is nothing in the Buildroot
> manual about it.
>
> I'm not asking to be told how to do it, I'm asking for a pointer to where to
> find the information. As someone new to Embedded Linux I've been struggling
> to filter the huge volume of irrelevant and outdated material that Google
> throws up.
>
> But thank you for the guide to asking questions. I shall bear it in mind in
> future.
>

A kernel module could be easily compiled out of the kernel. You should 
have a Makefile included with your driver. This Makefile will use the 
kernel Makefile to build, so you have to be sure that KDIR is pointing 
on the root directory of your kernel. If build with buildroot it should 
be something like buildroot/output/build/linux-x.y/

I will probably also need to set INSTALL_MOD_PATH to point on your rootfs.

But as suggested before if the driver is GPL you could add it directly 
in your kernel tree it would be cleaner.

Patrick
