From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2016 16:42:02 +0100
Subject: [Buildroot] [PATCH] procps-ng: remove the remaining busybox
	symlinks
In-Reply-To: <20160113163308.03661753@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 13 Jan 2016 16:33:08 +0100")
References: <1452608581-9742-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160112211220.2b7c24bb@free-electrons.com>
 <20160112202045.GA3463@free.fr> <8760yy8r7b.fsf@dell.be.48ers.dk>
 <56966CB2.5030702@imgtec.com>
 <20160113163308.03661753@free-electrons.com>
Message-ID: <87k2nd5vw5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Vicente,
 > On Wed, 13 Jan 2016 15:26:42 +0000, Vicente Olivert Riera wrote:

 >> So, I see three options here:
 >> 
 >> 1 - follow the second suggestion from Thomas (post-install hook to move
 >> the ALL binaries installed by the package to where Busybox installs them)
 >> 
 >> 2 - same thing but only move pidof and watch binaries
 >> 
 >> 3 - remove /bin/pidof and /bin/watch symlinks installed by Busybox
 >> 
 >> I happy with any of them, so, which one do you prefer?

 > I think my personal preference would be to install as many procps-ng
 > tools as possible in the "right" place, and then only move the few ones
 > for which you can't configure the installation location.

Indeed, me too. I don't think we want more than 1 of the "same" binary
on a system, and E.G. have scripts behave differently if they call the
tools without specifying any path or hardcoding /bin/<tool>.

 > On a side note, it would be interesting to write a tool that looks if
 > there are two binaries in bin/, sbin/, usr/bin/ and usr/sbin/ with the
 > same name, in order to automatically detect at the end of the build if
 > we have two commands (one full implementation and one from Busybox)
 > that are installed in different locations.

Yes, that could be a nice check.

-- 
Venlig hilsen,
Peter Korsgaard 
