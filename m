From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Thu, 2 Aug 2007 22:00:38 +0200 (CEST)
Subject: [Buildroot] cannot stat
	`buildroot/build_i486/staging_dir/usr/lib/libstdc++.so*'
Message-ID: <0708022140380.8725@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

# make gcc
...
and at the end
,----
| touch buildroot/toolchain_build_i486/gcc-4.2.1-final/.installed
| # These are in /lib, so...
| rm -rf buildroot/project_build_i486/uclibc/root/usr/lib/libgcc_s*.so*
| cp -dpf buildroot/build_i486/staging_dir/usr/i486-linux-uclibc/lib/libgcc_s* buildroot/project_build_i486/uclibc/root/lib/
| cp -dpf buildroot/build_i486/staging_dir/usr/lib/libstdc++.so* buildroot/project_build_i486/uclibc/root/lib/
| cp: cannot stat `buildroot/build_i486/staging_dir/usr/lib/libstdc++.so*': No such file or directory
| make: [buildroot/toolchain_build_i486/gcc-4.2.1-final/.libs_installed] Error 1 (ignored)
| touch buildroot/toolchain_build_i486/gcc-4.2.1-final/.libs_installed
`----

There's no trace of libstdc++.so* in the build tree.
Is there a way to get libstdc++ built?


Cheers,

-- 
Cristian
