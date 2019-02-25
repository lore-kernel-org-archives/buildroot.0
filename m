From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Feb 2019 13:49:50 +0000
Subject: [Buildroot] [Bug 9966] util-linux-2.30/.stamp_built' failed
In-Reply-To: <bug-9966-163@https.bugs.busybox.net/>
References: <bug-9966-163@https.bugs.busybox.net/>
Message-ID: <bug-9966-163-nokeAkY7lX@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9966

--- Comment #7 from Micha? Miros?aw <mirq-boogs@rere.qmqm.pl> ---
(In reply to Carlos Santos from comment #6)

I don't want to point fingers. Adding 'UTIL_LINUX_AUTORECONF = YES' line to 
package/util-linux/util-linux.mk fixes the problem.

I guess it has something to do with buildroot's makefile replacing 
config/ltmain.sh in the package but not in autotools it provides. The file 
get's replaced with unpatched version when ./configure runs autoreconf to 
update itself.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
