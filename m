From: Paul Jones <paul@pauljones.id.au>
Date: Thu, 24 Jun 2010 08:09:48 +1000
Subject: [Buildroot] Storing board configuration ?
In-Reply-To: <87eifx5uo0.fsf@macbook.be.48ers.dk>
References: <20100620143535.38416ef6@surf> <87eifx5uo0.fsf@macbook.be.48ers.dk>
Message-ID: <000c01cb1320$ccaf68c0$660e3a40$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Peter Korsgaard
> Sent: Thursday, 24 June 2010 7:03 AM
> To: Thomas Petazzoni
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] Storing board configuration ?
> 
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-
> electrons.com> writes:
> 
> Hi,
> 
>  Thomas> But if we do that, we would have to modify the main Makefile so
> that  Thomas> when an user does "make foobar_defconfig",
> configs/foobar_defconfig is  Thomas> used and for all options
non-specified
> in the defconfig, the default  Thomas> options would be choosen. So
> something like :
> 
>  Thomas> %_defconfig: $(TOPDIR)/configs/%_defconfig
>  Thomas>         cp $^ .config
>  Thomas>         @yes "" | $(MAKE) oldconfig
> 
>  Thomas> What do you think about this ?
> 
> I like it. It will ofcourse hide any new questions you might have wanted
to get
> asked about, but that's not so bad.


We could add another command like make foobar_defconfig_ask to cover both
cases.


Paul.
