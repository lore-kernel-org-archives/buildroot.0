From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 May 2018 19:35:24 +0200
Subject: [Buildroot] [PATCH 1/2] download/cvs: add a 10 minute timeout
In-Reply-To: <20180531070520.24242-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Thu, 31 May 2018 09:05:19 +0200")
References: <20180531070520.24242-1-arnout@mind.be>
Message-ID: <87k1rj20f7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Apparently, CVS servers can be deadlocked and in that case clients will
 > retry connecting to them indefinitely. Cfr.
 > http://autobuild.buildroot.net/results/23d/23d1034b33d0354de15de2ec4a8ccd0603e8db78/build-end.log
 > Apparently, the sf.net CVS server got in such a deadlock on 2018-05-18,
 > and almost 2 weeks later it is still not fixed.

 > Instead of just hanging, we should fall back on BR2_SECONDARY_SITE. To
 > achieve this, it's sufficient to add a timeout to the CVS command.

 > The timeout value is of course arbitrary. However, we can assume that
 > nobody will be putting large projects under CVS any more.

Tell that to the BSD people ;)

 > So if the download takes more than 5 minutes, it's probably
 > broken. Let's put the timeout at 10 minutes then.

 > Fixes:
 > http://autobuild.buildroot.net/results/db3/db33d4fa507fb3b4132423cd0a7e25a1fe6e4105
 > http://autobuild.buildroot.net/results/b6d/b6d927dcc73ac8d754422577dacefff4ff918a5c
 > http://autobuild.buildroot.net/results/23d/23d1034b33d0354de15de2ec4a8ccd0603e8db78
 > http://autobuild.buildroot.net/results/127/1272a3aa3077e434c9805ec3034f35e6fcc330d4

This is somewhat ugly - But lets indeed keep pragmatic, almost no
projects use CVS anymore.

Committed, thanks.

-- 
Bye, Peter Korsgaard
