From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Aug 2019 18:32:22 +0000
Subject: [Buildroot] [Bug 9771] toolchain-external misses lib directory when
 copying sysroot
In-Reply-To: <bug-9771-163@https.bugs.busybox.net/>
References: <bug-9771-163@https.bugs.busybox.net/>
Message-ID: <bug-9771-163-D0yeLoeSRL@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9771

--- Comment #10 from Thomas De Schampheleire <patrickdepinguin@gmail.com> ---
Sorry, it seems I never saw comment #8.

Copying the entire 'lib' from the external toolchain's sysroot into
staging/target will copy too much for some multilib toolchains, e.g. similar to
the octeon toolchain described in http://patchwork.ozlabs.org/patch/725387/ but
with 'lib/octeon2' instead of 'lib32/octeon2'. I think there are also other
toolchains where this will be a problem.

So, if the original problem is still an issue with current Buildroot and
reasonably recent toolchains, then I think a better solution should be found.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
