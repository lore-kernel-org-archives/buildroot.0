From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 09:43:00 +0200
Subject: [Buildroot] RFC: CVE analysis
In-Reply-To: <CANQCQpZBHb4kSvP2FRgLEzAE+LmUxaLaE5-C+PCytUUGDzBLnQ@mail.gmail.com>
References: <CANQCQpbSu1OUHvivMbQFGC3x6GPSWA3imp2GqGMjeqmYZKBstw@mail.gmail.com>
 <542088A8.2080902@zacarias.com.ar>
 <CANQCQpZBHb4kSvP2FRgLEzAE+LmUxaLaE5-C+PCytUUGDzBLnQ@mail.gmail.com>
Message-ID: <20140923094300.01862ed4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Weber,

On Mon, 22 Sep 2014 16:12:56 -0500, Matthew Weber wrote:

> >> I was curious if anyone has done a script similar to the "make
> >> legal-info" that takes a package list and checks it against a CVE
> >> database?  We're looking at doing some automated tracking of
> >> vulnerabilities with our nightly builds and were at a point of putting
> >> something together.

Seems really interesting.

> Would it be worth using this also to document if a package needs
> updating but hasn't been updated.  Then this could be queried as part
> of the build (make cve-info) to generate a summary instead of a
> Internet CVE database query.  It would require some automation work to
> generate a patch to the list to append to that file that a new CVE was
> issued against it though.....  guessing doing that manually isn't
> realistic.

It's probably worth mentioning
http://patchwork.ozlabs.org/patch/337267/: it's a Python script that
checks whether a package has new versions available. It's not written
with security/CVEs in mind, but you might find it interesting, and
maybe plug some more security/CVEs oriented checks in there.

That's a script we need to review/test and then commit, as I believe it
would be very useful to have. The aim is to use it as a replacement of
support/scripts/pkg-stats, whose output is updated every day at
http://autobuild.buildroot.org/stats/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
