From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Jan 2017 23:46:12 +0100
Subject: [Buildroot] The chrootable self-compiling toolchain and
	Buildroot
In-Reply-To: <ac914698-10b9-73b3-0db0-a34df10e9990@lamiaworks.com.au>
References: <ac914698-10b9-73b3-0db0-a34df10e9990@lamiaworks.com.au>
Message-ID: <c1f3fe00-d9b4-f788-922e-2aeed3187c33@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-01-17 03:50, scsijon wrote:
> 
> BarryK, creator of Puppy Linux has come across a few problems in building with
> buildroot!
> 
> Primarily:
> 
> [quote]I have been using Buildroot recently, to compile applications statically
> with uclibc-ng. Buildroot is great, but it has one major shortcoming -- it
> cannot create a chrootable self-compiling toolchain.[/quote]
> 
> The full message letting you know what's up is at
> http://barryk.org/news/?viewDetailed=00479
> 
> Could someone have a look at it please and if possible give some help as it also
> interests me and i'm sure quite a few other small linux builders who would like
> to update the full system, but can't because of what seems to be the loss of
> the  chrootable self-compiling toolchain function.
> 
> It would actually be nice to be able to build in top of buildroot.

 This is a FAQ (well, actually, the reason we don't support it is because it
isn't asked very often...) [1].

[quote]
It has been decided that support for the native compiler on the target would be
stopped from the Buildroot-2012.11 release because:

* this feature was neither maintained nor tested, and often broken;
* this feature was only available for Buildroot toolchains;
* Buildroot mostly targets small or very small target hardware with limited
resource onboard (CPU, ram, mass-storage), for which compiling on the target
does not make much sense;
* Buildroot aims at easing the cross-compilation, making native compilation on
the target unnecessary.

If you need a compiler on your target anyway, then Buildroot is not suitable for
your purpose. In such case, you need a real distribution and you should opt for
something like:

* openembedded
* yocto
* emdebian
* Fedora
* openSUSE ARM
* Arch Linux ARM
[/quote]

[1] https://buildroot.org/downloads/manual/manual.html#faq-no-compiler-on-target
> 
> thanks
> scsijon
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
