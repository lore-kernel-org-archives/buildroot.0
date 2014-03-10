From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Mar 2014 13:12:21 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-03-07
In-Reply-To: <531D5F01.8080106@mind.be> (Arnout Vandecappelle's message of
 "Mon, 10 Mar 2014 07:43:13 +0100")
References: <20140308073007.50AAF1016F2@stock.ovh.net>
 <20140308110454.GA3254@free.fr> <20140308150515.467d5568@skate>
 <531D5F01.8080106@mind.be>
Message-ID: <87y50is15m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  Maybe the timeout can be made to depend on the number of packages
 > selected in the .config? Like 5 minutes per package (and a minimum of
 > 1 hour)?

 >  Or you could add an hour to the timeout if Webkit is selected...

Does the build often get stuck? I don't recall seing it more than a few
times on "my" builders. In my (simplistic) autobuilder script I simply
do:

# ensure machine isn't DOS'ed
ulimit -S -t 4000 -v 2000000

E.G. limit memory and cpu time

-- 
Bye, Peter Korsgaard
