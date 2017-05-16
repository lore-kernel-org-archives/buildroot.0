From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 May 2017 17:42:45 +0000
Subject: [Buildroot] [Bug 9866] BASE_DIR usage
In-Reply-To: <bug-9866-163@https.bugs.busybox.net/>
References: <bug-9866-163@https.bugs.busybox.net/>
Message-ID: <bug-9866-163-rXTLwmNTiP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9866

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Try with something like:

    make -C "$(dirname "${BR2_CONFIG}")" printvars

Ideally, we would export CNFIG_DIR (which is exactly the directory
you get above), but CONFIG_DIR clashes with various buildsystems,
like (IIRC) U-Boot...

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
