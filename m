From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 28 Feb 2012 12:16:17 +0100
Subject: [Buildroot] build of e2fsprogs fails (2012.02-rc3)
Message-ID: <1330427777.2274.27.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the build of e2fsprogs fails with 2012.02-rc3:

	CC e4defrag.c
e4defrag.c:28:17: fatal error: ftw.h: No such file or directory
compilation terminated.
make[3]: *** [e4defrag.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory
`/home/sven/git/buildroot-geode/output/build/e2fsprogs-1.42/misc'
make[2]: *** [all-progs-recursive] Error 1
make[2]: Leaving directory
`/home/sven/git/buildroot-geode/output/build/e2fsprogs-1.42'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/sven/git/buildroot-geode/output/build/e2fsprogs-1.42'
make: ***
[/home/sven/git/buildroot-geode/output/build/e2fsprogs-1.42/.stamp_built] Error 2


$ find . -name ftw.h 
./output/toolchain/uClibc-0.9.32.1/include/ftw.h


The relevant lines of the buildroot .config are:

BR2_PACKAGE_E2FSPROGS=y
BR2_PACKAGE_E2FSPROGS_BADBLOCKS=y
# BR2_PACKAGE_E2FSPROGS_CHATTR is not set
# BR2_PACKAGE_E2FSPROGS_DEBUGFS is not set
# BR2_PACKAGE_E2FSPROGS_DUMPE2FS is not set
# BR2_PACKAGE_E2FSPROGS_E2FREEFRAG is not set
BR2_PACKAGE_E2FSPROGS_E2FSCK=y
# BR2_PACKAGE_E2FSPROGS_E2IMAGE is not set
BR2_PACKAGE_E2FSPROGS_E2LABEL=y
# BR2_PACKAGE_E2FSPROGS_E2UNDO is not set
# BR2_PACKAGE_E2FSPROGS_E4DEFRAG is not set
# BR2_PACKAGE_E2FSPROGS_FILEFRAG is not set
# BR2_PACKAGE_E2FSPROGS_FINDFS is not set
# BR2_PACKAGE_E2FSPROGS_FSCK is not set
# BR2_PACKAGE_E2FSPROGS_LOGSAVE is not set
# BR2_PACKAGE_E2FSPROGS_LSATTR is not set
BR2_PACKAGE_E2FSPROGS_MKE2FS=y
# BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND is not set
# BR2_PACKAGE_E2FSPROGS_RESIZE2FS is not set
# BR2_PACKAGE_E2FSPROGS_TUNE2FS is not set
BR2_PACKAGE_E2FSPROGS_UUIDGEN=y


Regards, Sven
