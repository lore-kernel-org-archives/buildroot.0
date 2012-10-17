From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 17 Oct 2012 20:42:18 +0200
Subject: [Buildroot] [PATCH 00/13] Add support for a project directory
In-Reply-To: <20121017192610.2ad5a7e4@skate>
References: <20121013231344.17317.92930.stgit@localhost>
 <20121014103518.4fb1089d@skate> <507DBD9F.4030307@mind.be>
 <20121017192610.2ad5a7e4@skate>
Message-ID: <8AC081BA091A47DE8B2B59188A410388@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

I have patched my 2012.02 and 2012.05 so i could enter a project name in the buildroot menuconfig.
If I was happy with everyting and did my version of saveconfig then it created a default config:

buildrootdir/configs/<projectname>_defconfig

And i also saved the kernel .config,busybox .config,and uclibc .config under board/<projectname>
This was for me convenient enough.

I think it does not make much sense to make it complicated. In practice i found out when I develop a new board I try to use the
latest version, I don't port older boards to the latest buildroot unless I need stuff that is only supported in the latest
kernels/libs etc.
So all my archived (patched) buildroot versions contain just one hw board and several rootfs variations.(different target
applications) 

( one of patches creates a symlink in the buildroot directory, so I can just refer to  buildroot/kerneldir in make module makefile,
I don't need to edit my makefiles after having selected another kernel version )

Regards Johan

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Thomas Petazzoni
Verzonden: woensdag 17 oktober 2012 19:26
Aan: Arnout Vandecappelle
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] [PATCH 00/13] Add support for a project directory


On Tue, 16 Oct 2012 22:03:43 +0200, Arnout Vandecappelle wrote:

>   Sorry that I'm not letting this go, but: how is this similar to the 
> project concept that was removed in 2009?  I'm not trying to share any 
> of the build output between different projects -- the only thing that 
> is shared is the buildroot directory.

I agree that you're not trying to share the build output between different projects, as was the "project feature" that existed
before
2009 did. That said, I still don't get the benefit of this PROJECT_DIR thing when you can simply set you Linux configuration file,
Linux patches, U-Boot patches and so on to point to the correct location with the existing Buildroot.

I don't see which problems it is solving, and to me, it only creates yet another option to configure Buildroot that will only
confuse users.

But again, as I said in my earlier e-mails: this is just _my_ voice, and I am not the only Buildroot developer or contributor, and I
am not the maintainer. So my voice is just my voice, nothing more.

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
