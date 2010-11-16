From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Nov 2010 13:16:01 +0000 (UTC)
Subject: [Buildroot] [Bug 759] Sysstat build broken without libintl
In-Reply-To: <bug-759-163@https.bugs.busybox.net/>
References: <bug-759-163@https.bugs.busybox.net/>
Message-ID: <20101116131601.A3EBD8DE9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=759

--- Comment #10 from Gustavo Zacarias <gustavo@zacarias.com.ar>  ---
Tried the following combinations:

internal, mipsel target, no toolchain locale: pass
internal, arm target, no toolchain locale: pass
internal, mipsel target, toolchain locale: pass
internal, mipsel target, toolchain locale + libintl enabled: fail

So it fails WITH libintl (package) enabled.

Try this patch:
http://repo.or.cz/w/buildroot-gz.git/commitdiff/f15bee3f223921f670581bc43486e2957ed712cf

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
