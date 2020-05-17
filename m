From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 May 2020 20:39:03 +0000
Subject: [Buildroot] [Bug 12681] Mongodb fails to build from sources
In-Reply-To: <bug-12681-163@https.bugs.busybox.net/>
References: <bug-12681-163@https.bugs.busybox.net/>
Message-ID: <bug-12681-163-DtCUM0WET6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12681

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
So, this issue has been fixed by the bump of Mongodb to 4.2.4 in commit
fdd30c7daaf384eb31a767f691b0acbbe84f3d49, which will be part of Buildroot
2020.05. However, it is not great to have this failing on 2020.02.

However, MongoDB 4.2.4 still doesn't have the include <cxxabi.h>, and the build
no longer fails.

The yaml-cpp issue has been fixed in master with commit
4f2ba910b519a195622ccc56a8fe6c04995524e7.

Interestingly, mongodb seems to no longer fails on the 2020.02.x branch since
April 24.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
