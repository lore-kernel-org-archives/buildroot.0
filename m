From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Aug 2013 08:15:42 +0200
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <20130808195932.318f5903@skate>
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
 <20130808195932.318f5903@skate>
Message-ID: <5209CF0E.6080503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/08/13 19:59, Thomas Petazzoni wrote:
> Dear Simon Dawson,
>
> On Thu, 8 Aug 2013 17:18:24 +0100, Simon Dawson wrote:
>
>> On 8 August 2013 11:56, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
>>> 1) Reinstate patches in the appropiate place since uclibc was packaged.
>>> 2) Probably add various "depends on !BR2_avr32" in packages that need
>>> newer syscalls (alternatively add a ton of backports for uclibc 0.9.31
>>> from newer releases).
>>> 3) Revert startfiles cleanup to the old manual way, adding new
>>> exceptions/modes for the noMMU crowd (it wasn't handled before) - or
>>> alternatively also patch the uclibc 0.9.31 makefile to make it more
>>> 0.9.32/33-ish like.
>>
>> That doesn't sound too bad. I'm happy to do this work, if appropriate.
>> Perhaps your point #2 will not be necessary in the short term...?
>
> Ok, so let's do this maybe?
>
> I think #2 is necessary, we already have some packages that use
> syscalls that aren't provided by uClibc 0.9.31. But ok, it's just a
> matter of adding another bunch of "depends on !BR2_avr32", it's not
> fun, but it's not a big deal either.
>
> As long as someone is interested in keeping AVR32 support in place, and
> is willing to do some effort to keep this support in a reasonably good
> shape in upstream Buildroot, I'm fine with keeping it.

  What about just not including it in the autobuilders, and adding a big 
comment in the top-level menuconfig saying that AVR32 is not really 
supported and things might break?

  I think it would be good if Simon, Alexander and Thiago can use 
upstream buildroot without custom forks, but if these are the only users 
then it's not really needed to include it in the autobuilders IMHO.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
