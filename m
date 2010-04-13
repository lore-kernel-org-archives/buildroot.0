From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 13 Apr 2010 15:33:36 +0000 (UTC)
Subject: [Buildroot] [Bug 851] Add option to specify --sysroot value for
 external toolchain
In-Reply-To: <bug-851-163@https.bugs.busybox.net/>
References: <bug-851-163@https.bugs.busybox.net/>
Message-ID: <20100413153337.049BA7F9A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=851





--- Comment #12 from Grant Edwards <grant.b.edwards@gmail.com>  2010-04-13 15:33:35 UTC ---

I didn't save the .config file for my production toolchain (the one
that just prints "libc.a").  So, I rebuilt it, and now I see the same
behavior that you do: after being relocated it always prints the
original path for the file (e.g.
<whaterver>/buildroot/output/staging/usr/lib/libc.a.

In either case, the current fix doesn't work for toolchains built
using buildroot.

I'm going to continue trying to build a toolchain built using
crosstool-ng. So far, it's been rather futile.  The "example"
configuration for arm/linux/uclibc builds fine, but as soon as I try
the current version of anything (gcc, uclibc) the uclibc build fails
due to a bunch of unresolved symbols.

> So, with Buildroot toolchains, the result is not correct:
> -print-file-name keeps returning paths to the original location.

I thought that _was_ the expected behavior and that's why we need to
pass the -sysroot option to the toolchain.

> With Crosstool-NG toolchains, it works as expected. Something is
> definitely wrong in the way Buildroot generates toolchains, IMO.

Now I'm confused again (shocker, eh?): if a gcc toolchain is expected
to be able to find its files after it's been relocated, then it
doesn't need to be passed the -sysroot option. If that's true, why
does buildroot require support for the -sysroot option and try to
figure out what to pass as the sysroot value?

[Is there any way to prevent bugzilla from wrapping comments?
 Presumably that's done in an attempt to render illegible the code
 examples and program output that pastes into comments. It works quite
 well.]


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
