From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 12 Jan 2017 20:12:55 +0000
Subject: [Buildroot] [Bug 9576] External tree with BR 2016.11 does not work
	anymore
In-Reply-To: <bug-9576-163@https.bugs.busybox.net/>
References: <bug-9576-163@https.bugs.busybox.net/>
Message-ID: <bug-9576-163-J9Im98uwh6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9576

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |yann.morin.1998 at free.fr
                   |.org                        |
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Hello,

OK, I could reproduce the issue on a minimal br2-external tree.
I'll investigate.

In the meantime, you can workaround this problem by using an absolute
path to your br2-external tree:

    $ make BR2_EXTERNAL=$(cd ..; pwd) O=output/my-output my_defconfig

Thanks for the report!

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
