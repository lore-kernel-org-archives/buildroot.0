From: Wolfram Gloger <wg@malloc.de>
Date: Wed, 13 Jul 2011 18:21:52 +0200
Subject: [Buildroot] [PATCH] new package: libav
In-Reply-To: <8739ijvpow.fsf@macbook.be.48ers.dk> (message from Peter
 Korsgaard on Wed, 06 Jul 2011 09:22:23 +0200)
References: <0LvAri-1Rcapv3sjy-010LQJ@mrelayeu.kundenserver.de>
 <20110705224642.4953b847@skate> <87k4bwuh1x.fsf@macbook.be.48ers.dk>
 <20110706085140.749b6388@skate> <8739ijvpow.fsf@macbook.be.48ers.dk>
Message-ID: <0MJCxO-1QfOIs1nLu-002qLZ@mrelayeu.kundenserver.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
> Hi,
> 
>  Thomas> My understanding is that libav is a fork of ffmpeg. So, it will
>  Thomas> probably become more and more different than ffmpeg, in which case
>  Thomas> separate packages are obviously the right way of handling this.
> 
>  Thomas> In the mean time, as they are exactly similar (at least in terms of
>  Thomas> build mechanism and options), I wanted to suggest doing a modular/tinyx
>  Thomas> style of selection. We might switch to a separate package when needed.
>  Thomas> But on the other hand, having a separate package is probably more clear.
> 
> Yes. Also if they both use the same binary/library names, then we need
> to ensure that you cannot enable both at once.

This is almost 100% the case -- the ffmpeg/ffprobe binary names are
the same, and the static library names are the same.  The dynamic lib
names carry a version number and should/will change if an
incompatibility arises.

It currently doesn't make sense to enable both packages at once, so
I'll try to add that to the buildroot patch.

Regards,
Wolfram.
