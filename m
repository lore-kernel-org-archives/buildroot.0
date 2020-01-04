From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 04 Jan 2020 07:56:07 +0000
Subject: [Buildroot] [Bug 12441] qt5webengine build error: asm/errno.h: No
 such file or directory
In-Reply-To: <bug-12441-163@https.bugs.busybox.net/>
References: <bug-12441-163@https.bugs.busybox.net/>
Message-ID: <bug-12441-163-ZJAE0X3iGy@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12441

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #8 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Thanks for the report and the investigation. :-)

Note: sometimes, a package will need to build its own tools
during the build (e.g. to generate a table of values), and
those tools are built with the host compiler. Hence the
error. But qt5webengine already selects BR2_HOSTARCH_NEEDS_IA32_COMPILER
when needed, so this is strange...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
