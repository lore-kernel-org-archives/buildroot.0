From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Mar 2010 16:06:25 +0000 (UTC)
Subject: [Buildroot] [Bug 1225] Buildroot fails to account for "nof"
 subdirectory (no floating point)
In-Reply-To: <bug-1225-163@https.bugs.busybox.net/>
References: <bug-1225-163@https.bugs.busybox.net/>
Message-ID: <20100303160625.9207677727@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1225





--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2010-03-03 16:06:24 UTC ---
Ok, thanks, got it. I think I missed it the previous time because the error is
ignored and the build continues:

==================================================================

# These are in /lib, so...
rm -rf /home/test/buildroot/output/target/usr/lib/libgcc_s*.so*
cp -dpf
/home/test/buildroot/output/staging/usr/powerpc-linux-uclibc/lib*/libgcc_s* \
                /home/test/buildroot/output/target/lib/
cp: cannot stat
`/home/test/buildroot/output/staging/usr/powerpc-linux-uclibc/lib*/libgcc_s*':
No such file or directory
make: [/home/test/buildroot/output/stamps/gcc_libs_target_installed] Error 1
(ignored)
/home/test/buildroot/output/staging/usr/bin/powerpc-linux-uclibc-strip
--remove-section=.comment --remove-section=.note --strip-unneeded
/home/test/buildroot/output/target/lib/libgcc_s*
/home/test/buildroot/output/staging/usr/bin/powerpc-linux-uclibc-strip:
'/home/test/buildroot/output/target/lib/libgcc_s*': No such file
make: [/home/test/buildroot/output/stamps/gcc_libs_target_installed] Error 1
(ignored)
mkdir -p /home/test/buildroot/output/target/usr/lib
cp -dpf
/home/test/buildroot/output/staging/usr/powerpc-linux-uclibc/lib*/libstdc++.so*
\
                /home/test/buildroot/output/target/usr/lib/
cp: cannot stat
`/home/test/buildroot/output/staging/usr/powerpc-linux-uclibc/lib*/libstdc++.so*':
No such file or directory
make: [/home/test/buildroot/output/stamps/gcc_libs_target_installed] Error 1
(ignored)

==================================================================


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
