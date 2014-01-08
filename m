From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  8 Jan 2014 14:20:57 +0000 (UTC)
Subject: [Buildroot] [Bug 6770] New: openssl bump
Message-ID: <bug-6770-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6770

           Summary: openssl bump
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Other
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mlweber1 at rockwellcollins.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Noticed a couple packages failing after the openssl bump 
(http://git.buildroot.net/buildroot/commit/?id=757690a262fa050ee18847ecee02672f16383b49)

netsnmp   (arm build) 
....
"checking for authentication support... configure: error: Asked to use OpenSSL
but I couldn't find it."
...

wpa_supplicant  (ppc build) 
....
  LD  wpa_cli
  CC  ../src/crypto/crypto_openssl.c
/accts/mlweber1/proj/br-continuous/cfgs/30-fis-x86-glibc-ext/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(dso_dlfcn.o):
In function `dlfcn_globallookup':
dso_dlfcn.c:(.text+0x21): undefined reference to `dlopen'
dso_dlfcn.c:(.text+0x37): undefined reference to `dlsym'
...


I've attached configs to reproduce and error logs.  I won't get a chance to
investigate these for ~week, but should have some time to test if someone beats
me to a fix :-)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
