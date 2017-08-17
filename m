From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Aug 2017 00:39:06 +0200
Subject: [Buildroot] [RFC PATCH 1/2] package/gobject-introspection: add
 package
In-Reply-To: <1502952247260-173614.post@n4.nabble.com>
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
Message-ID: <346fcaef-6d03-4d57-c749-da966016d401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-08-17 08:44, Alexey Roslyakov wrote:
> Hi Adam,
> 
> I experience the same difficulties because of lack of object-introspection.

 I agree that gobject-introspection would definitely be nice to have, but it is
complicated... And somebody will have to do the work!

 In addition to the comments made on Sam's patch, here are some additional
sources of information.

[1] describes a Linaro study of the possibilities of cross-compiling
gobject-introspection. It's kind of wordy, but the bottom line is: almost
impossible. It dates from 2011 but I don't think things have changed fundamentally.

[2] shows the gobject-introspection architecture, which explains the different
steps and how they fit together. Something like this should definitely be part
of the commit message. From this, I gather that g-ir-compiler is the problem,
because it's not g-ir-cross-compiler :-)

[3] describes how it is solved in an OpenEmbedded layer. The interesting bit
from this one is that they have 4 separate packages. I don't think we need 4,
but 2 could be useful.


 Regards,
 Arnout


[1] https://wiki.linaro.org/PeterPearse/GobjectIntrospection
[2] https://wiki.gnome.org/Projects/GObjectIntrospection/Architecture
[3] https://github.com/Guacamayo/meta-gir/blob/master/README.md
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
