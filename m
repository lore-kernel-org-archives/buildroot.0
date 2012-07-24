From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 24 Jul 2012 11:45:06 +0000 (UTC)
Subject: [Buildroot] [Bug 5396] Boot hangs when starting samba if
 BR2_ENABLE_LOCALE is enabled
In-Reply-To: <bug-5396-163@https.bugs.busybox.net/>
References: <bug-5396-163@https.bugs.busybox.net/>
Message-ID: <20120724114506.D4F2496CF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5396

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-07-24 11:45:06 UTC ---
I haven't looked in details, but I think the fix will probably have to have
some special casing depending on whether the toolchain uses uClibc or (e)glibc.
Those C libraries already have iconv support, but maybe the iconv
implementation of uClibc isn't capable enough. But in the case of (e)glibc, I
don't think the separate libiconv is needed.

So clearly, a proper fix will need investigation and testing for both uClibc
and glibc toolchains.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
