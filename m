From: Patrick Noffke <patrick@noffke.me>
Date: Tue, 07 Apr 2015 12:50:47 -0500
Subject: [Buildroot] Fwd: Re: [git commit] boot/at91bootstrap3: migrate to
	pkg-kconfig
Message-ID: <2040502.JIOmFcmm7a@noffke.mortara.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, didn't send to the list.

My problem may be because I patched at91bootstrap3, and I probably missed 
something there.  I was changing some of its configuration to enable SDRAM and 
NOR flash for this board.

Patrick

----------  Forwarded Message  ----------

Subject: Re: [Buildroot] [git commit] boot/at91bootstrap3: migrate to pkg-
kconfig
Date: Tuesday, April 07, 2015, 12:40:48 PM
From: Patrick Noffke <patrick@noffke.me>
To: Yann E. MORIN <yann.morin.1998@free.fr>

On Tuesday, April 07, 2015 07:21:00 PM you wrote:
> Patrick, All,
> 
> see what it's doing in: package/pkg-kconfig.mk , and it's basically:
> 
>     cp $(YOUR_CONFIG_FILE)  $(AT91BOOTSTRAP3_DIR)/.config
>     make oldconfig
> 
This is my problem.  I didn't know about oldconfig -- I thought defconfig was 
getting run.

make oldconfig is replacing some of my settings for the at91bootstrap3 package.  

In particular, in my custom config, I have 

#CONFIG_MACH_TYPE="1830"
CONFIG_MACH_TYPE="0xFFFFFFFF"
CONFIG_SDRAM=y

and these are getting replaced with

CONFIG_MACH_TYPE="1830"
# CONFIG_SDRAM is not set

Should oldconfig be doing this?

> Well, it's pretty easy to see if this patch is the culprit:
> 
>     git checkout 2016cb30f103024a8dfb50bcfe9a68bfac2f1118^
> 
> then test your config and see if it works. If it does, then the patch
> may be the culprit (i.e. uncover a bug somewhere, maybe in Buildroot,
> maybe in at91bootstrap3 itself); if the config does not work, then the
> bug pre-existed that patch.

When I checkout this revision, the package builds fine.

Thanks,
Patrick
-----------------------------------------
