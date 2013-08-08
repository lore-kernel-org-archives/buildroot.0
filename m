From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 08 Aug 2013 14:57:10 -0300
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <CAHt8ZCNq1=PW86bwDN0Aqg969ukzR_Z-0hQE=WcDo7b+Tg-uFA@mail.gmail.com>
References: <CAAXf6LUhgOkHgj=cRWnkR8tPhAAjT6BhXFvXTBvC5pHfTZ=vww@mail.gmail.com>
 <20130806195402.2f3f94e7@skate>
 <CAAXf6LU0oihr6qLh4KA=+fKYWEbk-iOpwvsmo7AWPSjyC7_=KA@mail.gmail.com>
 <CAAXf6LWF=7-cP_=mTRjNK1qki-gxKx+BoR1C_1Bw9QGUUtstmA@mail.gmail.com>
 <20130807172033.564940d1@skate>
 <CAAXf6LVT144yhgAh5ce5O9FjR=osQ=qV=sod=-pDSOiqeRTvuA@mail.gmail.com>
 <CAAXf6LVFECrtPWQsw0HU5H+ZHjU0tYmz5SNgeKsBA_0RzkNJsQ@mail.gmail.com>
 <20130808000726.66ab7194@skate>
 <CAAXf6LUvZEOeF8dDrESqYKr3iiT3haQFzrH-=VnH7gDcvd+z-g@mail.gmail.com>
 <CAHt8ZCOx1o1GPcgFZN9RYQWvGivTy5R6bWuUwX4B67qban++EA@mail.gmail.com>
 <20130808100303.2b0226dd@skate> <52037954.9080408@zacarias.com.ar>
 <CAHt8ZCNq1=PW86bwDN0Aqg969ukzR_Z-0hQE=WcDo7b+Tg-uFA@mail.gmail.com>
Message-ID: <5203DBF6.7020106@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/08/2013 01:18 PM, Simon Dawson wrote:

> Hi Gustavo,
> 
> On 8 August 2013 11:56, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
>> 1) Reinstate patches in the appropiate place since uclibc was packaged.
>> 2) Probably add various "depends on !BR2_avr32" in packages that need
>> newer syscalls (alternatively add a ton of backports for uclibc 0.9.31
>> from newer releases).
>> 3) Revert startfiles cleanup to the old manual way, adding new
>> exceptions/modes for the noMMU crowd (it wasn't handled before) - or
>> alternatively also patch the uclibc 0.9.31 makefile to make it more
>> 0.9.32/33-ish like.
> 
> That doesn't sound too bad. I'm happy to do this work, if appropriate.
> Perhaps your point #2 will not be necessary in the short term...?

There'll be some autobuilder failures if that's not done.
#3 will surely take time too since it was a hardcoded default before the
0.9.31 removal which made the internal blackfin toolchain never work (it
builds now at least, as far as "work" depends on having someone testing
things, work still remains but it's a start).
It also affects other nommu toolchains like ARM, but it's broken for
other reasons for now.
New packages and bumps might break for avr32 too, we just can't hold on
to old software being buggy and/or having security vulnerabilities just
to keep it running on old bitrot toolchains.

> I understand where you're coming from here. I'm not sure we're "going
> in circles" just yet, but appreciate that it may come to that.

If you want to volunteer continuous amounts of time into getting this
right, then maybe, i'm not the only one deciding here.
I can't get the toolchain to build and everything points to "install
some odd host gcc version" which isn't quite right - things are supposed
to work in many different normal scenarios.
But as Thomas said if the latest kernels don't work that's somewhat of a
bad omen.
Regards.
