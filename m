From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Aug 2018 08:08:06 +0000
Subject: [Buildroot] [Bug 11241] ACPID shouldn't depend on BR2_x86_64 ||
 BR2_i386
In-Reply-To: <bug-11241-163@https.bugs.busybox.net/>
References: <bug-11241-163@https.bugs.busybox.net/>
Message-ID: <bug-11241-163-0fsclqFzEX@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11241

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Sorry, what firmware provides ACPI on your cubieboard? Or do you just mean that
some of the functionality of acpid is usable without firmware/kernel support?
drivers/acpi in the Linux kernel is guarded by ARCH_SUPPORTS_ACPI, which is
selected for arm64/ia64/x86.

With that said, if it builds on other architectures and there are use cases for
it on those, then I don't have a problem exposing it.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
