From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 May 2018 19:38:34 +0200
Subject: [Buildroot] [PATCH 2/2] package/expect: download tarball
 instead of cvs
In-Reply-To: <20180531070520.24242-2-arnout@mind.be> (Arnout Vandecappelle's
 message of "Thu, 31 May 2018 09:05:20 +0200")
References: <20180531070520.24242-1-arnout@mind.be>
 <20180531070520.24242-2-arnout@mind.be>
Message-ID: <87fu27209x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > More than 3 years after the 5.45.3 release, a tarball for that release
 > was uploaded to sourceforge.net. The differences between this tarball
 > and the CVS checkout are minimal:

 > - There are no CVS directories, of course, but we don't need them.
 > - File timestamps are different.
 > - expect.tests is missing, but we don't execute tests anyway.
 > - configure script is different, but we AUTORECONF anyway.
 > - 'fixcat' script is missing, but it is not called anywhere.

 > Since sourceforge.net has broken CVS downloads, now is a good time to
 > switch away from it.

 > While we're at it, add a hash file including license.

 > Fixes:
 > http://autobuild.buildroot.net/results/db3/db33d4fa507fb3b4132423cd0a7e25a1fe6e4105
 > http://autobuild.buildroot.net/results/b6d/b6d927dcc73ac8d754422577dacefff4ff918a5c
 > http://autobuild.buildroot.net/results/23d/23d1034b33d0354de15de2ec4a8ccd0603e8db78
 > http://autobuild.buildroot.net/results/127/1272a3aa3077e434c9805ec3034f35e6fcc330d4

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
 > ---
 > Either this one or the previous one is sufficient to fix the issue, of
 > course. Still, I think both are relevant for master.

 > Note that there is also a 5.45.4 release from a few months ago. But I
 > don't know if anyone still uses expect :-).

 > Note that this was the last internal package to use CVS. So we no
 > longer have autobuild coverage of the cvs download method.

True, but with so few upstream projects using CVS that was bound to
happen sooner or later.

Committed, thanks.

-- 
Bye, Peter Korsgaard
