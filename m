From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 21:14:25 +0100
Subject: [Buildroot] [PATCH] python-config.sh: don't reassign ${prefix}
In-Reply-To: <20171018165523.13145-1-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Wed, 18 Oct 2017 11:55:23 -0500")
References: <20171018165523.13145-1-matthew.weber@rockwellcollins.com>
Message-ID: <87a7z8iyqm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > When prefix is set to a path like /usr during crossbuild
 > the sed operations end up executing twice, once for the prefix
 > reassignment and another for includedir if it is set as a string
 > including the ${prefix} variable.  This results in an issue
 > when building on a machine that mounts local storage under /usr.

 > This patch updates the remaining location which uses the prefix
 > variable to also sed and update to use the real path.

 > Upstream bug report:
 > https://bugs.python.org/issue31713

 > Buildroot bug:
 > https://bugs.busybox.net/show_bug.cgi?id=10361

 > Fixes failures like the following:
 > python-gobject-2.28.6 | NOK |
 > http://autobuild.buildroot.net/results/ac6cf59125ba57402f926e6c65ffe19e065001b5
 > dbus-python-1.2.4 | NOK |
 > http://autobuild.buildroot.net/results/0d1459155ab6ad2e126e0845ecf6ba2f9381ec8b

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
