From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 07 Jun 2017 12:28:37 +0000
Subject: [Buildroot] [Bug 9941] nodejs option disappears for arm
In-Reply-To: <bug-9941-163@https.bugs.busybox.net/>
References: <bug-9941-163@https.bugs.busybox.net/>
Message-ID: <bug-9941-163-Nei9UumY1m@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9941

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
With ARM I take it that you specifically mean one of the older ARM variants
(arm926t or similar)? Modern versions of nodejs require instructions only
available on ARMv6 + FPU or newer. In 2016.11 we still supported the legacy
0.10.x version of nodejs for the older ARM variants, but this is no longer
supported by nodejs upstream and got removed from Buildroot back in March.

If your system really has such an old ARM variant then you cannot use nodejs,
unless you re-add the (unsupported) 0.10.x version or stick with with our
current LTS release (2017.02.x)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
