From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 12 Jan 2019 13:59:11 +0000
Subject: [Buildroot] [Bug 11616] 2018.02.09 fails to build libzlib with full
 RELRO protection
In-Reply-To: <bug-11616-163@https.bugs.busybox.net/>
References: <bug-11616-163@https.bugs.busybox.net/>
Message-ID: <bug-11616-163-CVWQdkd4YZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11616

--- Comment #5 from Matt Weber <matthew.weber@rockwellcollins.com> ---
Tho(In reply to Thomas Petazzoni from comment #4)

Oh right.  So then for this failure case it is a known issue that the ordering
of linker steps in most packages are not correct to support RELRO full.  Which
is what lead to using the toolchain wrapper to adjust ordering as the current
solution.

Karl, are you able to bump versions to 2018.11 or next month to the new LTS? 
If not I can help you find the series of commits to add to your LTS that enable
the toolchain wrapper method, however you'd have to carry your own LTS branch
locally for this to work.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
