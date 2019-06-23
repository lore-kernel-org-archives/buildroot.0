From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 22:08:59 +0200
Subject: [Buildroot] [PATCH] Allow overriding the VCS exclude list with
 *_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS
In-Reply-To: <0c1450782e9b2f0a44af5ab18ccfda69d385f900.1560158856.git.jan.kundrat@cesnet.cz>
 ("Jan =?utf-8?Q?Kundr=C3=A1t=22's?= message of "Mon, 10 Jun 2019 11:27:16
 +0200")
References: <0c1450782e9b2f0a44af5ab18ccfda69d385f900.1560158856.git.jan.kundrat@cesnet.cz>
Message-ID: <87mui8cbdw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jan" == Jan Kundr?t <jan.kundrat@cesnet.cz> writes:

 > We have some internal packages which automatically bake a version string
 > from the git checkout, and we usually combine these with a
 > *_OVERRIDE_SRCDIR. I would like to let Buildroot *not* skip the .git
 > directory when picking up sources from the local checkout.  It turns out
 > that the existing mechanism (*_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS) only
 > supports adding to the exclude list because `rsync` simply uses the
 > first match from the provided filtering rules.

 > Solve this by using the user-provided values first. If they match, then
 > `rsync` won't exclude stuff based on the generic VCS exclude patterns.

 > Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
