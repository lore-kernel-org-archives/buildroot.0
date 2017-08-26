From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 26 Aug 2017 12:01:35 -0400
Subject: [Buildroot] [RFC PATCH 1/2] package/gobject-introspection: add
	package
In-Reply-To: <2b5ed9ae-1477-0c8c-ff7d-440cc60d75a9@mind.be>
References: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
 <b5cbc35d4d8e4457563fdf5b8dfd04360c6616a5.1487811280.git.sam.bobroff@au1.ibm.com>
 <20170223101820.127d5700@free-electrons.com>
 <20170224040713.GA4446@tungsten.ozlabs.ibm.com>
 <20170224092549.2c560db3@free-electrons.com>
 <8eeadd56-4c2b-94ff-c182-50e18e81f749@mind.be>
 <20170227150637.ljo2c6dv3izstddn@tarshish>
 <20170227232240.GB2535@tungsten.ozlabs.ibm.com>
 <1502794041870-173505.post@n4.nabble.com>
 <1502952247260-173614.post@n4.nabble.com>
 <346fcaef-6d03-4d57-c749-da966016d401@mind.be>
 <CAFSsvmq8o3QVkogQ3=2=0BK20nZyUecy_hHLsc+XmuSJJYavTA@mail.gmail.com>
 <2b5ed9ae-1477-0c8c-ff7d-440cc60d75a9@mind.be>
Message-ID: <CAFSsvmr9ZWp8yh+ve88RDUsBQS9PxgZRWTjAkotaECQ13wNeJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 24, 2017 at 7:03 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 22-08-17 12:57, Adam Duskett wrote:
>> On Thu, Aug 17, 2017 at 6:39 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> [snip]
>> Well, in the Yocto project, there's a patch named:
>> Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
>> (I assume it should be Revert an incomplete upstream attempt at cross-compile
>>  support).  So upstream is starting to try and get cross-compiling support built
>> into gobject-introspection it looks like!
>
>  Hm, could be interesting to work with upstream to really get cross-compilation
> to work... But still, someone needs to do it :-)
>
I think upstream is probably happy with yocto/oe just using the scripts they
made + qemu. ;)

>
>
>>> [3] describes how it is solved in an OpenEmbedded layer. The interesting bit
>>> from this one is that they have 4 separate packages. I don't think we need 4,
>>> but 2 could be useful.
>>>
>> Is it possible to take most of the recipe from yocto and perhaps
>> translate it into
>> a make file that works for BuildRoot?
>
>  Possibly, I haven't looked at the details. I also haven't looked at how they
> deal with the kernel ABI issue in qemu-user. Perhaps it works just with glibc
> and they assume that glibc is built with the very-old-kernel compatibility layer.
>
I highly doubt that considering OE/Yocto uses uclibc as well as glibc.
They even
have a bunch of patches to get SystemD working with uclibc.

>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
Adam
