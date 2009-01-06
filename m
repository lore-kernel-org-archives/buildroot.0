From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 06 Jan 2009 19:31:48 +0100
Subject: [Buildroot] Buildroot Not Using Saved Config for Linux
In-Reply-To: <BAY124-W25B0802FB150D5566BD194D2E10@phx.gbl>
References: <BAY124-W25B0802FB150D5566BD194D2E10@phx.gbl>
Message-ID: <1231266708.32308.211.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-01-05 klockan 15:11 -0800 skrev Quick X:
> I can't get buildroot to use the "local\MYPROJECT
> \linux-2.6.24.3.config" file no matter what.  It always uses the
> "project_build_arm/at91sam9261ek/linux-2.6.24.3/.config" file, or
> creates a new one if it doesn't exsist.
>  
> Steps I do to test:
> make linux26-menuconfig
> make saveconfig
> make linux26-menuconfig (EDIT SOMETHING ELSE)
> make BOARD=MYPROJECT
>  

IIRC, The way saveconfig works is that it copies the current
$(TOPDIR)/.config to the loacl/$(PROJECT) directory
and then edits the paths for certain variables.

It does not modify the ?$(TOPDIR)/.config file,so you
will still be using the same paths.

If you want to use the new board stuff, you have to to

$ make BOARD=MYPROJECT getconfig 

which do:

cp $(LOCAL)/$(PROJECT)/$(PROJECT).config .config

and after that, you should be using the BOARD files.

Note that you can set BUILDROOT_LOCAL to whatever in 
your shell environment so you can store your project
files outside the buildroot source tree.

Best Regards
Ulf Samuelsson.
