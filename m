From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 7 Oct 2008 11:16:05 +0200
Subject: [Buildroot] [BR-AVR32] [PATCH] Support for new MIMC200 board
In-Reply-To: <48EB26CD.4010003@mimc.co.uk>
References: <48EA05EB.7020807@mimc.co.uk> <20081007074128.12613e2c@hcegtvedt>
	<48EB1EDF.6070209@mimc.co.uk> <20081007104345.59bacec2@hcegtvedt>
	<48EB26CD.4010003@mimc.co.uk>
Message-ID: <20081007111605.129b9d3e@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 07 Oct 2008 10:07:25 +0100
Mark Jackson <mpfj@mimc.co.uk> wrote:

> Hans-Christian Egtvedt wrote:
> 
> <snip>
> 
> > You must split up your patch, it contains far more than just a new
> > board. Each patch should only add/change one feature in Buildroot.
> > 
> > I would also recommend that you get all the kernel and U-Boot stuff
> > upstream first, and then go for the Buildroot stuff.
> 
> Ho, hum.  I was kinda hoping to put that off ... too lazy, too many
> other things to do !!. But I guess I just need to buckle down and get
> it sorted.
> 
> In fact the u-boot stuff *is* already upstream ... the u-boot patch
> is a bit of a hang over.  Oops.
> 

In 1.3.5 perhaps? Version 1.3.4 is default in BR now AFAIK.

I think I just applied a patch to my development three which added your
board...

> the linux stuff was a bit of a sticking point ... Atmel's AVR32
> patches are all based on 2.6.25.10. But I'm guessing that if I submit
> my new RTC support code won't it only be added to the latest kernels ?
> 
> How can I submit my RTC code *and* still use 2.6.25.10 ?
> 

Ah, you will need to submit the RTC code for the latest kernel, and add
a backported version for Buildroot.

It is a bit tricky the transition period before you have your stuff
applied to the different projects.

> I know I could use Haavard's latest linux (2.6.27.??), but then
> that's moving further away from the buildroot "all-in-one"
> principal !?!
> 
> Any ideas ?
> 

It is fine to use 2.6.27 in Buildroot, I'll make a release later today
which takes advantage of that.

We have a new board coming out soon, and the patches are made for
2.6.27-rcN.

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
