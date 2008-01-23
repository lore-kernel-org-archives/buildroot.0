From: Tim Barr <tbarr@multitech.com>
Date: Wed, 23 Jan 2008 14:59:00 -0600
Subject: [Buildroot] Is this related to the mDNSResponder error reported in
	bug 1959?
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E609CEA5F1@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I get this error now when I try to make a buildroot for an at92sam2960
arm device:


/usr/bin/make MAKE="/usr/bin/make -j1"
CC=/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/bin/arm-li
nux-uclibc-gcc os="linux"
LD="/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/bin/arm-l
inux-uclibc-gcc -shared" LOCALBASE="/usr" -C
/home/falingtrea/buildroot/build_arm_wchar/mDNSResponder-107.6/mDNSPosix
make[1]: Entering directory
`/home/falingtrea/buildroot/build_arm_wchar/mDNSResponder-107.6/mDNSPosi
x'
Responder daemon done
/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/bin/arm-linux
-uclibc-gcc -I. -I../mDNSCore -I../mDNSShared -W -Wall
-DPID_FILE=\"/var/run/mdnsd.pid\"
-DMDNS_UDS_SERVERPATH=\"/var/run/mdnsd\" -DNOT_HAVE_SA_LEN
-DUSES_NETLINK -DHAVE_LINUX -Os -DMDNS_DEBUGMSGS=0 -c -fPIC -o
objects/prod/dnssd_clientlib.c.so.o ../mDNSShared/dnssd_clientlib.c
/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/bin/arm-linux
-uclibc-gcc -I. -I../mDNSCore -I../mDNSShared -W -Wall
-DPID_FILE=\"/var/run/mdnsd.pid\"
-DMDNS_UDS_SERVERPATH=\"/var/run/mdnsd\" -DNOT_HAVE_SA_LEN
-DUSES_NETLINK -DHAVE_LINUX -Os -DMDNS_DEBUGMSGS=0 -c -fPIC -o
objects/prod/dnssd_clientstub.c.so.o ../mDNSShared/dnssd_clientstub.c
/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/bin/arm-linux
-uclibc-gcc -I. -I../mDNSCore -I../mDNSShared -W -Wall
-DPID_FILE=\"/var/run/mdnsd.pid\"
-DMDNS_UDS_SERVERPATH=\"/var/run/mdnsd\" -DNOT_HAVE_SA_LEN
-DUSES_NETLINK -DHAVE_LINUX -Os -DMDNS_DEBUGMSGS=0 -c -fPIC -o
objects/prod/dnssd_ipc.c.so.o ../mDNSShared/dnssd_ipc.c
strip: Unable to recognise the format of the input file
`build/prod/libdns_sd.so'
make[1]: *** [build/prod/libdns_sd.so] Error 1
make[1]: Leaving directory
`/home/falingtrea/buildroot/build_arm_wchar/mDNSResponder-107.6/mDNSPosi
x'
make: ***
[/home/falingtrea/buildroot/build_arm_wchar/mDNSResponder-107.6/.built]
Error 2



Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
tbarr at multitech.com
