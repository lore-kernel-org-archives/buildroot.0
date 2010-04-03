From: Thomas Brandstetter <thomas.brandstetter@me.com>
Date: Sat, 03 Apr 2010 14:39:12 +0200
Subject: [Buildroot] 2.6.33.2 kernel headers patch
Message-ID: <3C3F38C6-6CB3-4F69-ACF7-3229CB42C39F@me.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Today I tried buildroot with the latest kernel headers. I got the following error with udev:


/buildroot/build_x86/output/staging/usr/include/scsi/scsi.h:152: error: expected specifier-qualifier-list before 'u8'
/buildroot/build_x86/output/staging/usr/include/scsi/scsi.h: In function 'scsi_varlen_cdb_length':
/buildroot/build_x86/output/staging/usr/include/scsi/scsi.h:163: error: 'struct scsi_varlen_cdb_hdr' has no member named 'additional_cdb_length'
make[2]: *** [scsi_serial.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory `/buildroot/build_x86/output/build/udev-114/extras/scsi_id'
make[1]: *** [all] Error 1
make[1]: Leaving directory `/buildroot/build_x86/output/build/


This error indicates, that the patch:

linux-2.6.32.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch

should also be applied to the latest kernel headers eq.

linux-2.6.33.2-scsi-use-__uX-types-for-headers-exported-to-user-space.patch

Can someone confirm this?

THX

Thomas
