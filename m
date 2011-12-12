From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Dec 2011 20:43:20 +0100
Subject: [Buildroot] Make problem on 64-bit linux with CS 2009q1
In-Reply-To: <CAHUNapQTUqg5Vo4c57Yg4OqG+FL6trcjZBPJsEzfE0xGc=cdvQ@mail.gmail.com>
 (Trevor Woerner's message of "Mon, 12 Dec 2011 12:52:15 -0500")
References: <4EE1CB14.9010802@free.fr> <20111209193729.0cc88e6e@skate>
 <87y5ull8z0.fsf@macbook.be.48ers.dk>
 <87ty59l5y1.fsf@macbook.be.48ers.dk>
 <CAHUNapRt1=nyUK=o__fUDk2JQVn66F1ikwBF+jarECg9=CESSg@mail.gmail.com>
 <4EE5B9E9.40404@free.fr> <87hb16up5z.fsf@macbook.be.48ers.dk>
 <4EE5D3BB.7000700@free.fr> <20111212111750.0473fb52@skate>
 <CAHUNapQTUqg5Vo4c57Yg4OqG+FL6trcjZBPJsEzfE0xGc=cdvQ@mail.gmail.com>
Message-ID: <87d3bttw2v.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trevor" == Trevor Woerner <twoerner@gmail.com> writes:

Hi,

 Trevor> It appears that the contents of openSUSE 12.1's site file are buggy.

 Trevor> The CONFIG_SITE mechanism is purposefully provided to help "prime the
 Trevor> cache" for ./configure scripts when cross compiling to provide answers
 Trevor> to questions which would normally require code to be compiled and run
 Trevor> (which fails, of course, when the compiler being used is a cross
 Trevor> compiler).

 Trevor> Should the CONFIG_SITE feature be disabled and otherwise unavailable
 Trevor> to users just because there's a bug in openSUSE's implementation?

Yes, because whatever defaults potentially could make sense for the
build host in general doesn't make sense for the target, and for BR
builds to reproducable behaviour shouldn't change depending on something
outside our control.

You could perhaps argue for allowing it for host packages, but the
simplest/safest option is just to disallow it for all.


-- 
Bye, Peter Korsgaard
