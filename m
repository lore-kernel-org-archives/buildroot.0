From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  4 Feb 2013 22:05:40 +0000 (UTC)
Subject: [Buildroot] [Bug 5900] config flags to the Xenomai build system ...
In-Reply-To: <bug-5900-163@https.bugs.busybox.net/>
References: <bug-5900-163@https.bugs.busybox.net/>
Message-ID: <20130204220540.1A2999A883@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5900

--- Comment #2 from teratux <raespi@icid.cu> 2013-02-04 22:06:01 UTC ---
Yes I'm using those two options:
BR2_arm920t=y
BR2_PREFER_SOFT_FLOAT=y
BR2_SOFT_FLOAT=y

I noted they were missing when I saw the config.log in the build/xenomai-2.6.0/
directory.  This is how it looks now after adding them manually in the
xenomai.mk recipe:

  $ ./configure --target=arm-linux --host=arm-linux --build=i686-pc-linux-gnu
--prefix=/usr --exec-prefix=/usr --sysconfdir=/etc --program-prefix=
--disable-gtk-doc --enable-ipv6 --enable-static --enable-shared
--includedir=/usr/include/xenomai/ CFLAGS=-march=armv4t -msoft-float
LDFLAGS=-march=armv4t -msoft-float

Notice the CFLAGS and LDFLAGS at the end ...

(In reply to comment #1)
> If you select the proper armv4t core in "Target Architecture Variant" and have
> the BR2_SOFT_FLOAT option enabled, then we are normally already passing those
> two flags to Xenomai ./configure script.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
