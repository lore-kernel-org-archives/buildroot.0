From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 07 Jun 2018 14:07:38 +0000
Subject: [Buildroot] [Bug 9771] toolchain-external misses lib directory when
 copying sysroot
In-Reply-To: <bug-9771-163@https.bugs.busybox.net/>
References: <bug-9771-163@https.bugs.busybox.net/>
Message-ID: <bug-9771-163-yUqzuMrVmc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9771

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |patrickdepinguin at gmail.com
                   |.org                        |

--- Comment #8 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I tested with the latest Buildroot (which includes the changes Thomas DS was
mentioning in his comment), and indeed the separation of lib/ (for gcc
libraries) and lib64/ has the consequence that libgcc_s.so is not copied to
staging nor to target.

The proposal to include "lib" in the list of folders from the sysroot to copy
seems sensible to me, perhaps we should add "usr/lib" as well.

Thomas DS, any comment on this ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
