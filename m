From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Nov 2013 18:23:08 +0100
Subject: [Buildroot] buildroot: gcc options
In-Reply-To: <528B59FE.6070205@zacarias.com.ar>
References: <EADA2943BAC14C4AB625A3550A3BE980096DF2C30B@SI-MBX04.de.bosch.com>
 <CAAXf6LU1bamXyxhjhB5rTTHM-iHRbKrsTF5m1MUJLZjOaNXmuQ@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C345@SI-MBX04.de.bosch.com>
 <CAAXf6LU3kQE2J+3zS-XCBYZ9SkxOSNyEAkV-E0_LQbhq3TP8Rw@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C375@SI-MBX04.de.bosch.com>
 <CAAXf6LX6fVb+bm6UTzEpjDhitAYx3svJx1eTyoHYD85xEFXY7g@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C37F@SI-MBX04.de.bosch.com>
 <CAAXf6LV9Wzjr1P+n-Mxw8FqnqsAdOMr3Wfaam48uHQPcVxu73A@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C3BA@SI-MBX04.de.bosch.com>
 <CAAXf6LUiwy9Fmm5sNBTc3H4XvpsDhmRNeYj6in=HiZsepQ8xRQ@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DFE7183@SI-MBX04.de.bosch.com>
 <528B59FE.6070205@zacarias.com.ar>
Message-ID: <528B9E7C.1010804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/11/13 13:30, Gustavo Zacarias wrote:
> On 11/19/2013 09:17 AM, Altunbas Sabri (DC-IA/EAH2) wrote:
>
>> Hi Thomas,
>>
>> my problem is still not solved.
>>
>> I picked "Buildroot toolchain" and "eglibc" as C-library and get the following error
>> ..
>> configure: error: unrecognized option: `-mfmovd'
>> ..
>> With "uclibs" the same behave.
>>
>> My config is attented
>>
>> Can you give some hints ?
>
> Hi.
> Actually BR2_EXTRA_GCC_CONFIG_OPTIONS isn't for that.
> You need to set BR2_TARGET_OPTIMIZATIONS for all the packages to be
> built with those CFLAGS, and you need to add them to
> GLIBC_EXTRA_CFLAGS/UCLIBC_EXTRA_CFLAGS (depending on which libc you want
> to use) - problem is that isn't supported in an easy way at the moment.
> The quick way to test it would be to call make with those arguments in
> every invocation (actually until your libc is built, for packages
> BR2_TARGET_OPTIMIZATIONS does the trick), something like:
>
> make GLIBC_EXTRA_CFLAGS="-madlign -mfmovd"

  Is there any reason why BR2_TARGET_OPTIMIZATIONS isn't used for 
building the C library?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
