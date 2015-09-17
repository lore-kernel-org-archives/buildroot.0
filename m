From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 17 Sep 2015 22:22:52 +0100
Subject: [Buildroot] [PATCH RFC v1 1/1] gcc: fix problem with detecting
 SSP under uclibc-ng
In-Reply-To: <20150917222021.4096b754@free-electrons.com>
References: <1442500678-4457-1-git-send-email-brendanheading@gmail.com>
 <20150917191421.53dd3542@free-electrons.com>
 <CA+BsyQ7RqCVPi6h9VUJpdQ49pVZwLnCGzRtL+wN1JUhs+T7_WA@mail.gmail.com>
 <20150917222021.4096b754@free-electrons.com>
Message-ID: <CA+BsyQ4m2kBQkc4k702Tj8c9Y5N-eYhjy6CM-7wWRPHEpjWtCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> Yeah I knew that exporting it globally was not going to fly - I just
>> submitted it as a starting point for discussion how to solve this.
>
> Sure, no problem with that. It's already much appreciated that you did
> all this investigation.

Thank you for that!

> We are fine with patches being order-dependent. That's fine we have a
> sequence number for all patches in the first place.
>
> So far, the effort to push upstream our gcc patches has been very
> limited. It would be good to push some of them upstream, but in the
> mean time, our stack of gcc patches is not that big, and is not causing
> too many problems when bumping gcc.

Yeah I also get the sense that getting patches upstream in GCC might
be difficult, and when I was googling this I saw other examples of
people running into problems similar to this. I would guess it's
especially unlikely we would get patches into the versions that are in
maintenance mode. We might have more luck with next (ie GCC 6.0).

>> Aside from that .. GCC actually already has a block which checks
>> UCLIBC_HAS_SSP. The problem is that it reaches it only if the glibc
>> version check returns that the version is 2.3 or lower. The fix might
>> simply be to reorder the check.
>
> If it's that simple, then it should be done :) In any case, version
> based tests are often not a good idea, so when uClibc is used, gcc
> should really rely on UCLIBC_HAS_SSP.

Okay, I am now looking at putting together an interim patch set. I
don't think there is any point in trying to submit them into
maintenance releases of the existing versions but it's worth taking a
shot at getting them into -next.

regards

Brendan
