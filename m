From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Mar 2018 23:39:20 +0100
Subject: [Buildroot] [PATCH 2/2] core/instrumentation: shave minutes off
 the build time
In-Reply-To: <20180322175035.2410072a@windsurf> (Thomas Petazzoni's message of
 "Thu, 22 Mar 2018 17:50:35 +0100")
References: <cover.1521146096.git.yann.morin.1998@free.fr>
 <6a793a6dba4f052ca8bbc35edd63df601f46478b.1521146096.git.yann.morin.1998@free.fr>
 <87muz5fp2n.fsf@dell.be.48ers.dk> <20180318161530.GA2478@scaer>
 <87efkhfimu.fsf@dell.be.48ers.dk> <20180322164144.GY14461@australia>
 <20180322175035.2410072a@windsurf>
Message-ID: <87sh8r68h3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > These are all valid concerns, but what do you suggest ?

 > The current approach of hashing all files clearly doesn't scale, as a
 > significant amount of build time is now spent on hashing files.

Indeed. If the choice is between huge overhead vs potentially minor
inaccuracies in these list, then I think the choice is made fast, even
though the inaccuracies aren't nice - Especially if we have a plan for
fixing the the inaccuracies going forward (E.G. toplevel parallel
builds).

-- 
Bye, Peter Korsgaard
