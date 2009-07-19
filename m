From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 19 Jul 2009 20:42:02 +0000 (UTC)
Subject: [Buildroot] [Bug 381] libtheora not using sdl-prefix
In-Reply-To: <bug-381-163@https.bugs.busybox.net/>
References: <bug-381-163@https.bugs.busybox.net/>
Message-ID: <20090719204202.CF72377828@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=381


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-07-19 20:42:01 UTC ---
Hmm, I cannot reproduce this. Can you provide some more details please? I take
it that you are building for the same target as your build host, and that the
libtheora build picks up your /usr/bin/sdl-config and ends up using your host
libraries.

I've tried doing a x86-64 build (as that's what my build host is) with and
without SDL enabled. The libtheora configure script does pick up my host
sdl-config, but as it is only used for examples and we build with
--disable-examples it has no effect. I also tried with a i686 build with the
same affect.

Now, adding a --with-sdl-prefix doesn't hurt, but I would like to understand
the problem first.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
