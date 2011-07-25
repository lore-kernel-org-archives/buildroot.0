From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Jul 2011 09:26:28 +0200
Subject: [Buildroot] [git commit] e2fsprogs: Add missing dependency of
	tst_uuid.o on uuid.h
In-Reply-To: <CACR8Qs_yv1OspsG_byHSTXm5pZ1UMgrMVj0GXf8Rvovk-4+Lpw@mail.gmail.com>
 (Alexjan Carraturo's message of "Mon, 25 Jul 2011 08:45:26 +0200")
References: <20110724222706.574988B495@busybox.osuosl.org>
 <CACR8Qs_yv1OspsG_byHSTXm5pZ1UMgrMVj0GXf8Rvovk-4+Lpw@mail.gmail.com>
Message-ID: <87pqkyu8gr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexjan" == Alexjan Carraturo <axjslack@gmail.com> writes:

Hi,

 Alexjan> There is the possibility that, the problem about uuid.h that you have
 Alexjan> with e2fsprogs is similar to what I'm having on my version of
 Alexjan> buildroot (snapshot of 22 July)

 Alexjan> /usr/bin/make BUILDDIR=/home/buildroot/buildroot-20110722/buildroot/output/build/host-mtd-1.4.5/$d
 Alexjan> -C $d $t
 Alexjan> make[2]: Entering directory
 Alexjan> `/home/buildroot/buildroot-20110722/buildroot/output/build/host-mtd-1.4.5/mkfs.ubifs'
 Alexjan> gcc -I../include -I../ubi-utils/include   -D_FILE_OFFSET_BITS=64 -O2
 Alexjan> -g -Wall -Wextra -Wwrite-strings -Wno-sign-compare -ffunction-sections
 Alexjan> -fdata-sections -Wl,--gc-sections -c -o
 Alexjan> /home/buildroot/buildroot-20110722/buildroot/output/build/host-mtd-1.4.5/mkfs.ubifs/mkfs.ubifs.o
 Alexjan> mkfs.ubifs.c -g
 Alexjan> -Wp,-MD,/home/buildroot/buildroot-20110722/buildroot/output/build/host-mtd-1.4.5/mkfs.ubifs/.mkfs.ubifs.c.dep
 Alexjan> In file included from mkfs.ubifs.c:23:0:
 Alexjan> mkfs.ubifs.h:48:23: fatal error: uuid/uuid.h: File o directory non esistente

Strange, for some reason you are missing the -I$(HOST_DIR)/usr/include
from your cflags. I have:

gcc -I../include -I../ubi-utils/include   -D_FILE_OFFSET_BITS=64 -O2 -I/home/peko/source/buildroot/output/host/include -I/home/peko/source/buildroot/output/host/usr/include -Wall -Wextra -Wwrite-strings -Wno-sign-compare -ffunction-sections -fdata-sections -Wl,--gc-sections -Wall -Wextra -Wwrite-strings -Wno-sign-compare -ffunction-sections -fdata-sections -Wl,--gc-sections -c -o /home/peko/source/buildroot/output/build/host-mtd-1.4.5/mkfs.ubifs/mkfs.ubifs.o mkfs.ubifs.c -g -Wp,-MD,/home/peko/source/buildroot/output/build/host-mtd-1.4.5/mkfs.ubifs/.mkfs.ubifs.c.dep

Do you have a custom HOST_CFLAGS defined in your environment or on the
make cmdline by any chance?

-- 
Bye, Peter Korsgaard
