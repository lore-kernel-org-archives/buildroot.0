From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 07 Dec 2017 20:15:43 +0000
Subject: [Buildroot] [Bug 10536] Finding non-relative paths in the ccache
In-Reply-To: <bug-10536-163@https.bugs.busybox.net/>
References: <bug-10536-163@https.bugs.busybox.net/>
Message-ID: <bug-10536-163-3QzFTsjyNz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10536

--- Comment #2 from Trent Piepho <tpiepho@gmail.com> ---
This ends up being a big problem if multiple buildroot output directories are
used.  For example:

    make O=first some_defconfig ; make O=first all
    rm -rf first
    make O=second some_defconfig ; make O=second all

The build in second fails because ccache will use cached dependency files from
the first build, and these cached files reference headers with a "*/first/*"
path and those headers no longer exist.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
