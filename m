From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 28 Sep 2011 20:43:22 +0200
Subject: [Buildroot] Creating an external toolchain [was: Re: Antw:Re:
 Antw: Antw:Re: libgcc build fails on Fedora15]
In-Reply-To: <4E8367B4.3050709@gmail.com>
References: <7290fd86f3ac9.4e80ae6d@home.nl>
 <201109280805.21263.arnout@mind.be> <4E8367B4.3050709@gmail.com>
Message-ID: <CAAXf6LXBw9O4E7p-3G6ugX_uF2T=OWf+oz6=K_-wbe8r02oztA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steve,

On Wed, Sep 28, 2011 at 8:30 PM, Steve Calfee <stevecalfee@gmail.com> wrote:
> On 09/27/11 23:05, Arnout Vandecappelle wrote:
>>
>> On Monday 26 September 2011 16:55:09, MARCEL JANSSEN wrote:
>>> I just have one question which probably belongs in the faq (I may have
>>> missed something as well). I can't yet figure out how to build the output
>>> for different devices without recompiling the whole toolchain. I have
>>> several different images which are just a little different in the sense
>>> that they all have the same kernel but some different packages. It would
>>> be great if I could just switch between configs and don't have to
>>> recompile the whole toolchain again or even shared packages between those
>>> configs.
>>
>> ?Buildroot supports an external toolchain, but it isn't easy to create one.
>> The easiest is to use a crosstool-NG toolchain: build it, install it in some
>> central place, and use it as an external toolchain from buildroot.
>>
>> ?It would be nice if buildroot also supported creation of an external
>> toolchain (based on an internal toolchain config). ?The toolchain is currently
>> built in output/host/usr/... and is not relocatable, so it's difficult to
>> share it between different buildroot builds.
>>
> HI Arnout,
>
> I use the internal buildroot toolchain as an external toolchain all the
> time. I first checkout the buildroot tree into the ....tools directory.
> I select some defaultconfig, then do a make menuconfig and remove
> everything but the toolchain building. The make then trundles for a long
> time and finally I get a toolchain. I can easily change toolchain
> options, if the target system needs something not in the default.
>
> Then I checkout another buildroot tree into a working directory, and use
> the make defaultconfig. Then I make menuconfig and set it up using the
> newly created tools tree toolchain as an external toolchain. This speeds
> up the builds in the working directory, and I don't have to worry about
> the dreaded "make clean" problem of wiping the tools.
>
> More than one working buildroot configuration can use the same tools, as
> long as the same tool options are used in all "parallel" working trees.

Correct, but this doesn't work if the original toolchain build
location is not present (for example because you removed it, or
because you try your toolchain on another machine).

Best regards,
Thomas
