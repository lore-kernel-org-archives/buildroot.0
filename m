From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 07 Aug 2017 13:53:30 +0000
Subject: [Buildroot] [Bug 10171] devmem2 w (word) is 8 bytes in x86 64
	systems
In-Reply-To: <bug-10171-163@https.bugs.busybox.net/>
References: <bug-10171-163@https.bugs.busybox.net/>
Message-ID: <bug-10171-163-R8IF5YafFP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10171

--- Comment #1 from Matt Weber <matthew.weber@rockwellcollins.com> ---
FYI, the busybox version of devmem is the most up to date and supports quadword
access.  This app I believe is just for backwards compatibility and there are
other address casting address issues with 32bit access on a 64bit bus (like on
the SoC FPGA ARM processors) with this tool.  Maybe a note should be added to
the package to reflect it's in a partially depreciated state?  Or we should
remove it and make it a virtual package setting the busybox option to enabled?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
