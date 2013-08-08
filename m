From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 8 Aug 2013 07:55:52 +0200
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <20130808000726.66ab7194@skate>
References: <CAAXf6LUhgOkHgj=cRWnkR8tPhAAjT6BhXFvXTBvC5pHfTZ=vww@mail.gmail.com>
 <20130806195402.2f3f94e7@skate>
 <CAAXf6LU0oihr6qLh4KA=+fKYWEbk-iOpwvsmo7AWPSjyC7_=KA@mail.gmail.com>
 <CAAXf6LWF=7-cP_=mTRjNK1qki-gxKx+BoR1C_1Bw9QGUUtstmA@mail.gmail.com>
 <20130807172033.564940d1@skate>
 <CAAXf6LVT144yhgAh5ce5O9FjR=osQ=qV=sod=-pDSOiqeRTvuA@mail.gmail.com>
 <CAAXf6LVFECrtPWQsw0HU5H+ZHjU0tYmz5SNgeKsBA_0RzkNJsQ@mail.gmail.com>
 <20130808000726.66ab7194@skate>
Message-ID: <CAAXf6LUvZEOeF8dDrESqYKr3iiT3haQFzrH-=VnH7gDcvd+z-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon, Alexander,

>
> On Wed, 7 Aug 2013 20:20:31 +0200, Thomas De Schampheleire wrote:
>> On Wed, Aug 7, 2013 at 6:01 PM, Thomas De Schampheleire
>> <patrickdepinguin+buildroot@gmail.com> wrote:
>> >
>> > On Wed, Aug 7, 2013 at 5:20 PM, Thomas Petazzoni
>> > <thomas.petazzoni@free-electrons.com> wrote:
>> >>
>> >> Can you try to see if the same configuration was building in the
>> >> 2013.05, to see if the problem is a consequence of the new internal
>> >> toolchain backend or not?
>> >
>> > I will, and let you know the results.
>>
>> This also failed in 2013.05, and 2013.02. I can continue down the
>> line, but it seems that not many people need C++ support on AVR32? I
>> can
>
> I do remember that some combinations like C++ + locale support has
> always been failing on AVR32.
>
> I personally don't care much about AVR32. I think Simon Dawson was the
> one mainly interested in keeping the AVR32 support in Buildroot for now.
>

Current buildroot cannot properly build an AVR32 toolchain with C++
support. This problem seems to be present for a while now. Are any of
you interested in such C++ support, and do you have time to look into
this?

If no-one is really interested (or does not have time), here are two
suggestions:
- we disable the C++ toolchain option for AVR32 and put a comment in kconfig
- we leave the C++ toolchain option but put a comment in kconfig

Thanks,
Thomas
