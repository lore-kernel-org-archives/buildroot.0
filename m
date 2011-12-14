From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Dec 2011 08:08:49 +0100
Subject: [Buildroot] Make problem on 64-bit linux with CS 2009q1
In-Reply-To: <87d3bttw2v.fsf@macbook.be.48ers.dk>
References: <4EE1CB14.9010802@free.fr>
 <CAHUNapQTUqg5Vo4c57Yg4OqG+FL6trcjZBPJsEzfE0xGc=cdvQ@mail.gmail.com>
 <87d3bttw2v.fsf@macbook.be.48ers.dk>
Message-ID: <201112140808.49826.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 12 December 2011 20:43:20 Peter Korsgaard wrote:
>  Trevor> The CONFIG_SITE mechanism is purposefully provided to help "prime the
>  Trevor> cache" for ./configure scripts when cross compiling to provide answers
>  Trevor> to questions which would normally require code to be compiled and run
>  Trevor> (which fails, of course, when the compiler being used is a cross
>  Trevor> compiler).
> 
>  Trevor> Should the CONFIG_SITE feature be disabled and otherwise unavailable
>  Trevor> to users just because there's a bug in openSUSE's implementation?
> 
> Yes, because whatever defaults potentially could make sense for the
> build host in general doesn't make sense for the target, and for BR
> builds to reproducable behaviour shouldn't change depending on something
> outside our control.
> 
> You could perhaps argue for allowing it for host packages, but the
> simplest/safest option is just to disallow it for all.

 Or better yet, to use our own and prime it with all the generic configure 
variables.  That may bring down the huge amount of time spent in running
configure scripts...

 OTOH, if the one that SUSE provides is buggy, that is probably because it
is difficult to get it correct...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
