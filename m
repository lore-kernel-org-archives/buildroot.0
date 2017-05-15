From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 14:43:39 +0200
Subject: [Buildroot] [PATCH 2/3] bluez_utils: add missing check
	dependency for test program
In-Reply-To: <20170514160551.68cc2329@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 14 May 2017 16:05:51 +0200")
References: <20170513171009.5219-1-romain.naour@gmail.com>
 <20170513171009.5219-2-romain.naour@gmail.com>
 <20170513202845.GB15337@scaer>
 <20170514160551.68cc2329@free-electrons.com>
Message-ID: <87shk6guis.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sat, 13 May 2017 22:28:45 +0200, Yann E. MORIN wrote:

 >> On 2017-05-13 19:10 +0200, Romain Naour spake thusly:
 >> > Tests are enabled since this has been introduced [1], so keep
 >> > them for now.  
 >> 
 >> Why don't you want to simply disable tests altogehter, especially since
 >> there is an option for that:
 >> 
 >> --disable-test
 >> 
 >> And if we disable tests, then we do not need patch 3/3.

 > In bluez_utils, "tests" apparently a good number of tools that are not
 > really tests, and might be needed on the target. I'll let Yegor answer
 > on this though, but in the mean time, I believe it's better to fix
 > things rather than changing the set of available tools on the target,
 > which is why I've applied Romain's patch.

:/

It looks to be a bit of a mess. The only thing that gets linked with
libcheck (check is a library, not a program) is unit/test-eir, which
doesn't even get installed.

But oh well, it is indeed safer to keep it enabled.

-- 
Bye, Peter Korsgaard
