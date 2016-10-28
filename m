From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 28 Oct 2016 21:31:45 +0000
Subject: [Buildroot] [Bug 9386] ubinize fails with or without custom config
In-Reply-To: <bug-9386-163@https.bugs.busybox.net/>
References: <bug-9386-163@https.bugs.busybox.net/>
Message-ID: <bug-9386-163-hwfk1zVWc2@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9386

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gustavo at zacarias.com.ar

--- Comment #9 from Gustavo Zacarias <gustavo@zacarias.com.ar> ---
Can reproduce on fc23.

Upstream related bugs:
https://bugzilla.redhat.com/show_bug.cgi?id=1238802
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=799858

It seems the selinux context isn't picked up by fakeroot and causes trouble.
Unfortunately there seems to be no patch at this time to address this, so
running ubinize outside fakeroot looks like the only option.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
