From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 13 Apr 2010 05:34:53 +0000 (UTC)
Subject: [Buildroot] [Bug 851] Add option to specify --sysroot value for
 external toolchain
In-Reply-To: <bug-851-163@https.bugs.busybox.net/>
References: <bug-851-163@https.bugs.busybox.net/>
Message-ID: <20100413053453.19F2A7FAC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=851





--- Comment #11 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2010-04-13 05:34:51 UTC ---
Could you the .config you used to generate the toolchain ? I don't get the same
behaviour here.

However, I've tried with a Buildroot generated toolchain, that I moved, and I
keep getting the old path.

Buildroot external toolchain, at its original location:

$ ./arm-br/usr/bin/arm-linux-gcc -print-file-name=libc.a
/home/thomas/x-tools/arm-br//usr/lib/libc.a

Buildroot external toolchain, in a different location:

$ ./arm-br.moved/usr/bin/arm-linux-gcc -print-file-name=libc.a
/home/thomas/x-tools/arm-br//usr/lib/libc.a

Crosstool-NG toolchain, original location:

$ ./arm-unknown-linux-uclibcgnueabi/bin/arm-linux-gcc -print-file-name=libc.a
/home/thomas/x-tools/arm-unknown-linux-uclibcgnueabi/arm-unknown-linux-uclibcgnueabi//sys-root/usr/lib/libc.a

Crosstool-NG toolchain, in a different location:

$ ./arm2/bin/arm-linux-gcc -print-file-name=libc.a
/home/thomas/x-tools/arm2/bin/../arm-unknown-linux-uclibcgnueabi//sys-root/usr/lib/libc.a

So, with Buildroot toolchains, the result is not correct: -print-file-name
keeps returning paths to the original location. With Crosstool-NG toolchains,
it works as expected. Something is definitely wrong in the way Buildroot
generates toolchains, IMO.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
