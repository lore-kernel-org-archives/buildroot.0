From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Jan 2020 12:08:20 +0000
Subject: [Buildroot] [Bug 12481] minicom fails when output directory path
 contains "m4"
In-Reply-To: <bug-12481-163@https.bugs.busybox.net/>
References: <bug-12481-163@https.bugs.busybox.net/>
Message-ID: <bug-12481-163-hsfSbLFGV4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12481

--- Comment #3 from Arnout Vandecappelle <arnout@mind.be> ---
It seems to be caused by host-gettext-tiny, which installs stuff in the wrong
directory, so the relevant m4 files can't be found.

I've done a quick check and found no upstream commits or PRs or issues that
seem relevant.

This one looks funny:

gettext-gnu/gettext-tools/misc/autopoint.in:    m4/ ) destfile=`echo "$1" | sed
-e "s,^m4/,$m4dir/,"` ;;

-- 
You are receiving this mail because:
You are on the CC list for the bug.
