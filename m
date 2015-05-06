From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  6 May 2015 21:02:04 +0000 (UTC)
Subject: [Buildroot] [Bug 8086] Cannot select systemd as init with Linaro
 2014.09 toolchain selected
In-Reply-To: <bug-8086-163@https.bugs.busybox.net/>
References: <bug-8086-163@https.bugs.busybox.net/>
Message-ID: <20150506210204.8194A800FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8086

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2015-05-06 21:02:04 UTC ---
Where do you see that the 2014.09 toolchain is built against 3.17? I don't see
that anywhere on that page (I do see they have released a 3.17-based kernel,
but that doesn't mean the toolchain is built against it.

And checking linux/version.h from the toolchain correctly shows that it was
built against 3.1.1:

cat output/staging/usr/include/linux/version.h
#define LINUX_VERSION_CODE 196865
#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))

printf '0x%x\n' 196865
0x30101

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
