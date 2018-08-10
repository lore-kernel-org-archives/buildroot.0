From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 10 Aug 2018 08:35:13 -0500
Subject: [Buildroot] [PATCH] core/legal-info: Add package dependencies
 with licenses to the manifest
In-Reply-To: <874lg2tsmp.fsf@steelpick.2x.cz>
References: <20180809170055.13334-1-sojkam1@fel.cvut.cz>
 <9f696e5a41234480bdec320f9677ee0d@ex16mbx1.ms.cvut.cz>
 <874lg2tsmp.fsf@steelpick.2x.cz>
Message-ID: <CANQCQpbbO6UAhu6MZ4uvECW6zUQTZnBPkYHUxk+piHqaoWdQMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michal,
On Fri, Aug 10, 2018 at 5:37 AM Michal Sojka <sojkam1@fel.cvut.cz> wrote:
>
> Hi Matthew,
>
> On Thu, Aug 09 2018, Matthew Weber wrote:
> > Michal,
> >
> > On Thu, Aug 9, 2018 at 12:08 PM <sojkam1@fel.cvut.cz> wrote:
> >>
> >> From: Michal Sojka <michal.sojka@cvut.cz>
> >>
> >> This adds one column to the legal-info manifest table. It contains the
> >> dependencies of the given package and their licenses. This information
> >> is useful when assessing license compatibility of the packages and
> >> their libraries.
> >>
> >> An example of the content of the new column for the MPD package is
> >> shown below:
> >>
> >>     "alsa-lib (LGPL-2.1+ (library), GPL-2.0+ (aserver)),
> >>     boost (BSL-1.0), libid3tag (GPL-2.0+), libmad (GPL-2.0+),
> >>     libzlib (Zlib), skeleton-init-common (unknown),
> >>     skeleton-init-sysv (unknown),
> >>     toolchain-external-linaro-arm (unknown), "
> >
> > This output is definitely good verbose data to look at for possible
> > licensing violations/inheritance.  Maybe it would be better show as a
> > part of the dependency graph?
>
> I was also thinking about that, but my feeling is that lawyers and
> managers prefer tables over graphs and I need this information for those
> people.

I didn't notice this initially, but this may point out that we need to
tag the license info for buildroot items (skeleton, etc) and
toolchain.  However that may not really matter as these dependencies
don't reflect actual use (linking, etc).  So how are you using this
data as it doesn't exactly reflect license interaction between those
dependent packages?

Matt
