From: Babarovic Ivica <ivica.babarovic@asist.si>
Date: Tue, 04 Sep 2007 15:24:37 +0200
Subject: [Buildroot] Tar problems
Message-ID: <46DD5C95.3060907@asist.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since this is my first post to this list I'd like to say hello first and
express my appreciation
for this wonderful tool.

This is the problem I'm getting while building my target.
I specifically uncheck the tar option for compressing rootfs. It seems
though build process
ignores this.
Last lines:
-------------------------------------------------------------------
...
# Use fakeroot to pretend all target binaries are owned by root
rm -f
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/_fakeroot.rootfs.powerpc.ext2
touch
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/.fakeroot.00000
cat
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/.fakeroot*
>
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/_fakeroot.rootfs.powerpc.ext2
echo "chown -R 0:0
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/root"
>>
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/_fakeroot.rootfs.powerpc.ext2
# Use fakeroot to pretend to create all needed device nodes
echo
"/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/bin/makedevs
-d target/generic/device_table.txt
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/root"
\
                >>
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/_fakeroot.rootfs.powerpc.ext2
# Use fakeroot so genext2fs believes the previous fakery
GENEXT2_REALSIZE=`LC_ALL=C du -s -c -k
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/root
| grep total | sed -e "s/total//"`; \
        GENEXT2_ADDTOROOTSIZE=`if [ $GENEXT2_REALSIZE -ge 20000 ]; then
echo 16384; else echo 2400; fi`; \
        GENEXT2_SIZE=`expr $GENEXT2_REALSIZE + $GENEXT2_ADDTOROOTSIZE`; \
        GENEXT2_ADDTOINODESIZE=`find
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/root
| wc -l`; \
        GENEXT2_INODES=`expr $GENEXT2_ADDTOINODESIZE + 400`; \
        set -x; \
        echo
"/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/genext2fs-1.4/genext2fs
-b $GENEXT2_SIZE " \
                "-N $GENEXT2_INODES -d
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/root
" \
                " -U -m 0
/home/ivo/src/mpc5200_binar/build-tools/buildroot/binaries/uclibc/rootfs.powerpc.ext2"
>>
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/_fakeroot.rootfs.powerpc.ext2
+ echo
'/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/genext2fs-1.4/genext2fs
-b 5576 ' '-N 728 -d
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/root
' ' -U -m 0
/home/ivo/src/mpc5200_binar/build-tools/buildroot/binaries/uclibc/rootfs.powerpc.ext2'
chmod a+x
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/_fakeroot.rootfs.powerpc.ext2
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/fakeroot
--
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/_fakeroot.rootfs.powerpc.ext2
chown: changing ownership of
`/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/root/dev/log':
No such file or directory
chown: changing ownership of
`/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/root/etc/mtab':
No such file or directory
chown: changing ownership of
`/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/root/etc/resolv.conf':
No such file or directory
rootdir=/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/root
table='target/generic/device_table.txt'
-rw-r--r-- 1 ivo users 5709824 Sep  4 14:49
/home/ivo/src/mpc5200_binar/build-tools/buildroot/binaries/uclibc/rootfs.powerpc.ext2
tar: /home/ivo/src/mpc5200_binar/build-tools/buildroot/dl/: Cannot read:
Is a directory
tar: At beginning of tape, quitting now
tar: Error is not recoverable: exiting now

gzip: stdin: unexpected end of file
tar: Child returned status 2
tar: Error exit delayed from previous errors
basename: missing operand
Try `basename --help' for more information.
gzip -d -c /home/ivo/src/mpc5200_binar/build-tools/buildroot/dl/ | tar
-C
/home/ivo/src/mpc5200_binar/build-tools/buildroot/toolchain_build_powerpc  
-xf -
gzip: /home/ivo/src/mpc5200_binar/build-tools/buildroot/dl/ is a
directory -- ignored
mv
/home/ivo/src/mpc5200_binar/build-tools/buildroot/toolchain_build_powerpc/
/home/ivo/src/mpc5200_binar/build-tools/buildroot/toolchain_build_powerpc/mtd_orig
mv: cannot move
`/home/ivo/src/mpc5200_binar/build-tools/buildroot/toolchain_build_powerpc/'
to a subdirectory of itself,
`/home/ivo/src/mpc5200_binar/build-tools/buildroot/toolchain_build_powerpc/mtd_orig'
make: ***
[/home/ivo/src/mpc5200_binar/build-tools/buildroot/toolchain_build_powerpc/mtd_orig/.unpacked]
Error 1

Best regards,
Ivo
