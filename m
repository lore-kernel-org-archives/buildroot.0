From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 May 2020 19:07:40 +0000
Subject: [Buildroot] [Bug 12876] putilimp.h **error**: missing binary
 operator before token "(" #elif __has_builtin(__c11_atomic_load) && \
In-Reply-To: <bug-12876-163@https.bugs.busybox.net/>
References: <bug-12876-163@https.bugs.busybox.net/>
Message-ID: <bug-12876-163-hQk9QdpgeB@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12876

--- Comment #5 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to yogesh kumar sharma from comment #4)

    $ wget https://buildroot.org/downloads/buildroot-2020.02.2.tar.bz2
    $ wget -O
v5-1-1-package-nodejs-Use-zlib-headers-from-HOST_ZLIB_SRCDIR-for-host-nodejs.patch
https://patchwork.ozlabs.org/project/buildroot/patch/20200218031521.32988-1-james.hilliard1 at gmail.com/mbox/
    $ tar -xvjf buildroot-2020.02.2.tar.bz2
    $ cd buildroot-2020.02.2
    $ patch -p 1 <
../v5-1-1-package-nodejs-Use-zlib-headers-from-HOST_ZLIB_SRCDIR-for-host-nodejs.patch

Do not forget to do an complete re-build of@least the host-nodejs package,
best by removing the existing host-nodejs build directory, e.g.:

    $ rm -rf output/build/host-nodejs-12.16.1

or a global re-build

     $ make clean && make

-- 
You are receiving this mail because:
You are on the CC list for the bug.
