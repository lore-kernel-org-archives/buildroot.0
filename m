From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Aug 2014 10:51:19 +0000 (UTC)
Subject: [Buildroot] [Bug 7322] libgomp dependency issue with imagemagick
In-Reply-To: <bug-7322-163@https.bugs.busybox.net/>
References: <bug-7322-163@https.bugs.busybox.net/>
Message-ID: <20140815105119.83FAF9D45F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7322

--- Comment #2 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2014-08-15 10:51:19 UTC ---
There's already a config symbol for OpenMP (libgomp) support which could easily
be extended.
A quick fix for 2014.08 would be to --disable-openmp for imagemagick if
BR2_GCC_ENABLE_OPENMP isn't set (it's just used/supported for the internal
toolchain backend so nothing to worry about there, otherwise the test is
automatic).

Going forward i'd just copy it if it's available, it's not that big, an ARMv5
libgomp.so is roughly 100 KiB without stripping.
We could introduce a config knob like BR2_TOOLCHAIN_EXTERNAL_INET_RPC and those
but really, it's just complicating things i think.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
