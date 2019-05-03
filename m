From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 May 2019 15:09:04 +0000
Subject: [Buildroot] [Bug 11836] Embedded Shell Scripts in BusyBox
In-Reply-To: <bug-11836-163@https.bugs.busybox.net/>
References: <bug-11836-163@https.bugs.busybox.net/>
Message-ID: <bug-11836-163-hhA10Latug@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11836

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Max, All,

> It would be great to be able to use [embedded scripts]

What is the advantage over having the scripts installed in /bin or /usr/bin
instead? If you are concerned about space that much that you want to take
advantage of busybox' compression of the scripts, you would anyway consider
a compressed filesystem like squashfs anyway, so the space gain would
probably be ridiculous.

> there is no configuration option in buildroot [for that]

Indeed no, but it should not be overly complex to add. Yet, I'd like to
see a good explanations why that would be better than to have the scripts
in the filesystem instead.

Regards,
Yann E. MORIN.

PS. Yes, support for embedded scripts is enabled in a default build, but
that's an accident: our busybox .config was created before embedded scripts
were a thing, so they are not explicitly disabled in our .config, and since
the default for them in busybox is 'y', we end up with a buysbox that has
support for embedded script (but no such script).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
