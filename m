From: Nick Peirson <nick@netcentral.co.uk>
Date: Thu, 18 Sep 2008 08:59:01 +0100
Subject: [Buildroot]  Lighttpd and PCRE
In-Reply-To: <87ljxqsbep.fsf@macbook.be.48ers.dk>
References: <48D0CDD3.4070604@netcentral.co.uk>
	<87ljxqsbep.fsf@macbook.be.48ers.dk>
Message-ID: <48D20A45.6030308@netcentral.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>  Nick> Initially PCRE was failing to compile complaining of an unknown
>  Nick> option -N, which I tracked down to the the line in the PCRE
>  Nick> Makefile:
>
>  Nick> STRIP = true -Not_stripping
>
> Hmm, do you have BR2_STRIP_none set?
>   
Yes, however this is the only package I'm compiling that's complaining 
about it?
> Yeah, that's caused by pcre-config returning /usr/lib instead of
> $(STAGING_DIR)/usr/lib - I've fixed that now.
>
> With those fixes pcre/lighttpd builds for me (arm9) - Does it still
> not work for you?
I'm recompiling now. Thanks for looking at this so quickly, I'll let you 
know if that fixes it.

Thanks
Nick
