From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Oct 2020 06:07:40 +0000
Subject: [Buildroot] [Bug 13261] New: When doing lldpd 1.0.4 Configuring,
 error encountered: "checking if system libevent works as
 expected... configure: error: *** unusable system libevent"
Message-ID: <bug-13261-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13261

            Bug ID: 13261
           Summary: When doing lldpd 1.0.4 Configuring, error encountered:
                    "checking if system libevent works as expected...
                    configure: error: *** unusable system libevent"
           Product: buildroot
           Version: 2020.02.6
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: eric.hu at nokia-sbell.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8606
  --> https://bugs.busybox.net/attachment.cgi?id=8606&action=edit
build error log of libevent and lldpd

When doing lldpd 1.0.4 Configuring, error encountered: "checking if system
libevent works as expected... configure: error: *** unusable system libevent"

1. libevent was compiled successfully
11952 libevent-2.1.11-stable.tar.gz: OK (md5: 7f35cfe69b82d879111ec0d7b7b1c531)
11953 libevent-2.1.11-stable.tar.gz: OK (sha1:
a76bba0a281da9384d4be5b40f3907c07e21428c)

2. libevent installed to staging and target
erhu at 03:/repo/erhu/buildroot/output/staging>f|grep libevent
./usr/lib/pkgconfig/libevent_extra.pc
./usr/lib/pkgconfig/libevent_core.pc
./usr/lib/pkgconfig/libevent_openssl.pc
./usr/lib/pkgconfig/libevent.pc
./usr/lib/pkgconfig/libevent_pthreads.pc
./usr/lib/libevent_pthreads.la
./usr/lib/libevent_pthreads-2.1.so.7.0.0
./usr/lib/libevent_openssl.la
./usr/lib/libevent_openssl-2.1.so.7.0.0
./usr/lib/libevent_core.la
./usr/lib/libevent_core-2.1.so.7.0.0

erhu at 03:/repo/erhu/buildroot/output/target>f|grep libevent
./usr/lib/pkgconfig/libevent_extra.pc
./usr/lib/pkgconfig/libevent_core.pc
./usr/lib/pkgconfig/libevent_openssl.pc
./usr/lib/pkgconfig/libevent.pc
./usr/lib/pkgconfig/libevent_pthreads.pc
./usr/lib/libevent_pthreads.la
./usr/lib/libevent_pthreads-2.1.so.7.0.0
./usr/lib/libevent_openssl.la
./usr/lib/libevent_openssl-2.1.so.7.0.0
./usr/lib/libevent_core.la
./usr/lib/libevent_core-2.1.so.7.0.0

3. When doing configure to lldpd before compiling, following configure error
encountered.
checking for libevent... yes 
checking if system libevent works as expected... configure: error: *** unusable
system libevent
make: *** [/repo/erhu/buildroot/output/build/lldpd-1.0.4/.stamp_configured]
Error 1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
