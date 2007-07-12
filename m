From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 12 Jul 2007 17:35:25 +0200
Subject: [Buildroot] "toolchain/patch-kernel.sh" => $(APPLY)
In-Reply-To: <20070712135118.GA10707@real.realitydiluted.com>
References: <1184241425.5175.9.camel@elrond.sweden.atmel.com>
	<20070712135118.GA10707@real.realitydiluted.com>
Message-ID: <1184254525.5175.37.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2007-07-12 klockan 08:51 -0500 skrev Steven J. Hill:
> > Today most packages uses the patch-kernel.sh script in toolchain.
> > Should this really be hardwired.
> > Is it OK to create a symbolic variable.
> > 
> > APPLY:=toolchain/patch-kernel.sh
> > 
> Why? Can you explain what is lacking with this script that you are
> suggesting adding another variable to track through the build system?
> 

Mainly:It hardwires the file to be in the toolchain directory.

Also, I think it would be good to be able to select
how you want the stuff to be patched.

1) Using a "series" file defining patch order.
2) If the "series" file does not exist, generate a series file.

What would be the drawback of adding a new variable?


> > Also, I would like to see a "script" directory.
> > "patch-kernel.sh" is then moved here and 
> > "depmod.pl" maybe belongs as well in this instead of in
> > target/device/x86.
> > 
> I suppose a 'toolchain/scripts' directory would be okay. I do
> question the need for 'depmod.pl' at all. Doesn't the target
> 'cross-depmod26' create the depmod that does the same thing?
> 
Was actually thinking of "trunk/buildroot/scripts".
There are a few things in OpenWRT I like, and it is better
to have the same directory structure if I want to minimize
future work.


> -Steve
