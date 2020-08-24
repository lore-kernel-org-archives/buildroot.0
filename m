From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Aug 2020 05:00:48 +0000
Subject: [Buildroot] [Bug 13141] Target-finalize fail with "depmod: ERROR:
 Bad version passed"
In-Reply-To: <bug-13141-163@https.bugs.busybox.net/>
References: <bug-13141-163@https.bugs.busybox.net/>
Message-ID: <bug-13141-163-sVtOup8PXI@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13141

--- Comment #2 from Asaf Kahlon <asafka7@gmail.com> ---
(In reply to laurent from comment #0)

I encountered the same error few weeks ago.
I don't know if we're having the same case, but here are the results of my
little research:

1. I didn't run the 'make' command from Buildroot, I had something like: "make
-j8 -C buildroot/". If I run the `make` command directly from Buildroot, it
works fine.
* It always happens with compiling in parallel, doesn't matter whether it's -j2
or -j100. When I compiled with just make, it worked.
* It fails only on the first time! After the error occurred, I run "make -j8 -C
buildroot/" *again* and it worked.

Are those points relevant to your case?

Regards,
Asaf.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
