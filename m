From: Patrick Noffke <patrick@noffke.me>
Date: Tue, 07 Apr 2015 13:25:52 -0500
Subject: [Buildroot] Fwd: Re: [git commit] boot/at91bootstrap3: migrate
	to pkg-kconfig
In-Reply-To: <2040502.JIOmFcmm7a@noffke.mortara.com>
References: <2040502.JIOmFcmm7a@noffke.mortara.com>
Message-ID: <2982764.cgQMvR0ARn@noffke.mortara.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, April 07, 2015 12:50:47 PM Patrick Noffke wrote:
> Sorry, didn't send to the list.
> 
> My problem may be because I patched at91bootstrap3, and I probably missed 
> something there.  I was changing some of its configuration to enable SDRAM 
and 
> NOR flash for this board.
> 
> > 
> >     cp $(YOUR_CONFIG_FILE)  $(AT91BOOTSTRAP3_DIR)/.config
> >     make oldconfig
> > 
> This is my problem.  I didn't know about oldconfig -- I thought defconfig was 
> getting run.
> 
> make oldconfig is replacing some of my settings for the at91bootstrap3 
package.  
> 
> In particular, in my custom config, I have 
> 
> #CONFIG_MACH_TYPE="1830"
> CONFIG_MACH_TYPE="0xFFFFFFFF"
> CONFIG_SDRAM=y
> 
> and these are getting replaced with
> 
> CONFIG_MACH_TYPE="1830"
> # CONFIG_SDRAM is not set
> 
> Should oldconfig be doing this?
> 

If I add:

	select CONFIG_SDRAM

to output/build/at91bootstrap3-v3.7.1/board/at91sam9m10g45ek/Config.in.board, 
then the CONFIG_SDRAM=y line is not replaced when oldconfig is run.

I don't understand oldconfig, but from a bit of Googling it sounds like it 
should only write config options that don't already exist in the current .config 
file.  Is that correct?  If so, is it a bug in the at91bootstrap3 kconfig code?

Thanks,
Patrick
