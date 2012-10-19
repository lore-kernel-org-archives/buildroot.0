From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 19 Oct 2012 11:41:13 +0200
Subject: [Buildroot] [PATCH] mxs-bootloader: Barebox entry point symbol
 changed in 2012.08
In-Reply-To: <877gqmx2dc.fsf@macbook.be.48ers.dk>
References: <1350547326-31407-1-git-send-email-maxime.ripard@free-electrons.com>
 <50805E2A.1010308@mind.be> <877gqmx2dc.fsf@macbook.be.48ers.dk>
Message-ID: <50812039.8000405@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 19/10/2012 11:00, Peter Korsgaard a ?crit :
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  >> load barebox;
>  >> -        load ivt (entry = barebox:exception_vectors)>  0x8000;
>  >> +        load ivt (entry = barebox:start)>  0x8000;
>  >> hab call 0x8000;
>  >> 
>  >> }
> 
>  Arnout>  Shouldn't this somehow depend on the selected barebox version then?
> 
> Indeed. What happens if people use <2012.08?

It will fail to execute barebox, and will loop trying to execute it.
But once again, if things go as usual, this is only a matter of two weeks...

I can resubmit in two weeks if you prefer.

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
