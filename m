From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Nov 2013 23:56:32 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131110114639.0d648555@skate> (Thomas Petazzoni's message of
 "Sun, 10 Nov 2013 11:46:39 +0100")
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate>
 <CAHt8ZCP5zMXZfPo8EFpdVCFX0zq7DvJu=GoNcYGWo=frHdFpZA@mail.gmail.com>
 <20131110114639.0d648555@skate>
Message-ID: <87k3gfc1cv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> > The missing TLS problem on AVR32. We still haven't found the solution
>> > to handle this one. As I've suggested previously, I would simply make
>> > TLS support unconditional in Buildroot as soon as thread support is
>> > enabled, and then mark libcap-ng as not available on AVR32. Of course,
>> > if you have an external toolchain without TLS support, you're on your
>> > own.
>> 
>> As you say, we still don't appear to have reached a consensus of
>> opinion on how to solve this.

> Peter, can we agree on the following solution for this:

>  (1) Remove BR2_GCC_ENABLE_TLS, and enable TLS support unconditionally,
>      except when thread support is not enabled.

>  (2) Everywhere, assume that TLS support is always available when we
>      have thread support. If it's not the case (such as AVR32), mark
>      the package as "depends on !<architecture>".

Yes, sounds sensible.

-- 
Bye, Peter Korsgaard
