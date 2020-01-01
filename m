From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 01 Jan 2020 13:44:16 +0000
Subject: [Buildroot] [Bug 12441] qt5webengine build error: asm/errno.h: No
 such file or directory
In-Reply-To: <bug-12441-163@https.bugs.busybox.net/>
References: <bug-12441-163@https.bugs.busybox.net/>
Message-ID: <bug-12441-163-EOyICjHI6a@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12441

--- Comment #2 from Aleksandr Makarov <seems.deviant@gmail.com> ---
(In reply to Bartosz Bilas from comment #1)

Bartek,

The mentioned error occurs every time I do either full build with 'make all' or
rebuilding with  'make qt5webengine-dirclean qt5webengine-rebuild'.

I use the Github [1] mirror as buildroot source. My HEAD is on '35c040d1ab
boot/uboot: cover more u-boot versions when fixing up libfdt include paths';
that's where I can reproduce the issue right now.

I can also see that the patch [2] you mentioned is applied to the 
src/3rdparty/chromium/build/config/linux/pkg_config.gni in my build directory.
However it does not seem to address this exact issue as none of the failing
object files compile with '-isystem' flag.

[1] https://github.com/buildroot/buildroot
[2]
https://github.com/buildroot/buildroot/commit/6cfe21ae90ccd88254bf5240b2b29d74794f45fe

-- 
You are receiving this mail because:
You are on the CC list for the bug.
