From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 25 Aug 2020 14:30:28 +0000
Subject: [Buildroot] [Bug 13141] Target-finalize fail with "depmod: ERROR:
 Bad version passed"
In-Reply-To: <bug-13141-163@https.bugs.busybox.net/>
References: <bug-13141-163@https.bugs.busybox.net/>
Message-ID: <bug-13141-163-bNcJT6zjuA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13141

--- Comment #6 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Laurent, Asaf, All,

So I was initially not able to reproduce the issue, because my umask was
0002, which is not the umask Buildroot expects to work with. In this
situation, Buildroot respawns itself with a proper umask:

    https://git.buildroot.org/buildroot/tree/Makefile#n76

When I set a proper umask 0022, then I can indeed reproduce the issue,
but only in Ubuntu 18.04!

Still more investigations required...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
