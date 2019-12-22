From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 22 Dec 2019 18:02:03 +0000
Subject: [Buildroot] [Bug 12426] NodeJS slow startup performance (~30s)
In-Reply-To: <bug-12426-163@https.bugs.busybox.net/>
References: <bug-12426-163@https.bugs.busybox.net/>
Message-ID: <bug-12426-163-jj4xzTuJgf@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12426

--- Comment #6 from Eric Higgins <erichiggins@gmail.com> ---
All subsequent runs of nodejs are just as slow to start.

Storage is a class 10 microSD.

Actually, the prebuilt nodejs binaries are also dynamically linked. I found
this out the hard way because I was using uClibc-ng and the prebuilt expects
glibc.


(prebuilt)
# file /usr/local/lib/nodejs/node-v10.18.0-linux-armv6l/bin/node

/usr/local/lib/nodejs/node-v10.18.0-linux-armv6l/bin/node: ELF 32-bit LSB
executable, ARM, EABI5 version 1 (GNU/Linux), dynamically linked, interpreter
/lib/ld-linux-armhf.so.3, for GNU/Linux 3.16.42, with debug_info, not stripped


(compiled by buildroot)
# file /usr/bin/node 

/usr/bin/node: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV),
dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped


For what it's worth, the flags they use for armv6l are available here:

https://github.com/nodejs/unofficial-builds/tree/master/recipes/armv6l

-- 
You are receiving this mail because:
You are on the CC list for the bug.
