From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Nov 2018 10:10:24 +0000
Subject: [Buildroot] [Bug 11321] Latest master fails to build readline with
 RELRO FULL
In-Reply-To: <bug-11321-163@https.bugs.busybox.net/>
References: <bug-11321-163@https.bugs.busybox.net/>
Message-ID: <bug-11321-163-j0P7NzHxGp@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11321

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This is fixed by the patches from Matt that add hardening awareness in the
toolchain wrapper, and which have been merged in master as of:

394bdd11fc1f741c88c89f0e71571d87a29ab627 BR2_FORTIFY*: toolchain wrapper
limitation note
f10822d151085bcbfecd0ecf2542ac5f5623fd9d toolchain/toolchain-wrapper: add
BR2_SSP_* support
7484c1c3b8065d6f2f5a67607e9917ecfea022eb toolchain/toolchain-wrapper: add
BR2_RELRO_

-- 
You are receiving this mail because:
You are on the CC list for the bug.
