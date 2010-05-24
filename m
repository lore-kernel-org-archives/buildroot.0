From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 May 2010 10:55:45 +0000 (UTC)
Subject: [Buildroot] [Bug 1789] binutils fails to build for i386
In-Reply-To: <bug-1789-163@https.bugs.busybox.net/>
References: <bug-1789-163@https.bugs.busybox.net/>
Message-ID: <20100524105545.2E5BE1D3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1789

--- Comment #3 from buildroot at invalid-domain.net  ---
> See my config:
>  http://free-electrons.com/~thomas/pub/bug1789/config1

Yes, it's the same config as I am using (only with different number of
simultaneous jobs). I have uploaded the full log to
http://files.invalid-domain.net/buildroot-without-patch.log


I tried the patch you posted to the mailing list (changing   
    HOST_CFLAGS+=-Wl,-rpath -Wl,$(HOST_DIR)/usr/lib 
to
    HOST_LDFLAGS+=-Wl,-rpath -Wl,$(HOST_DIR)/usr/lib

in packages/Makefile.in) and it fixed the compiling problems for binutils for
me. Unfortunately, fakeroot reports an error ("fakeroot: preload library not
found, aborting.") when creating the ext2 fs. Log can be found at
http://files.invalid-domain.net/buildroot-with-proposed-patch.log

Completely removing the line 
    HOST_CFLAGS+=-Wl,-rpath -Wl,$(HOST_DIR)/usr/lib 
from packages/Makefile.in) leads to a successfull build (see log at
http://files.invalid-domain.net/buildroot-with-dirty-fix.log).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
