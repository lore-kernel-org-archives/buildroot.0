From: Simon Dawson <spdawson@gmail.com>
Date: Sun, 10 Nov 2013 10:32:29 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131109191543.414f5694@skate>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate>
Message-ID: <CAHt8ZCP5zMXZfPo8EFpdVCFX0zq7DvJu=GoNcYGWo=frHdFpZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 9 November 2013 18:15, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>>      avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/3df16d60f6bbb679129cd568df4440be6f35cd9f/
>
> The missing TLS problem on AVR32. We still haven't found the solution
> to handle this one. As I've suggested previously, I would simply make
> TLS support unconditional in Buildroot as soon as thread support is
> enabled, and then mark libcap-ng as not available on AVR32. Of course,
> if you have an external toolchain without TLS support, you're on your
> own.

As you say, we still don't appear to have reached a consensus of
opinion on how to solve this.

>>      avr32 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/2ba1bd78f4303ef2f543a4e4fa65d1b68ba3a765/
>
> Missing fallocate on avr32. Simon, what is the proposal to solve this?
> Add fallocate support to 0.9.31 ?

Yes, I'm working on backporting fallocate support to 0.9.31 now.

>>      avr32 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/5cdf3e58df0df184f2ae1f2896c44f3f0f41c94d/
>
> Missing compiler intrinsics on AVR32. Problem already in the process of
> being solved (Simon, Alexander).

I think Alexander's patches have been applied now.

>>        arm | zmqpp-31220ca4a0fb43a0848d7... | NOK | http://autobuild.buildroot.net/results/64494152b75037a1194312a2a408eb7ecb6b56c8/
>>        arm | zmqpp-31220ca4a0fb43a0848d7... | NOK | http://autobuild.buildroot.net/results/75f2cc531892e649599681433f62a1d76e5736c9/
>>        arm | zmqpp-31220ca4a0fb43a0848d7... | NOK | http://autobuild.buildroot.net/results/65783df07ebb447f7561cb84b1bcf581a3084748/
>>        arm | zmqpp-31220ca4a0fb43a0848d7... | NOK | http://autobuild.buildroot.net/results/14d441c5f3a50f61cd5a872711d09fda4e5f8bbd/
>
> Forgets to link against pthread. Simon, can you link into this?

Yes, I'll have a look when I get a chance.

Simon.
