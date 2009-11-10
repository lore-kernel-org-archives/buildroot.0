From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Nov 2009 17:22:21 +0000 (UTC)
Subject: [Buildroot] [Bug 703] New: [SECURITY] Update openssl package to
	0.9.8l
Message-ID: <bug-703-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=703

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: [SECURITY] Update openssl package to 0.9.8l
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=731)
 --> (https://bugs.busybox.net/attachment.cgi?id=731)
Bump openssl package to 0.9.8l + security fixes

http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-1377
The dtls1_buffer_record function in ssl/d1_pkt.c in OpenSSL 0.9.8k and earlier
0.9.8 versions allows remote attackers to cause a denial of service (memory
consumption) via a large series of "future epoch" DTLS records that are
buffered in a queue, aka "DTLS record buffer limitation bug." 

http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-1378
Multiple memory leaks in the dtls1_process_out_of_seq_message function in
ssl/d1_both.c in OpenSSL 0.9.8k and earlier 0.9.8 versions allow remote
attackers to cause a denial of service (memory consumption) via DTLS records
that (1) are duplicates or (2) have sequence numbers much greater than current
sequence numbers, aka "DTLS fragment handling memory leak." 

http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-1379
Use-after-free vulnerability in the dtls1_retrieve_buffered_fragment function
in ssl/d1_both.c in OpenSSL 1.0.0 Beta 2 allows remote attackers to cause a
denial of service (openssl s_client crash) and possibly have unspecified other
impact via a DTLS packet, as demonstrated by a packet from a server that uses a
crafted server certificate.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
