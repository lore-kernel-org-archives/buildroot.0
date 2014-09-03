From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Sep 2014 09:24:25 +0000 (UTC)
Subject: [Buildroot] [Bug 7352] [2014.08-rc3] diffutils-3.3 failed on
	building
In-Reply-To: <bug-7352-163@https.bugs.busybox.net/>
References: <bug-7352-163@https.bugs.busybox.net/>
Message-ID: <20140903092425.52A149D5DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7352

--- Comment #4 from joymarquis at hotmail.com 2014-09-03 09:24:25 UTC ---
Hi Thomas,

The problem is root caused with the debug method you mentioned:
 * this is a user environment setting problem instead of buildroot issue.
 * the "S" variable in Makefile is overridden by the command alias "alias
make='make S=-s'".

Problem disappeared after manually execute "unalias make" and run make again.

Sorry for taking your time helping to rebuild the source code.
And really appreciate for your help on this false alarm.


Background for how it happen:
The alias "alias make='make S=-s'" was preset in /etc/bash.bashrc for most of
our Linux box, I was told by admin that this is required by internal project
build.


Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
