From: S W <sw18@hotmail.co.jp>
Date: Tue, 14 Sep 2010 05:16:37 +0900
Subject: [Buildroot] Build error: No rule to make target
 `ubootboard_config'
In-Reply-To: <20100913203030.527a8293@surf>
References: <KAW101-W9A50593711791769ABB3C9B740@phx.gbl>,
	<20100911105201.176d1396@surf>,
	<KAW101-W3400321E421A55939E3C979B750@phx.gbl>,
	<KAW101-W663381351DE5AA588F11B19B770@phx.gbl>,
	<20100913203030.527a8293@surf>
Message-ID: <KAW101-W29624180977A0A1CC4A5979B770@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas

Thank you so much for your nice explanation!
Yes I have misunderstood about ARM. 
Like you said, it is a general architecture.

I will figure out the hardware board name from my headquater company.

But I have a doubt about the boads that U-Boot can deal with.
You told me that there thousands of different boards. But how
can U-Boot know these board names? And how can U-Boot know
there are new boards that come out?

Thanks
Terry

> Date: Mon, 13 Sep 2010 20:30:30 +0200
> From: thomas.petazzoni at free-electrons.com
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] Build error: No rule to make target `ubootboard_config'
> 
> On Tue, 14 Sep 2010 02:51:42 +0900
> S W <sw18@hotmail.co.jp> wrote:
> 
> > I am trying to build a Uboot loader for ARM.
> 
> "ARM" is a very general core architecture. There are dozens of
> companies building processors based on the ARM architecture, producing
> hundreds of different processors, used in thousands of different boards.
> 
> So "building U-Boot for ARM" is not precise enough, and it's definitely
> the thing that you seem to misunderstand.
> 
> > If I leave the "U-boot board name" as blank,
> > there is an error as "NO U-Boot board name set. 
> > Check your BR2_TARGET_UBOOT_BOARDNAME setting."
> 
> Yes, U-Boot needs to be configured by providing the name of the board
> you are targeting. See 
> 
> > But if I input the U-Boot board name as a name like "ubootboard",
> > I encountered another error "No rule to make target
> > `ubootboard_config".
> 
> Obviously it seems you're misunderstanding a bit what this is all about.
> "ubootboard" is not a valid board name. See include/configs/ in U-Boot
> sources for the valid board names in U-Boot.
> 
> Try "at91sam9263ek" as a board name. U-Boot will compile properly...
> but will very likely not work on your hardware, unless it is the
> AT91SAM9263-EK board (which is an evaluation kit of the AT91SAM9263
> CPU, sold by Atmel).
> 
> > How I create the build rule for U-Boot board?
> 
> Two choices :
> 
>  *) U-Boot is already ported to your hardware. In that case, you only
>     need to find what file in include/configs/ in the U-Boot sources
>     correspond to the board that you have.
> 
>  *) U-Boot is not already ported to your hardware. Then it's a lot more
>     work since you'll have to do the porting by yourself.
> 
> I repeat my question: on which hardware do you want to run U-Boot ?
> 
> Regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100914/60b12f8b/attachment.html>
