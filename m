From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Aug 2020 21:09:45 +0000
Subject: [Buildroot] [Bug 13166] python-rpi-gpio: does not work against
 aarch64, unintentional side-effect of gcc-10 patch
In-Reply-To: <bug-13166-163@https.bugs.busybox.net/>
References: <bug-13166-163@https.bugs.busybox.net/>
Message-ID: <bug-13166-163-UuxWu1LgK3@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13166

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to Christian Stewart from comment #1)
> I wonder, what was so bad about disabling the compiler warning?

Because duplicate symbols are a source for bugs. If we just add the -fcommon
option, this indeed hides the warning away, but the problematic code will not
get fixed, and we will have to carry that option ad libitum.

Instead, we want patches that fixes those warnings, so those patches are sent
to the corresponding upstreams, so the packages get fixed, and so we can drop
those patches in a future version bump.

So, I've had a look a deeper look at the patch now, and indeed it is not
complete... I'll follow up with a revised fix. Stay tuned to the ML.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
