From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 Aug 2014 15:22:58 +0000 (UTC)
Subject: [Buildroot] [Bug 6218] binutils-2.23.2/gas fails with undefined
 reference to `mbstowcs'
In-Reply-To: <bug-6218-163@https.bugs.busybox.net/>
References: <bug-6218-163@https.bugs.busybox.net/>
Message-ID: <20140818152258.425389D4AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6218

--- Comment #5 from Alexey Brodkin <abrodkin@synopsys.com> 2014-08-18 15:22:57 UTC ---
This happens on ARC too when building native binutils.
It's because in uClibc "mbstowcs" is only gets built-in if WCHAR support is
enabled.

So proper fix would be to add WCHAR support in toolchain as a dependency for
native binutils.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
