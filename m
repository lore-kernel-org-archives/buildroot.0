From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 22 Jan 2016 04:51:13 +0000
Subject: [Buildroot] [Bug 8621] sqlite package, properly enable readline
In-Reply-To: <bug-8621-163@https.bugs.busybox.net/>
References: <bug-8621-163@https.bugs.busybox.net/>
Message-ID: <bug-8621-163-L1xSjbPEtw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8621

--- Comment #1 from Lonnie Abelbeck <lonnie@abelbeck.com> ---
Additionally, while you are checking out this readline fix, recently sqlite
changed it's default behavior wrt the sqlite CLI tool, previously it was
dynamically linked with libsqlite3.so.0 by default, now it is statically linked
by default.

The old behavior can be signaled with: --disable-static-shell

Either add the configure option by default or possibly:

  ifeq ($(BR2_STATIC_LIBS),y)
  SQLITE_CONF_OPTS += --enable-dynamic-extensions=no
+ else
+ SQLITE_CONF_OPTS += --disable-static-shell
  endif

-- 
You are receiving this mail because:
You are on the CC list for the bug.
