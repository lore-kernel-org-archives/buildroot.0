From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 24 Dec 2016 12:22:17 +0000
Subject: [Buildroot] [Bug 9506] New: Collectd 5.7.0 fails to build with
	libcrypt
Message-ID: <bug-9506-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9506

            Bug ID: 9506
           Summary: Collectd 5.7.0 fails to build with libcrypt
           Product: buildroot
           Version: 2016.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: fli4l at franke-prem.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

On my build-system without libcrypt on host the building of collectd-5.7.0 fail
by building. It looks for me, as that collectd will not look during the build
in the $(STAGING). It will look on the host for the need files. On my host i
have no libcrypt, but it will be build as packet.
The error i get will be:
  CCLD     collectdctl
  CCLD     collectd-tg
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_close'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_read'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_setkey'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_control'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_setkey'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_randomize'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_write'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_open'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_ctl'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_hash_buffer'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_close'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_encrypt'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_open'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_check_version'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_setiv'
collect2: error: ld returned 1 exit status
make[4]: *** [Makefile:4064: collectd-nagios] Error 1
make[4]: *** Waiting for unfinished jobs....
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_close'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_read'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_setkey'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_control'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_setkey'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_randomize'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_write'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_open'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_ctl'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_hash_buffer'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_close'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_encrypt'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_open'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_check_version'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_setiv'
collect2: error: ld returned 1 exit status
make[4]: *** [Makefile:4072: collectdctl] Error 1
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_close'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_read'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_setkey'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_control'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_setkey'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_randomize'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_write'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_open'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_ctl'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_hash_buffer'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_close'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_encrypt'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_md_open'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_check_version'
libcollectdclient/.libs/libcollectdclient.so: undefined reference to
`gcry_cipher_setiv'
collect2: error: ld returned 1 exit status
make[4]: *** [Makefile:4068: collectd-tg] Error 1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
