From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Feb 2018 22:37:48 +0100
Subject: [Buildroot] [NEXT 00/26] Package CVE Reporting
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180227223748.5c65e492@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Feb 2018 20:10:15 -0600, Matt Weber wrote:
> This series adds new infrastructure to report
> a packages CPE identifier in a similar way
> that the legal info is currently reported.
> 
> The addition of CPE IDs to the packages is a
> manual process, but in a later patchset
> additions are planned to the pkg-stats script
> to automate maintenance the process.

Thanks for working on this and coming up with a proposal!

While I'm fine with the package annotations, I am not yet sure that a
"make cpe-info" is what we want here.

In particular, I'm thinking about the interaction with pkg-stats, and
the work I've done to make pkg-stats query release-monitoring.org to
check for new upstream versions. Ideally, pkg-stats should also query
the CPE information and add it to its report.

For now, pkg-stats reports about all packages in Buildroot, but I'm
hoping to improve that and make it possible for pkg-stats to only
generate a report about the list of packages selected in the current
Buildroot configuration.

So I don't have a very clear cut answer, but I see some overlap between
cpe-info and pkg-stats, and I'd like to have a common view on what is
the mid/long-term direction we want to take.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
