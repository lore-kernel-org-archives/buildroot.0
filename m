From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 3 Feb 2020 19:10:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/jack2: bump to version 1.9.14
In-Reply-To: <87imkn1t9s.fsf@dell.be.48ers.dk>
References: <20200203165734.25937-1-titouan.christophe@railnova.eu>
 <87imkn1t9s.fsf@dell.be.48ers.dk>
Message-ID: <2447bd5a-a07c-980c-5074-b63150cfde7f@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter and all,

On 2/3/20 6:21 PM, Peter Korsgaard wrote:
>>>>>> "titouan" == titouan christophe <titouan.christophe@railnova.eu> writes:
> 
>   > From: Titouan Christophe <titouan.christophe@railnova.eu>
>   > Amongst other things, the jack2 waf script has been made
>   > compatible with Python3 in this latest release, which makes
>   > it possible to be built on py3
> 
> This presumably doesn't help much as long as it has host-python in its
> _DEPENDENCIES and our pkg-waf.mk hard codes python2?

I actually came up with this version bump while testing to switch the 
waf-package infrastructure to python3 [1], and in this context jack2 
1.9.12 raised some errors from the waf script.

I'll look if it's possible to remove that host-python dependency as well 
later tonight or tomorrow.

> 
> Still, bumping the version is fine - So committed, thanks.
> 
>   
>   > -JACK2_VERSION = 1.9.12
>   > +JACK2_VERSION = 1.9.14
>   >  JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
>   >  JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
>   >  JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
> 
> So if it can

Yes we can :-)

> 
>   > --
>   > 2.24.1
> 
>   > _______________________________________________
>   > buildroot mailing list
>   > buildroot at busybox.net
>   > http://lists.busybox.net/mailman/listinfo/buildroot
> 


[1] http://paste.awesom.eu/Ypoa

Kind regards,

Titouan
