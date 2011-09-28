From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 28 Sep 2011 18:48:21 +0000 (UTC)
Subject: [Buildroot] Creating an external toolchain [was: Re: Antw:Re:
 Antw: Antw:Re: libgcc build fails on Fedora15]
References: <7290fd86f3ac9.4e80ae6d@home.nl>
 <201109280805.21263.arnout@mind.be> <4E8367B4.3050709@gmail.com>
Message-ID: <j5vq5k$9q2$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2011-09-28, Steve Calfee <stevecalfee@gmail.com> wrote:

>> Buildroot supports an external toolchain, but it isn't easy to create
>> one.  The easiest is to use a crosstool-NG toolchain: build it,
>> install it in some central place, and use it as an external toolchain
>> from buildroot.
>> 
>> It would be nice if buildroot also supported creation of an external 
>> toolchain (based on an internal toolchain config).  The toolchain is
>> currently built in output/host/usr/... and is not relocatable, so
>> it's difficult to share it between different buildroot builds.

Once upon a time (a couple years ago) I had hacked up buildroot's
toolchain makefiles and then wrapped the whole thing in a shellscript
so that I could use buildroot to build an external toolchain.

I used that for a couple months but then I switched to using
crosstool-NG.  It's just simpler.  I think trying to turn buildroot
into something that can generate external toolchains would be sort of
a duplication of effort.

> I use the internal buildroot toolchain as an external toolchain all
> the time. I first checkout the buildroot tree into the ....tools
> directory. I select some defaultconfig, then do a make menuconfig and
> remove everything but the toolchain building. The make then trundles
> for a long time and finally I get a toolchain. I can easily change
> toolchain options, if the target system needs something not in the
> default.
>
> Then I checkout another buildroot tree into a working directory, and
> use the make defaultconfig. Then I make menuconfig and set it up
> using the newly created tools tree toolchain as an external
> toolchain. This speeds up the builds in the working directory, and I
> don't have to worry about the dreaded "make clean" problem of wiping
> the tools.
>
> More than one working buildroot configuration can use the same tools,
> as long as the same tool options are used in all "parallel" working
> trees.

That sounds sort of like what I did, except I had it wrapped up so
that the "menuconfig" stuff was automated.

-- 
Grant Edwards               grant.b.edwards        Yow! Why don't you ever
                                  at               enter any CONTESTS,
                              gmail.com            Marvin??  Don't you know
                                                   your own ZIPCODE?
