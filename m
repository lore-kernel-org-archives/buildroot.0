From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 22 Aug 2017 06:57:59 -0400
Subject: [Buildroot] [RFC PATCH 1/2] package/gobject-introspection: add
	package
In-Reply-To: <346fcaef-6d03-4d57-c749-da966016d401@mind.be>
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
Message-ID: <CAFSsvmq8o3QVkogQ3=2=0BK20nZyUecy_hHLsc+XmuSJJYavTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 17, 2017 at 6:39 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 17-08-17 08:44, Alexey Roslyakov wrote:
>> Hi Adam,
>>
>> I experience the same difficulties because of lack of object-introspection.
>
>  I agree that gobject-introspection would definitely be nice to have, but it is
> complicated... And somebody will have to do the work!
>
I don't disagree there! However; I started getting into it and I
quickly realized
it's going to be far above my pay-grade to integrate this beast into BuildRoot!


>  In addition to the comments made on Sam's patch, here are some additional
> sources of information.
>
> [1] describes a Linaro study of the possibilities of cross-compiling
> gobject-introspection. It's kind of wordy, but the bottom line is: almost
> impossible. It dates from 2011 but I don't think things have changed fundamentally.
>
Well, in the Yocto project, there's a patch named:
Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
(I assume it should be Revert an incomplete upstream attempt at cross-compile
 support).  So upstream is starting to try and get cross-compiling support built
into gobject-introspection it looks like!


> [2] shows the gobject-introspection architecture, which explains the different
> steps and how they fit together. Something like this should definitely be part
> of the commit message. From this, I gather that g-ir-compiler is the problem,
> because it's not g-ir-cross-compiler :-)
>
Probably, which is why qemu needs to be used.

> [3] describes how it is solved in an OpenEmbedded layer. The interesting bit
> from this one is that they have 4 separate packages. I don't think we need 4,
> but 2 could be useful.
>
Is it possible to take most of the recipe from yocto and perhaps
translate it into
a make file that works for BuildRoot?

>
>  Regards,
>  Arnout
>
>
> [1] https://wiki.linaro.org/PeterPearse/GobjectIntrospection
> [2] https://wiki.gnome.org/Projects/GObjectIntrospection/Architecture
> [3] https://github.com/Guacamayo/meta-gir/blob/master/README.md
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Thanks!

Adam
