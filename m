From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 May 2020 06:45:31 +0000
Subject: [Buildroot] [Bug 12596] host-e2fsprogs: tune2fs incompatibility on
 older glibc version
In-Reply-To: <bug-12596-163@https.bugs.busybox.net/>
References: <bug-12596-163@https.bugs.busybox.net/>
Message-ID: <bug-12596-163-ZtsYL2hs4Q@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12596

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Unfortunately, this is not something that we can really solve. You have to
build your SDK in a host that is equal or older to the host machines where the
SDK will be used.

https://stackoverflow.com/a/2858996/643208 has a possible solution, but it
requires making ugly changing to the source code of packages.

https://stackoverflow.com/a/52550158/643208 proposes to build your own glibc.

Hm, https://github.com/wheybags/glibc_version_header seems interesting though,
but it says that it doesn't work for C++, "If you want C++, you'll need to
build libstdc++ with this enabled. That can be a little involved, but I'm
working on a solution, to be available "soon"".

pthread also might be causing problems, you must use -pthread and not
-lpthread.

So, this seems like a potential source of great pain :-/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
