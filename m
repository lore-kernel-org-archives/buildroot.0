From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 27 Feb 2018 22:42:00 -0600
Subject: [Buildroot] [NEXT 00/26] Package CVE Reporting
In-Reply-To: <20180227223748.5c65e492@windsurf.lan>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180227223748.5c65e492@windsurf.lan>
Message-ID: <CANQCQpafq1yB+MZRhNXtuddsA0gCueLZeNosUW5zOK7OaKiGMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Feb 27, 2018 at 3:37 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Mon, 26 Feb 2018 20:10:15 -0600, Matt Weber wrote:
[snip]
> While I'm fine with the package annotations, I am not yet sure that a
> "make cpe-info" is what we want here.
>
> In particular, I'm thinking about the interaction with pkg-stats, and
> the work I've done to make pkg-stats query release-monitoring.org to
> check for new upstream versions. Ideally, pkg-stats should also query
> the CPE information and add it to its report.

Agreed, but I see that as a seperate function and a next step after
this patchset.  I see the basic report as the first step to get others
to contribute more CPE information to packages.  I'm sure others using
Buildroot have external tools they use to take the CPEs and do their
analysis.  We can passively get the benefit of those efforts finding
the CPEs which need updates util the pkg-stats is ready.  Hopefully
we'd have a pkg-stats solution in place not to long after the
reporting has been in use.

>
> For now, pkg-stats reports about all packages in Buildroot, but I'm
> hoping to improve that and make it possible for pkg-stats to only
> generate a report about the list of packages selected in the current
> Buildroot configuration.

I do agree that if the cpe-info using infra is merged, the long term
plan would be to move that to a script once the pkg-stats CPE checking
and CPE helper functions it uses exist to build a comparable CPE
report.

In general, I'd advocate for an incremental approach so some of the
benefits can start to be realized while the automation is matured.

Matt
