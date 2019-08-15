From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Aug 2019 13:25:34 +0000
Subject: [Buildroot] [Bug 11931] Bugs in support/scripts/apply-patches.sh
In-Reply-To: <bug-11931-163@https.bugs.busybox.net/>
References: <bug-11931-163@https.bugs.busybox.net/>
Message-ID: <bug-11931-163-6w9qWyN0nz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11931

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for the bug report! We do not want to rely on the patch version though.
Indeed, what if someone that has a patch > = 2.7 on his machine adds a patch
using renames to Buildroot, which gets committed, and then this Buildroot gets
used by someone having a patch < 2.7 on his machine ? The build will break. So
clearly, we should not make it behave differently depending on the patch
version.

The uncompression part is correct though. Would you mind submitting it as a
proper patch to the Buildroot mailing list, with a commit log and
Signed-off-by, so that we can apply it ? Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
