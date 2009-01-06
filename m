From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 06 Jan 2009 18:32:53 +0100
Subject: [Buildroot] Recent u-boot patches to buildroot...
In-Reply-To: <20090106163758.GA15009@real.realitydiluted.com>
References: <20090106163758.GA15009@real.realitydiluted.com>
Message-ID: <1231263173.32308.201.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-06 klockan 10:37 -0600 skrev sjhill at realitydiluted.com:
> Ulf,
> 
> I am trying to understand where these patches for u-boot are coming
> from. Are they from the u-boot mailing list or are they specific to
> Atmel platforms? If they are specific to Atmel platforms, they should
> not be applied by default to anyone building u-boot. Is that the case?

Some of them are coming from the atmel AT91 specific u-boot.
That is mainly board/atmel/* files
and cpu/arm920t or arm/926ej-s files.
as well as the include files.

For the commands, only the "mux" command is really specific to AT91
boards.
The LED command is obviously of potential use for anyone
supporting the coloured_LED API.
Ethinit is useful for anyone mounting a root fs over NFS.


All commands introduced by the patches are governed by CONFIG
variables so if they are not set, then the command source files
will not be compiled and no extra code will be generated.

Only drawback will be 2-3 seconds max extra buildtime.

If people would like to be able to apply these patches
conditionally, then I do not mind doing that.

It is difficult to add patches on a fine grained level,
because you may be updating the same file in
several patches, and depend on a patch order.


> 
> -Steve
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
