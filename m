From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 8 Aug 2013 08:21:14 +0100
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <CAAXf6LUvZEOeF8dDrESqYKr3iiT3haQFzrH-=VnH7gDcvd+z-g@mail.gmail.com>
References: <CAAXf6LUhgOkHgj=cRWnkR8tPhAAjT6BhXFvXTBvC5pHfTZ=vww@mail.gmail.com>
 <20130806195402.2f3f94e7@skate>
 <CAAXf6LU0oihr6qLh4KA=+fKYWEbk-iOpwvsmo7AWPSjyC7_=KA@mail.gmail.com>
 <CAAXf6LWF=7-cP_=mTRjNK1qki-gxKx+BoR1C_1Bw9QGUUtstmA@mail.gmail.com>
 <20130807172033.564940d1@skate>
 <CAAXf6LVT144yhgAh5ce5O9FjR=osQ=qV=sod=-pDSOiqeRTvuA@mail.gmail.com>
 <CAAXf6LVFECrtPWQsw0HU5H+ZHjU0tYmz5SNgeKsBA_0RzkNJsQ@mail.gmail.com>
 <20130808000726.66ab7194@skate>
 <CAAXf6LUvZEOeF8dDrESqYKr3iiT3haQFzrH-=VnH7gDcvd+z-g@mail.gmail.com>
Message-ID: <CAHt8ZCOx1o1GPcgFZN9RYQWvGivTy5R6bWuUwX4B67qban++EA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 8 August 2013 06:55, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Current buildroot cannot properly build an AVR32 toolchain with C++
> support. This problem seems to be present for a while now. Are any of
> you interested in such C++ support, and do you have time to look into
> this?

I do currently still require C++ support on avr32. However, since
support for uClibc 0.9.31.x was removed from Buildroot, I have had to
build my avr32 toolchain using a custom Buildroot fork: unfortunately,
while uClibc 0.9.33.x does build for avr32, the result is a root
filesystem with unusably-slow runtime performance.

So I'm not particularly interested in getting the avr32 toolchain ---
as it currently exists in Buildroot --- to build with C++ support. But
I do need the "Toolchain has C++ support" flag to be available when
using an external avr32 toolchain.

> If no-one is really interested (or does not have time), here are two
> suggestions:
> - we disable the C++ toolchain option for AVR32 and put a comment in kconfig
> - we leave the C++ toolchain option but put a comment in kconfig

I'm happy with either of these options, as long as it is still
possible to mark an external avr32 toolchain as having C++ support.

From my point of view, the ideal solution would be to reinstate uClibc
0.9.31 support, and to lock the avr32 toolchain to that version of
uClibc. But I understand that this is likely to be unacceptable to
others.

Simon.
