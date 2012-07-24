From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 24 Jul 2012 12:46:38 +0000 (UTC)
Subject: [Buildroot] [Bug 5396] Boot hangs when starting samba if
 BR2_ENABLE_LOCALE is enabled
In-Reply-To: <bug-5396-163@https.bugs.busybox.net/>
References: <bug-5396-163@https.bugs.busybox.net/>
Message-ID: <20120724124638.0718481EDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5396

--- Comment #3 from Jonathan Liu <net147@gmail.com> 2012-07-24 12:46:37 UTC ---
(In reply to comment #2)
> I haven't looked in details, but I think the fix will probably have to have
> some special casing depending on whether the toolchain uses uClibc or (e)glibc.
> Those C libraries already have iconv support, but maybe the iconv
> implementation of uClibc isn't capable enough. But in the case of (e)glibc, I
> don't think the separate libiconv is needed.
> 
> So clearly, a proper fix will need investigation and testing for both uClibc
> and glibc toolchains.

How about we use --with-libiconv= if BR2_TOOLCHAIN_BUILDROOT=y since we know it
is not working in that case?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
