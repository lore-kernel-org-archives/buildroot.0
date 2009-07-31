From: Mark Constable <markc@renta.net>
Date: Fri, 31 Jul 2009 13:24:43 +1000
Subject: [Buildroot] x86_64 error
Message-ID: <4A7263FB.6050006@renta.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is just after make menuconfig from a Git checkout where the
target is x86_64 on a x86_64 host (I want a 64bit uclibc)...

rm -rf /home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/project_build_x86_64/uclibc/root/usr/include /home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/project_build_x86_64/uclibc/root/usr/lib/pkgconfig
find /home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/project_build_x86_64/uclibc/root/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
find /home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/project_build_x86_64/uclibc/root/usr/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
rm -rf /home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/project_build_x86_64/uclibc/root/usr/man /home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/project_build_x86_64/uclibc/root/usr/share/man
/home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/project_build_x86_64/uclibc/root/usr/info /home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/project_build_x86_64/uclibc/root/usr/share/info
find /home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/project_build_x86_64/uclibc/root -type f -perm +111 | xargs /home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/build_x86_64/staging_dir/usr/bin/x86_64-linux-uclibc-strip --remove-section=.comment --remove-section=.note 2>/dev/null || true
/home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/build_x86_64/staging_dir/usr/bin/x86_64-linux-uclibc-ldconfig -r /home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/project_build_x86_64/uclibc/root 2>/dev/null
make: *** [target-finalize] Error 127
make: *** Waiting for unfinished jobs....

--markc
