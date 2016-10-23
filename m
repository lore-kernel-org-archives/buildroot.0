From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Oct 2016 13:09:52 +0000
Subject: [Buildroot] [Bug 9336] Improve iconv support for external toolchain
	based builds
In-Reply-To: <bug-9336-163@https.bugs.busybox.net/>
References: <bug-9336-163@https.bugs.busybox.net/>
Message-ID: <bug-9336-163-TumnD7hq4l@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9336

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
There is already a Buildroot option to copy gconv modules to the target, it
just seems you missed it. In the toolchain menu, when a glibc toolchain is
used, you have:

  [*] Copy gconv libraries
  ()    Gconv libraries to copy

If you leave the second option empty, all gconv modules are copied to the
target. Otherwise, if it's non-empty, only the specified list of gconv modules
are copied.

I've just tested again today, leaving the list empty. Indeed, all gconv modules
are copied, and a simple C program that converts an UTF-8 string to CP1251
using iconv_open() / iconv() works just fine on the target.

The iconv binary itself is however indeed not copied. Maybe we should add an
option to copy additional binaries from the toolchain to the target? Could you
submit such a patch?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
