From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 14 Mar 2010 07:26:14 +0000 (UTC)
Subject: [Buildroot] [Bug 1261] The getline() in
 output/build/linux-2.6.28/scripts/unifdef.c in buildroot is buggy
In-Reply-To: <bug-1261-163@https.bugs.busybox.net/>
References: <bug-1261-163@https.bugs.busybox.net/>
Message-ID: <20100314072614.500C577615@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1261


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2010-03-14 07:26:13 UTC ---
(In reply to comment #0)

> /usr/include/stdio.h:653: note: previous declaration of ?getline? was here
> 
> How i fixed the error?
> 
> i changed the getline function in unidef.c to get_line ie. other than getline
> and it works fine.

That's a known problem in older versions of the Linux kernel when building on
new distributions. The official fix (which is included in 2.6.29+) is like you
describe (getline -> get_line).

Any reason why you want to use such an old kernel for a new project?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
