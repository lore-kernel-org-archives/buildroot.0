From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 28 Sep 2011 12:19:35 +0200
Subject: [Buildroot] Creating an external toolchain [was: Re: Antw:Re:
 Antw: Antw:Re: libgcc build fails on Fedora15]
In-Reply-To: <201109280805.21263.arnout@mind.be>
References: <7290fd86f3ac9.4e80ae6d@home.nl>
 <201109280805.21263.arnout@mind.be>
Message-ID: <CAAXf6LX7rpF2PSRGeNE0dAtiuSjmFFu+frYevry+6vs-qxTn8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Sep 28, 2011 at 8:05 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
> On Monday 26 September 2011 16:55:09, MARCEL JANSSEN wrote:
>
>> I just have one question which probably belongs in the faq (I may have
>
>> missed something as well). I can't yet figure out how to build the output
>
>> for different devices without recompiling the whole toolchain. I have
>
>> several different images which are just a little different in the sense
>
>> that they all have the same kernel but some different packages. It would
>
>> be great if I could just switch between configs and don't have to
>
>> recompile the whole toolchain again or even shared packages between those
>
>> configs.
>
> Buildroot supports an external toolchain, but it isn't easy to create one.
> The easiest is to use a crosstool-NG toolchain: build it, install it in some
> central place, and use it as an external toolchain from buildroot.
>
> It would be nice if buildroot also supported creation of an external
> toolchain (based on an internal toolchain config). The toolchain is
> currently built in output/host/usr/... and is not relocatable, so it's
> difficult to share it between different buildroot builds.

The non-relocatability of the buildroot toolchain is a problem I am
experiencing as well. Specifying LD_LIBRARY_PATH works as a
workaround, but is not a proper solution. The issue was addressed in
following mail thread:
http://lists.busybox.net/pipermail/buildroot/2011-September/045407.html

Best regards,
Thomas
