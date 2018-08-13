From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Aug 2018 08:40:04 -0500
Subject: [Buildroot] [PATCH v2] core/legal-info: Add package
 dependencies with licenses to the manifest
In-Reply-To: <20180812142202.GF2402@scaer>
References: <20180810140322.2748-1-sojkam1@fel.cvut.cz>
 <20180812142202.GF2402@scaer>
Message-ID: <CANQCQpZs=342ftV_tVf7LxB9weMyhFxpqdB_QkX7Li1Le4v47A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,
On Sun, Aug 12, 2018 at 9:22 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Michal, All,
>
> On 2018-08-10 16:03 +0200, sojkam1 at fel.cvut.cz spake thusly:
> > From: Michal Sojka <sojka@merica.cz>
> >
> > This adds one column to the legal-info manifest table. It contains the
> > dependencies of the given package and their licenses. This information
> > is useful when assessing license compatibility of the packages and
> > their libraries.
> >
> > An example of the content of the new column for the MPD package is
> > shown below:
> >
> >     "alsa-lib [LGPL-2.1+ (library), GPL-2.0+ (aserver)], boost
> >     [BSL-1.0], libid3tag [GPL-2.0+], libmad [GPL-2.0+], libogg
> >     [BSD-3-Clause], libvorbis [BSD-3-Clause], libzlib [Zlib],
> >     skeleton-init-common [unknown], skeleton-init-sysv [unknown],
> >     sqlite [Public domain], toolchain-external-linaro-arm [unknown], "
>
> I believe this is a very good addition to the manifest. Good idea! :-)
>
> The trailing comma is ugly, though. I would just drop the coma
> altogether...
>
> And here, I have two spaces between each packages:
>
>     "alsa-lib [LGPL-2.1+ (library), GPL-2.0+ (aserver)],  boost
>     [BSL-1.0],  libid3tag [GPL-2.0+],  libmad [GPL-2.0+],  [...]"
>
> > Signed-off-by: Michal Sojka <sojka@merica.cz>
> > ---
> > Changes against v1:
> > * switched parameters of legal-manifest (added one is the last)
>
> Actually, I disagree with that one: it is OK that new parameters be
> added before the last, especially since the 'legal-manifest' macro
> would be easier to review, see below...

If we change the format of the legal info csv, is there someway we
could determine version of that file's syntax?  I assume worst case we
can parse out the first line and see the additional dependencies
entry?

I'm concerned about external tools impact to changing this file's
format.   I'm sure there are others that use this file for CVE
analysis and legal reporting.

Matt
