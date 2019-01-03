From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Jan 2019 21:33:16 +0100
Subject: [Buildroot] [PATCH v5] support/scripts/pkg-stats: add latest
 upstream version information
In-Reply-To: <CA+fik52n+izpqRGSSP1QFMoPCCd1y0Mub714-1cHWFYotXuhNg@mail.gmail.com>
References: <20190103083818.19702-1-thomas.petazzoni@bootlin.com>
 <CA+fik52n+izpqRGSSP1QFMoPCCd1y0Mub714-1cHWFYotXuhNg@mail.gmail.com>
Message-ID: <20190103213316.637c464b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Brandon,

Thanks for the feedback.

On Thu, 3 Jan 2019 13:57:46 -0600, Brandon Maier wrote:

> From https://bootlin.com/~thomas/stats.html, there's a few packages
> that are up-to-date, but get marked "version-needs-update" because
> either the Buildroot or release-monitoring version string starts with
> a "v". For example, the vmtouch and libmodbus packages. It would be
> nice to change the version comparison to ignore a leading "v". E.g.
> 
> def version_uptodate(pkg):
>     latest = remove_prefix(pkg.latest_version[1], 'v')
>     current = remove_prefix(pkg.current_version, 'v')
>     return latest == current

I'm aware of this problem, but I'm not sure we should handle this with
a hack in the pkg-stats script itself. Indeed sometimes the version
prefix is just "v", but sometimes it's the entire name of the package,
sometimes something slightly different.

Back when I initially started working on this script, I had a series
that changed all the packages that used vX.Y.Z as a version to use just
X.Y.Z, and similarly for other packages in similar but slightly
different situations. I found (with some effort) the old branch I had
with those changes:

  https://git.bootlin.com/users/thomas-petazzoni/buildroot/log/?h=fix-versions

It seems like I never posted them. I thought there was some discussion
on the list about this issue, but I can't find it. Perhaps I should
update this series, submit it for good, and see what the feedback is ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
