From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jul 2013 17:42:37 +0000 (UTC)
Subject: [Buildroot] [Bug 6374] New: gnutls package broken if linux
 cryptodev module selected
Message-ID: <bug-6374-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6374

           Summary: gnutls package broken if linux cryptodev module
                    selected
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rjbarnet at rockwellcollins.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


With the latest version of buildroot from the git repository as of 7/10/2013 -
2013.08-git-00452-gcca5538 - if the BR2_PACKAGE_CRYPTODEV_LINUX is selected the
package BR2_PACKAGE_GNUTLS will not build successfully as the following error
occurs during a build:

  CC     ocsp_output.lo
  CCLD   libgnutls_x509.la
make[4]: Leaving directory
`/home/rjbarnet/projects/eicu/selinux/buildroot/output/build/gnutls-3.2.1/lib/x509'
Making all in accelerated
make[4]: Entering directory
`/home/rjbarnet/projects/eicu/selinux/buildroot/output/build/gnutls-3.2.1/lib/accelerated'
make[5]: Entering directory
`/home/rjbarnet/projects/eicu/selinux/buildroot/output/build/gnutls-3.2.1/lib/accelerated'
  CC     accelerated.lo
  CC     cryptodev.lo
  CC     cryptodev-gcm.lo
cryptodev.c:359:3: error: unknown field 'reset' specified in initializer
cryptodev.c:361:1: warning: initialization from incompatible pointer type
[enabled by default]
cryptodev.c:361:1: warning: (near initialization for 'mac_struct.fast')
[enabled by default]
cryptodev.c:410:3: error: unknown field 'reset' specified in initializer
make[5]: *** [cryptodev.lo] Error 1
make[5]: *** Waiting for unfinished jobs....
make[5]: Leaving directory
`/home/rjbarnet/projects/eicu/selinux/buildroot/output/build/gnutls-3.2.1/lib/accelerated'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/home/rjbarnet/projects/eicu/selinux/buildroot/output/build/gnutls-3.2.1/lib/accelerated'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/rjbarnet/projects/eicu/selinux/buildroot/output/build/gnutls-3.2.1/lib'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/rjbarnet/projects/eicu/selinux/buildroot/output/build/gnutls-3.2.1'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/rjbarnet/projects/eicu/selinux/buildroot/output/build/gnutls-3.2.1'
make: ***
[/home/rjbarnet/projects/eicu/selinux/buildroot/output/build/gnutls-3.2.1/.stamp_built]
Error 2

This worked with the 2013.05 official release version of buildroot.

Thanks,
-Ryan

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
