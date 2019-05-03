From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 May 2019 18:44:05 +0000
Subject: [Buildroot] [Bug 11836] Embedded Shell Scripts in BusyBox
In-Reply-To: <bug-11836-163@https.bugs.busybox.net/>
References: <bug-11836-163@https.bugs.busybox.net/>
Message-ID: <bug-11836-163-OLfw0lysjs@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11836

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Max, All,

> Beside the benefit of additional free space on the target filesystem (due
> to the compression of the scripts),

As I said: if you are really concerned about the size of the scripts that
you need them to be compressed, you will probably better benefit from a
compressed filesystem to begin with, like squashfs, which would compress
everything, from busybox itself, to the libraries it uses like libc et al.
to all the files on the systems, and not just the few scripts that are
embedded in the busybox binary.

Honestly, I doubt embedding the scripts in the busybox binary wins over
having a squashfs, but I'd like to see numbers.

> another advantage is that it is not necessary to take care about script
> file permissions (there is no need to set execute-permissions when the
> scripts are embedded into the BusyBox binary).

If you can't track the executable bit on your scripts, you have a big
problem in your tooling and/or process and/or build environment.

Again, I am not opposed to having support for embedded scripts, but I'd
like to see a *convincing* argument...

BTW, this is not a bug, but an enhancement request. We usually take new
features as patches sent to the mailing list, so I'm closing this bug.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
