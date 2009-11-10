From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Nov 2009 17:08:37 +0000 (UTC)
Subject: [Buildroot] [Bug 701] New: make install problem with unstripped
	binaries
Message-ID: <bug-701-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=701

           Summary: make install problem with unstripped binaries
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: llandwerlin at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi,

when BR2_STRIP_none=y, I get this error :

>>> libglib2 2.20.5 Installing to target
/usr/bin/make -j1
DESTDIR=/home/users/llandwer/local/src/buildroot/output/target  install-strip
-C /home/users/llandwer/local/src/buildroot/output/build/libglib2-2.20.5/
make[1]: Entering directory `/local/src/buildroot/output/build/libglib2-2.20.5'
/usr/bin/make  INSTALL_PROGRAM="/bin/sh
/home/users/llandwer/local/src/buildroot/output/build/libglib2-2.20.5/install-sh
-c -s" \
          install_sh_PROGRAM="/bin/sh
/home/users/llandwer/local/src/buildroot/output/build/libglib2-2.20.5/install-sh
-c -s" INSTALL_STRIP_FLAG=-s \
          `test -z 'true -Not_stripping' || \
            echo "INSTALL_PROGRAM_ENV=STRIPPROG=true -Not_stripping"` install
/usr/bin/make: invalid option -- N
Usage: make [options] [target] ...
Options:
  -b, -m                      Ignored for compatibility.
  -B, --always-make           Unconditionally make all targets.
  -C DIRECTORY, --directory=DIRECTORY


I'm currently trying to fix it with the attached patch.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
