From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 23 Jul 2012 03:43:19 +0000 (UTC)
Subject: [Buildroot] [Bug 5384] Can't build packages relying on gets on
	newer glibc
In-Reply-To: <bug-5384-163@https.bugs.busybox.net/>
References: <bug-5384-163@https.bugs.busybox.net/>
Message-ID: <20120723034319.3AB0596DAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5384

--- Comment #1 from Samuel Martin <s.martin49@gmail.com> 2012-07-23 03:43:18 UTC ---
(In reply to comment #0)
> On newer versions of glibc, gets is no longer included so host packages relying
> on it will not compile properly.
> 
> Patches:
> https://raw.github.com/OpenELEC/OpenELEC.tv/f7f4d70fd78621137745a2c5e08b10685dfc84b7/packages/toolchain/devel/autotools/m4/patches/m4-1.4.16-fgets.patch
> https://raw.github.com/OpenELEC/OpenELEC.tv/3b2e87a6955627c122588bc4963b7aae5150c095/packages/toolchain/archivers/cpio/patches/cpio-2.11-fgets.patch
> https://raw.github.com/OpenELEC/OpenELEC.tv/e2c5feecdb2cfd6e343a6a152612f6fcf3aae8e9/packages/toolchain/devel/autotools/gettext/patches/gettext-0.18.1.1-gets.patch

Yes, for now, AFAIK only glibc-2.16 has removed 'gets'.

For m4, a patch fixing this has already been merged: [1].

For cpio and gettext on the host system, Buildroot relies on the package
provided by the host distribution.
So, if you are experiencing issues with these packages, this should be more
likely reported to the maintainers of the distribution you're using.

BTW, do you know from where does the definition of HAVE_RAW_DECL_GETS come
from?
Grepping it in /usr/include of systems using glibc-2.15, glibc-2.16 and
eglibc-2.15 gives no result.

Thx for the report.

[1]
http://git.buildroot.net/buildroot/commit/?id=600375d18e6ccd08505153863666f2e8b10251be

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
