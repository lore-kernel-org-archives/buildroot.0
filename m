From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  5 Jan 2010 12:42:16 +0000 (UTC)
Subject: [Buildroot] [Bug 841] New: Build error
Message-ID: <bug-841-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=841

            Target: ARM 920 (AT91RM9200)
           Summary: Build error
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: peter.stosz at freemail.hu
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


/srv/buildroot/output/staging/usr/bin/arm-linux-uclibc-gcc
-L/srv/buildroot/output/staging/lib -L/srv/buildroot/output/staging/usr/lib
--sysroot=/srv/buildroot/output/staging/ -o
/srv/buildroot/output/build/mtd_orig/serve_image
/srv/buildroot/output/build/mtd_orig/serve_image.o
/srv/buildroot/output/build/mtd_orig/crc32.o
/srv/buildroot/output/build/mtd_orig/fec.o
/srv/buildroot/output/build/mtd_orig/fec.o: In function `fec_encode_linear':
/srv/buildroot/output/build/mtd_orig/fec.c:754: undefined reference to `bcopy'
/srv/buildroot/output/build/mtd_orig/fec.o: In function `fec_encode':
/srv/buildroot/output/build/mtd_orig/fec.c:734: undefined reference to `bcopy'
/srv/buildroot/output/build/mtd_orig/fec.o: In function `build_decode_matrix':
/srv/buildroot/output/build/mtd_orig/fec.c:822: undefined reference to `bcopy'
/srv/buildroot/output/build/mtd_orig/fec.o: In function `invert_mat':
/srv/buildroot/output/build/mtd_orig/fec.c:516: undefined reference to `bcmp'
/srv/buildroot/output/build/mtd_orig/fec.o: In function `fec_decode':
/srv/buildroot/output/build/mtd_orig/fec.c:883: undefined reference to `bcopy'
collect2: ld returned 1 exit status
make[1]: *** [/srv/buildroot/output/build/mtd_orig/serve_image] Error 1
rm /srv/buildroot/output/build/mtd_orig/nandwrite.o
/srv/buildroot/output/build/mtd_orig/docfdisk.o
/srv/buildroot/output/build/mtd_orig/mtd_debug.o
/srv/buildroot/output/build/mtd_orig/flash_otp_dump.o
/srv/buildroot/output/build/mtd_orig/rfdformat.o
/srv/buildroot/output/build/mtd_orig/nftldump.o
/srv/buildroot/output/build/mtd_orig/flash_info.o
/srv/buildroot/output/build/mtd_orig/flash_unlock.o
/srv/buildroot/output/build/mtd_orig/flash_lock.o
/srv/buildroot/output/build/mtd_orig/flashcp.o
/srv/buildroot/output/build/mtd_orig/nftl_format.o
/srv/buildroot/output/build/mtd_orig/doc_loadbios.o
/srv/buildroot/output/build/mtd_orig/flash_erase.o
/srv/buildroot/output/build/mtd_orig/ftl_format.o
/srv/buildroot/output/build/mtd_orig/rfddump.o
/srv/buildroot/output/build/mtd_orig/nandtest.o
/srv/buildroot/output/build/mtd_orig/nanddump.o
/srv/buildroot/output/build/mtd_orig/flash_otp_info.o
/srv/buildroot/output/build/mtd_orig/ftl_check.o
make[1]: Leaving directory `/srv/buildroot/output/build/mtd_orig'
make: *** [/srv/buildroot/output/build/mtd_orig/flash_erase] Error 2


Workaround: output/build/mtd_orig/fec.c:52 <-- comment #ifdef MSDOS


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
