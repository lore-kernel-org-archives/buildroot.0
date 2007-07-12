From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Thu, 12 Jul 2007 08:51:19 -0500
Subject: [Buildroot] "toolchain/patch-kernel.sh" => $(APPLY)
In-Reply-To: <1184241425.5175.9.camel@elrond.sweden.atmel.com>
References: <1184241425.5175.9.camel@elrond.sweden.atmel.com>
Message-ID: <20070712135118.GA10707@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Today most packages uses the patch-kernel.sh script in toolchain.
> Should this really be hardwired.
> Is it OK to create a symbolic variable.
> 
> APPLY:=toolchain/patch-kernel.sh
> 
Why? Can you explain what is lacking with this script that you are
suggesting adding another variable to track through the build system?

> Also, I would like to see a "script" directory.
> "patch-kernel.sh" is then moved here and 
> "depmod.pl" maybe belongs as well in this instead of in
> target/device/x86.
> 
I suppose a 'toolchain/scripts' directory would be okay. I do
question the need for 'depmod.pl' at all. Doesn't the target
'cross-depmod26' create the depmod that does the same thing?

-Steve
