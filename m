From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Tue, 8 Nov 2011 08:14:18 +0100
Subject: [Buildroot]  Future...TOOLCHAIN builds.
In-Reply-To: <mailman.1400.1320692517.2942.buildroot@busybox.net>
References: <mailman.1400.1320692517.2942.buildroot@busybox.net>
Message-ID: <1531E53627F1F749B4FE809BF2A4EB6702C39438@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>> While following the discussions on the buildroot mailing list, I saw
>> that for the next releases the CROSSTOOL-NG toolchain will be used as
>> default, so a started to experiment with the CROSSTOOL-NG buildroot
>> toolchain (this morning).
>

<<Thomas >> 
> Great! It's really nice to have feedback on this.

Having some troubles to get a buildroot-CROSSTOOL-NG-toolchain build (on
Linux host)... But I'll keep you all informed.

>> Until now.. U used the buildroot to generate a 'cross-toolchain',
even
>> 'worse'; I used buildroot to generate 2 toolchains. 
>> 	A) One running on LINUX 
>> 	B) One running on top of CYGWIN (for the less Linux-minded
>> colleagues)

<<Thomas >> 
>Do you use Buildroot only to build a toolchain ?

Well it is a whole story, 

A) On Linux, no BUILDROOT is used to build a complete target, for the
at91sam9g10, at91sam9m10 (arm-9).. And recently one for the imx-537
(cortex-A8) (and x86 for test cases).

B) On Cygwin (windows) yes, I do only build the toolchain, for my
colleagues that not want (can?) switch to Linux (for several reasons).
(These colleagues are writing ... custom application-software.)

Having some troubles to get a buildroot-CROSSTOOL-NG-toolchain build (on
Linux host)... But I'll keep you all informed.


>> 1) Will this also be possible for the CROSSTOOL-NG toolchain that is
>> build with buildroot?

<<Thomas >> 
>
>If you build only a toolchain, then crosstool-NG is a very good
>replacement for Buildroot.

>If you build a toolchain and then use Buildroot to build an embedded
>Linux build system, then you can build your toolchain with crosstool-NG
>separately, and then use it as an external toolchain in Buildroot, or
>you can instruct Buildroot to use crosstool-NG has a backed to build
>the toolchain.

>Note that we intend to do in 2012.02 is move the crosstool-NG backend
>as the default, not to remove the Buildroot code to build toolchain,
>which will still be offered as an alternate choice. However, on the
>long run, if everything works fine, we might drop the Buildroot code to
>build the toolchain.

>> 2) Another question that pops-up when building a CROSSTOOL-NG
toolchain,
>> is that I'm not able to select a toolchain with ARM-VECTOR-floating
>> point support is this correct? 

<<Thomas >> 
>In Target Options -> Floating Point, you can choose between hardware
>floating point and software floating point. There are patches being
>discussed/reviewed to add a choice between the hard and softfp ABI to
>pass floating-point arguments. And I'm sure than Yann, crosstool-NG's
>maintainer, is definitely interested by patches improving things in
>that area.

For some reason I missing this, in other words, when selecting a
CROSSTOOL-NG-toolchain (in buildroot) the option for
arm-vector-FLOATING-point is disappearing and I'm not able to find any
option that allows me to turn this on.
Note: the 'use-software floating point by default' option is still
there, but I have not selected this.


>> NOTE: Of the record, the buildroot-CYGWIN-toolchain build was working
>> until some weeks ago (for me), in the current git-tree this is not
>> working anymore ( build troubles into mpc/mpfr and gmp), without
looking
>> to much in detail (I think) it has to do with  'another' way of
naming
>> libs 'libxxxxx' on Linux vs 'cygxxxxxxx' on cygwin!

<<Thomas >> 
>Buildroot has never supported officially Cygwin, and nobody tests this.
>I think crosstool-NG has better support for this, but Yann might
>comment on this.

I know thomas, and I was aware of this, this was the reason why I said
'of the record' !
But even if it was (and never will be, I understand this) suported, it
was nice that is was working :-)  
 
Regards Noel
