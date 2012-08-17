From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Aug 2012 16:16:26 +0000 (UTC)
Subject: [Buildroot] [Bug 5462] webkit doesn't build on directfb
In-Reply-To: <bug-5462-163@https.bugs.busybox.net/>
References: <bug-5462-163@https.bugs.busybox.net/>
Message-ID: <20120817161626.D0E9C971EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5462

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-08-17 16:16:26 UTC ---
Thanks Vincent for the report. It is similar to
http://autobuild.buildroot.net/results/74637e3a3e4c37c3af0f3662504c28332e9c586c/build-end.log.

We need to investigate if this is really Webkit that doesn't support DirectFB
as a Gtk backend. If this is the case, then we simply need to prevent Webkit
from being built if the selected Gtk backend is DirectFB.

Or it is just a bug in Webkit that shouldn't include this header file, or
should include it conditionnally or something like that.

I personaly don't have enough time right now to dig into Webkit, so if you
could have a look at this and give us your conclusions, it would be great.
Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
