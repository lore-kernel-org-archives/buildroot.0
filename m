From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 3 Jun 2020 06:19:47 -0500
Subject: [Buildroot] [PATCH] package/libqmi: bump to 1.25.900
In-Reply-To: <20200602222429.220a7e29@windsurf.home>
References: <20200602122146.9480-1-matthew.weber@rockwellcollins.com>
 <20200602222429.220a7e29@windsurf.home>
Message-ID: <CANQCQpa-PE4jh8yARd3Oxc3r7OTRwfExYM6ROfdSPEp5DbAs=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Jun 2, 2020 at 3:25 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue,  2 Jun 2020 07:21:46 -0500
> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>
> > During the configure of the updated version there was a dependency
> > found on zlib and it tried to retrieve the archive.
> >
> >  Library z found: NO
> >  Downloading zlib source from https://zlib.net/fossils/zlib-1.2.11.tar.gz
> >  output/build/libglib2-2.64.2/meson.build:1885:4: ERROR: could not get
>
> I don't see anything in the libqmi configure.ac script that suggests a
> dependency on zlib. And these messages come from the Meson logic in
> libglib2... while libqmi uses autotools. This definitely needs more
> research to see what is going on, we can't blindly add a new dependency.
>

Oops this is because I just did "make libqmi" to build test without it
selected in kconfig which would have setup all the dependencies.  I
didn't notice libglib2 was the one with the zlib missing but that
makes sense if it was trying to build all of libqmi's dependencies
from scratch and the kconfig dependencies were never evaluated.

> > -LIBQMI_VERSION = 1.24.10
> > +LIBQMI_VERSION = 1.25.900
>
> This version is in fact 1.26-rc1, I'm not sure we want to package
> release candidate versions.

Good call, I'll adjust to 1.24.14 as it is the latest stable and
doesn't add any new features.

Regards,
Matt
