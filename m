From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  6 Dec 2009 20:12:17 +0000 (UTC)
Subject: [Buildroot] [Bug 759] Sysstat build broken without libintl
In-Reply-To: <bug-759-163@https.bugs.busybox.net/>
References: <bug-759-163@https.bugs.busybox.net/>
Message-ID: <20091206201217.51F8B777FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=759





--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org>  2009-12-06 20:12:16 UTC ---
> Thx for responding, you made me look deeper in the problem...
> 
> I built an external toolchain using crosstool-ng for x86 with the default
> options. The toolchain has been built with --disable-nls but when buildroot is
> configured to use an external toolchain, it seems to assume the toolchain to be
> built with nls support and so asks the user to set the BR2_ENABLE_LOCALE
> option.

I don't normally use an external toolchain, but from a quick look it seems to
me like you still have the 'Enable toolchain locale/i18n support?' option when
you use an external toolchain. If your crosstool-ng toolchain doesn't have
locale support, then don't enable that option.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
