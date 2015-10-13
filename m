From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 13 Oct 2015 08:06:20 +0000 (UTC)
Subject: [Buildroot] [Bug 8396] CCACHE initialization
In-Reply-To: <bug-8396-163@https.bugs.busybox.net/>
References: <bug-8396-163@https.bugs.busybox.net/>
Message-ID: <20151013080620.A126081E72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8396

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-10-13 08:06:20 UTC ---
Thanks for your bug report.

However, your patch is incorrect: we don't want to use /usr/bin/ccache, but the
ccache that Buildroot builds in $(HOST_DIR). So the current code is perfectly
correct.

HOST_DIR is defined in the main Makefile:

HOST_DIR := $(BASE_DIR)/host

If you have an issue with the ccache support, could you instead report 1/ the
Buildroot configuration you've used and 2/ the last ~100 lines of build output.
This way we can see if there is indeed something broken in Buildroot or some
other issue.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
