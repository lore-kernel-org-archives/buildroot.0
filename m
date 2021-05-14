From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 May 2021 17:59:13 +0000
Subject: [Buildroot] [Bug 13806] Building host-localedef fails on fedora
 34/gcc 11
In-Reply-To: <bug-13806-163@https.bugs.busybox.net/>
References: <bug-13806-163@https.bugs.busybox.net/>
Message-ID: <bug-13806-163-F04F1AK3eQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13806

--- Comment #2 from Peter Seiderer <ps.report@gmx.net> ---
Seems the problem is fixed upstream with the following two patches:

- Fix GCC 11 -Warray-parameter warning for __sigsetjmp (bug 26647) [1]

- Avoid -Wstringop-overflow warning in pthread_cleanup_push macros [2]

Can you test the following buildroot patch (backporting thr two commits for the
localedef package)?

https://patchwork.ozlabs.org/project/buildroot/patch/20210514175429.20552-1-ps.report at gmx.net/

[1]
https://github.com/bminor/glibc/commit/19302b27bdacfe87e861ff46fc0fbad60dd6602d

[2]
https://github.com/bminor/glibc/commit/548f467fa14ffe7d955beeb31b30e2aeae4467e0

-- 
You are receiving this mail because:
You are on the CC list for the bug.
