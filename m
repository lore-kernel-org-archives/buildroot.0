From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Nov 2018 10:57:24 +0000
Subject: [Buildroot] [Bug 11206] zlib: fails to build with Linaro toolchain,
 BR2_RELRO_FULL=y and BR2_FORTIFY_SOURCE_2=y
In-Reply-To: <bug-11206-163@https.bugs.busybox.net/>
References: <bug-11206-163@https.bugs.busybox.net/>
Message-ID: <bug-11206-163-qsxmL5YQjL@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11206

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I believe this has been fixed by the changes to the toolchain wrapper to make
it handle the hardening options:

394bdd11fc1f741c88c89f0e71571d87a29ab627 BR2_FORTIFY*: toolchain wrapper
limitation note
f10822d151085bcbfecd0ecf2542ac5f5623fd9d toolchain/toolchain-wrapper: add
BR2_SSP_* support
7484c1c3b8065d6f2f5a67607e9917ecfea022eb toolchain/toolchain-wrapper: add
BR2_RELRO_

-- 
You are receiving this mail because:
You are on the CC list for the bug.
