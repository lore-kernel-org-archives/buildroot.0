From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Apr 2017 20:15:55 +0000
Subject: [Buildroot] [Bug 9826] post-build scritp - symlinks created in
 post-build script are overwritten after exit of the script
In-Reply-To: <bug-9826-163@https.bugs.busybox.net/>
References: <bug-9826-163@https.bugs.busybox.net/>
Message-ID: <bug-9826-163-7hCgDspVAc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9826

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Timo,

This is (somewhat) expected. When creating the filsystem images,
there is a part creating the passwd, groups and shadow (and possibly,
gshadow) files from the setting in Buildroot.

This will forcibly create files (AFAIR).

So, what you want to provide is probably a "fakeroot" script. This
will be called after the passwd, group and shadow files are created,
but before the images are assembled.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
