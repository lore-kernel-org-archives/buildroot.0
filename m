From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Jun 2017 16:39:54 +0000
Subject: [Buildroot] [Bug 9941] nodejs option disappears for arm
In-Reply-To: <bug-9941-163@https.bugs.busybox.net/>
References: <bug-9941-163@https.bugs.busybox.net/>
Message-ID: <bug-9941-163-PbU3MjqYHc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9941

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |INVALID
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #7 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Refik, All,

nodejs requires an FPU (VFP), but it is not enabled
in your Buildroot configuration.

So, if your CPU indeed lacks a VFP, then you can not
use nodejs on your target.

If your CPU does have a VFP, then enable it in your
Buildroot configuration.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
