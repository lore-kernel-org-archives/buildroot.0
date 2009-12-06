From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  6 Dec 2009 19:48:35 +0000 (UTC)
Subject: [Buildroot] [Bug 759] Sysstat build broken without libintl
In-Reply-To: <bug-759-163@https.bugs.busybox.net/>
References: <bug-759-163@https.bugs.busybox.net/>
Message-ID: <20091206194835.38540777FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=759


Lionel Landwerlin <llandwerlin@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |INVALID




--- Comment #3 from Lionel Landwerlin <llandwerlin@gmail.com>  2009-12-06 19:48:34 UTC ---
(In reply to comment #2)
> Hmm, with what config is this? I don't seem to be able to reproduce it here (no
> libintl, no locale support in toolchain). Notice that we're already
> automatically adding --disable-nls if the toolchain doesn't have locale
> support.
> 

Thx for responding, you made me look deeper in the problem...

I built an external toolchain using crosstool-ng for x86 with the default
options. The toolchain has been built with --disable-nls but when buildroot is
configured to use an external toolchain, it seems to assume the toolchain to be
built with nls support and so asks the user to set the BR2_ENABLE_LOCALE
option.

So I guess I can close the bug and then push some patches to the mailing list
for a better external toolchain support (at least with glibc).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
