From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 23 Mar 2020 20:17:41 +0000
Subject: [Buildroot] [Bug 12691] host-rust build fails
In-Reply-To: <bug-12691-163@https.bugs.busybox.net/>
References: <bug-12691-163@https.bugs.busybox.net/>
Message-ID: <bug-12691-163-LqqKZOcfzI@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12691

--- Comment #3 from alex at corcoles.net ---
Yes, I think the Makefile does not support any uclibc build, even though it
works. I needed to build Rust to target uclibc and I hardcoded things and it
worked (this on mipsel).

I did something like this:

https://github.com/alexpdp7/retrofw2-rust/blob/master/0010-Hardcode-target-to-mipsel-uclibc-is-built.patch

The thread I linked contains more details. Also in the repo I collected some
other interesting patches (updating Rust to a later version, patching the
mipsel target to support the device I'm targetting, etc.).

I'm adding myself to the cc:, in case the buildroot devs add support for
uclibc...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
