From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 12 Dec 2011 12:52:15 -0500
Subject: [Buildroot] Make problem on 64-bit linux with CS 2009q1
In-Reply-To: <20111212111750.0473fb52@skate>
References: <4EE1CB14.9010802@free.fr> <20111209193729.0cc88e6e@skate>
 <87y5ull8z0.fsf@macbook.be.48ers.dk>
 <87ty59l5y1.fsf@macbook.be.48ers.dk>
 <CAHUNapRt1=nyUK=o__fUDk2JQVn66F1ikwBF+jarECg9=CESSg@mail.gmail.com>
 <4EE5B9E9.40404@free.fr> <87hb16up5z.fsf@macbook.be.48ers.dk>
 <4EE5D3BB.7000700@free.fr> <20111212111750.0473fb52@skate>
Message-ID: <CAHUNapQTUqg5Vo4c57Yg4OqG+FL6trcjZBPJsEzfE0xGc=cdvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 12, 2011 at 5:17 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>> If I unset CONFIG_SITE, it seems to work fine. :)
>> Could you unset CONFIG_SITE in Buildroot, please?
>
> Peter has already modified Buildroot to unset CONFIG_SITE following
> your report:
>
> http://git.buildroot.net/buildroot/commit/?id=12c9f7dd6dee9c6029b4f9a12d6aac1516911ab4

It appears that the contents of openSUSE 12.1's site file are buggy.

The CONFIG_SITE mechanism is purposefully provided to help "prime the
cache" for ./configure scripts when cross compiling to provide answers
to questions which would normally require code to be compiled and run
(which fails, of course, when the compiler being used is a cross
compiler).

Should the CONFIG_SITE feature be disabled and otherwise unavailable
to users just because there's a bug in openSUSE's implementation?
