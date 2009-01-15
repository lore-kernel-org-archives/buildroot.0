From: Anton Copylov <a_copl@mail.ru>
Date: Thu, 15 Jan 2009 11:58:22 +0300
Subject: [Buildroot] Wrong symbolic link, when building xterm
Message-ID: <E1LNO3S-0003ZE-00.a_copl-mail-ru@f60.mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

snapshot 15-Jan-2009

Here is output listing

touch -c /home/copylov/devel/buildroot/project_build_powerpc/uclibc/root/usr/bin/gcc
cp -dpf /home/copylov/devel/buildroot/build_powerpc/ncurses-5.6/lib/libncurses.so* /home/copylov/devel/buildroot/project_build_powerpc/uclibc/root/lib/
ln -snf /usr/share/terminfo /home/copylov/devel/buildroot/project_build_powerpc/uclibc/root/usr/lib/terminfo
mkdir -p /home/copylov/devel/buildroot/project_build_powerpc/uclibc/root/usr/share/terminfo/x
cp -dpf /home/copylov/devel/buildroot/build_powerpc/staging_dir/usr/share/terminfo/x/xterm /home/copylov/devel/buildroot/project_build_powerpc/uclibc/root/usr/share/terminfo/xd_powerpc/uclibc/root/usr/share/terminfo/x

Last line fails with error "no such file or directory". Creating link 
from /home/copylov/devel/buildroot/build_powerpc/staging_dir/usr/share/terminfo to /usr/share/terminfo fix it (At 
least it helps me).
