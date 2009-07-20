From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Jul 2009 20:28:09 +0000 (UTC)
Subject: [Buildroot] [Bug 473] memstat_0.5.tar.gz has install with -D and
 that fails "make" (last buildroot git)
In-Reply-To: <bug-473-163@https.bugs.busybox.net/>
References: <bug-473-163@https.bugs.busybox.net/>
Message-ID: <20090720202809.727B3777E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=473


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jacmet at uclibc.org




--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org>  2009-07-20 20:28:08 UTC ---
(In reply to comment #0)
>         /usr/bin/install -m 0644 -D
> /home/elorrain/buildroot/build_powerpc/memstat-0.5/memstat.conf
> /home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc
> /usr/bin/install: cannot overwrite directory
> `/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc' with
> non-directory

So your host install program doesn't seem to like doing install -D <file> <dir>
- What version/distribution are you using?

On my Debian machine it works:

mkdir /tmp/blah
touch /tmp/blih
install -m 0644 -D /tmp/blih /tmp/blah
ls -lah /tmp/blih
-rw-r--r-- 1 peko peko 0 2009-07-20 22:24 /tmp/blih
install --version
install (GNU coreutils) 7.4
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by David MacKenzie.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
