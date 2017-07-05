From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 5 Jul 2017 12:21:47 +0200
Subject: [Buildroot] uclibc-ng 1.0.25: issue with netinet/udp.h check
Message-ID: <f4f0af83-d47f-da92-722f-91faea1eb381@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

There are two new build issues with uClibc-ng 1.0.25.

http://autobuild.buildroot.net/results/3e4/3e468c7b1be376024422e2f06750571f64f433a2/build-end.log

http://autobuild.buildroot.net/results/8c6/8c629a1c5c4a1d78c8bf09a091a332a424a0f757/build-end.log

Also, see the error in netinet/udp.h check:
http://autobuild.buildroot.net/results/8c6/8c629a1c5c4a1d78c8bf09a091a332a424a0f757//efl-1.19.1/config.log

configure:39124: checking for netinet/udp.h
configure:39124:
/home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/bin/arm-linux-gcc
-std=gnu99 -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5

/home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netinet/udp.h:62:7:
error: unknown type name 'uint16_t'
       uint16_t uh_sport; /* source port */
       ^
/home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netinet/udp.h:63:7:
error: unknown type name 'uint16_t'
       uint16_t uh_dport; /* destination port */
       ^
/home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netinet/udp.h:64:7:
error: unknown type name 'uint16_t'
       uint16_t uh_ulen;  /* udp length */
       ^
/home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netinet/udp.h:65:7:
error: unknown type name 'uint16_t'
       uint16_t uh_sum;  /* udp checksum */
       ^
/home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netinet/udp.h:69:7:
error: unknown type name 'uint16_t'
       uint16_t source;
       ^
/home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netinet/udp.h:70:7:
error: unknown type name 'uint16_t'
       uint16_t dest;
       ^
/home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netinet/udp.h:71:7:
error: unknown type name 'uint16_t'
       uint16_t len;
       ^
/home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netinet/udp.h:72:7:
error: unknown type name 'uint16_t'
       uint16_t check;

It look like an issue related to "Remove __FAVOR_BSD and sync with GNU C library".

Can you have a look ?

Best regards,
Romain
