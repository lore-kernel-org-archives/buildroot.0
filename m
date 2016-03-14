From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Mar 2016 13:40:40 +0100
Subject: [Buildroot] tar failing to build with latest buildroot
In-Reply-To: <1457951104.2051.1.camel@rovoreed.com> (Mike Davies's message of
 "Mon, 14 Mar 2016 10:25:04 +0000")
References: <1457951104.2051.1.camel@rovoreed.com>
Message-ID: <874mc9dygn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Davies <busybox_mail@rovoreed.com> writes:

 > Title says it all really. 'tar' (the real one not the busybox version)
 > fails to build in the latest stable version. I'm using uClibc 1.0.12


 > [mike at ceri buildroot-2016.02]$ make
 >>>> tar 1.28 Building
 > PATH="/home/mike/work/kodi/buildroot
 > -2016.02/output/host/bin:/home/mike/work/kodi/buildroot
 > -2016.02/output/host/sbin:/home/mike/work/kodi/buildroot
 > -2016.02/output/host/usr/bin:/home/mike/work/kodi/buildroot
 > -2016.02/output/host/usr/sbin:/usr/lib64/qt
 > -3.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/m
 > ike/bin:/sbin:/home/mike/.local/bin:/home/mike/bin:/home/mike/bin:/sbin
 > "  /usr/bin/make -j5  -C /home/mike/work/kodi/buildroot
 > -2016.02/output/build/tar-1.28/
 > /usr/bin/make  all-recursive
 > Making all in doc
 > make[4]: Nothing to be done for 'all'.

Is this with a clean build? E.G. tar needs wchar, so if you didn't have
that enabled in the toolchain configuration you will need to rebuild the
toolchain.

It works for me with current git with this defconfig:

cat defconfig
BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_TAR=y


What is your configuration exactly? (E.G. run make savedefconfig and
post your defconfig file).

-- 
Bye, Peter Korsgaard
