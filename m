From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 25 May 2012 22:01:26 +0100
Subject: [Buildroot] [PATCH resend] owl-linux: new package
In-Reply-To: <CAC1BbcSMuYcQC8koffGSaTvVcZh2rRNEX70V81QHdUZOt1md2Q@mail.gmail.com>
References: <1337950319-19104-1-git-send-email-spdawson@gmail.com>
 <87likg81mk.fsf@macbook.be.48ers.dk>
 <CAC1BbcRi_0KzkKP7Pfi6e407kp3QGyiWj+mVEA355z_HeC1qvg@mail.gmail.com>
 <CAC1BbcSMuYcQC8koffGSaTvVcZh2rRNEX70V81QHdUZOt1md2Q@mail.gmail.com>
Message-ID: <CAHt8ZCPn=odr_8FA1Kvk1QpudUhT_Z37JYhmdnt01dfe5n8Puw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Currently, the included library has been compiled for ARM architectures
> only. In version 1.0.6 and later, the library has been compiled with the
> CodeSourcery GNU EABI toolchain 2011.03-42
>
> So it seems like this should depend on atleast ARM, maybe some processor
> variants and perhaps even the codesourcery 2011.03 toolchain?

Thanks for the detailed and insightful comments. You're certainly
right about the need for an ARM dependency --- probably requiring an
ARM9 architecture variant will be safest.

I worry about adding a dependency on the codesourcery toolchain
though: this will break my own particular use case, in which the
internal buildroot toolchain seems to be working fine.

> M= might contain spaces too, please make them fix this also.

Thanks for pointing this out; I shall fix it.
