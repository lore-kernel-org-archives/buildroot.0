From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 8 Oct 2014 13:56:56 +0200
Subject: [Buildroot] Topics to discuss at the meeting
In-Reply-To: <20141008105653.7252facd@free-electrons.com>
References: <20141008105653.7252facd@free-electrons.com>
Message-ID: <CAAXf6LVHz0qp3VsyAFRhrkH6ekaQ-evzJeoaYSZ+oCkg0cuTWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Oct 8, 2014 at 10:56 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> The meeting is approaching, so to foster some preliminary discussion,
> here is the current list of topics we have in the Wiki:
>
>  - Look-back to action points from previous developer days at Fosdem
>    2014: is everything that was decided done? What remains?
>
>  - Patch naming: current convention is
>    package-number-description.patch, but a proposal was made on the
>    list to simplify this to number-description.patch. Go or no-go?
>
>  - Since Luca will be present: state of legal-info infrastructure,
>    improvements to be made?
>
>    - Could more details be added here (by Thomas DS, who proposed the
>      topic)

I thought, with Luca being present again after a few years, it would
be a good idea to briefly see what may need to be improved / added to
the legal-info infrastructure. Is there anything missing,
feature-wise?

There was a proposal to add the site URL to the manifest, but this has
been merged meanwhile.
We could consider improving the handling of the currently unhandled
parts, like toolchain, buildroot itself, ...

For toolchain, even if it is difficult to save the sources, we could
consider identifying the packages contained in the toolchain, like
which C library, compiler, etc. and provide version and license for
each of them. This info could then be collected in the manifest as
well. This should include info on the target files, like libstdc++,
libgcc, ...

Also, to me it would make sense to place the code related to
legal-info in one file, like legal-info.mk. Currently there are parts
in Makefile, pkg-utils.mk and pkg-generic.mk. While pkg-generic can
stay as it is, the lines from Makefile and pkg-utils.mk could be
extracted to a single, separate file IMO.

Looking at the package stats:
Packages having license information 1298
Packages not having licence information 73
Packages having license files information 1219
Packages not having licence files information 152

So at that level we're pretty good, but ideally we can get these
second and fourth counters to 0.


Best regards,
Thomas
