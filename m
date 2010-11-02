From: Michael Trimarchi <trimarchimichael@yahoo.it>
Date: Tue, 2 Nov 2010 16:34:53 +0000 (GMT)
Subject: [Buildroot] at91sam9260 alsa problem
In-Reply-To: <589867.9727.qm@web29601.mail.ird.yahoo.com>
References: <855007.40683.qm@web29601.mail.ird.yahoo.com>
	<262336.75716.qm@web29607.mail.ird.yahoo.com>
	<811511.24510.qm@web29618.mail.ird.yahoo.com>
	<505882.75806.qm@web29605.mail.ird.yahoo.com>
	<87lj5bby8v.fsf@macbook.be.48ers.dk>
	<589867.9727.qm@web29601.mail.ird.yahoo.com>
Message-ID: <738003.11234.qm@web29602.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net





----- Messaggio originale -----
> Da: Michael Trimarchi <trimarchimichael@yahoo.it>
> A: Peter Korsgaard <jacmet@uclibc.org>
> Cc: buildroot at busybox.net
> Inviato: Mar 2 novembre 2010, 15:43:40
> Oggetto: Re: [Buildroot] at91sam9260 alsa problem
> 
> Hi
> 
> 
> ----- Messaggio originale -----
> > Da: Peter Korsgaard <jacmet@uclibc.org>
> > A: Michael  Trimarchi <trimarchimichael@yahoo.it>
> >  Cc: buildroot at busybox.net
> > Inviato:  Mar 2 novembre 2010, 15:23:28
> > Oggetto: Re: at91sam9260 alsa  problem
> > 
> > >>>>> "Michael" == Michael Trimarchi  <trimarchimichael@yahoo.it>   writes:
> > 
> >  Michael> Hi all
> > 
> >   Michael> I have fixed and tested  the gstreamer and alsa on my  platform
> >  Michael> and now all works  perfectly
> > 
> > Great, what was the problem and care to send a patch so I can   integrate
> > it?
> 
> The problem in my case was that linux compile the  alsa using
> armv5te and arm9tdmi option and alsa lib was compiled with  different flags. So 
>I 
>
> have added the option for generate the arm9tdmi and  armv5te combination, 
> changing the configuration option of the buildroot and  add them. I don't know 
>if 
>
> the git includes them. BTW another problem but  it's just a note for the 
> developers that use gstreamer and to pay attention  to compile buildroot with 
>the 
>
> same sanitized header of the kernel of the  final kernel version on your 
>device. 
>
> For istance I was using the 2.6.29 and  the ppoll for arm not was included and 

> the gstreamer was having problem  because the code use them when the buffer 
> does't have data on it. Hope that  was clear. I will send a patch if it is 
> necessary. I don't understand why  all atmel architecture that are compiled 
>with 
>
> this tuning don't are compiled  with the armv5te and arm9tdmi combination.
> 
> Best  regards
> Michael
> 
> > 
> > -- 
> > Bye, Peter Korsgaard
> > 
> 
> 
>       
> _______________________________________________
> buildroot mailing  list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


      
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Created-new-target-descriptor-arm9tdmi.patch
Type: application/octet-stream
Size: 1571 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101102/5085338c/attachment.obj>
