From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 20 Oct 2018 18:46:36 +0000
Subject: [Buildroot] [Bug 11411] check-uniq-files issue
In-Reply-To: <bug-11411-163@https.bugs.busybox.net/>
References: <bug-11411-163@https.bugs.busybox.net/>
Message-ID: <bug-11411-163-pn3S8JkzE6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11411

--- Comment #3 from Arnout Vandecappelle <arnout@mind.be> ---
The originally reported problem actually only occurs when you do a
package-reinstall. Not really the most important use case I'd say. If you do a
package rebuild, it works correctly.

For the *.la files, the problem indeed occurs, but it already occurs on the
first run. Indeed, after every package, we fix up the .la files, and even if
they are not really modified, their timestamp is updated. So that really has to
be fixed. However, a better fix is to not update all the .la files, but only
the .la files really touched by that package.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
