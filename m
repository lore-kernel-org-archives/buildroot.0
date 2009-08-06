From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  6 Aug 2009 21:55:08 +0000 (UTC)
Subject: [Buildroot] [Bug 545] New: Webkit doesn't see gtk-doc.make
Message-ID: <bug-545-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=545

              Host: i386-pc-linux-gnu
            Target: i386-pc-linux-uclibc
             Build: i386-pc-linux-gnu
           Summary: Webkit doesn't see gtk-doc.make
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: dandart at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Webkit doesn't see gtk-doc.make

rm -rf /home/dan/xenon/buildroot/project_build_i386/uclibc/buildroot-config
mkdir -p /home/dan/xenon/buildroot/project_build_i386/uclibc
cp -dpRf package/config/buildroot-config
/home/dan/xenon/buildroot/project_build_i386/uclibc/buildroot-config
/home/dan/xenon/buildroot/toolchain_build_i386/bin/sed -i -e
's/AUTOMAKE_FLAGS=.*/AUTOMAKE_FLAGS="--foreign --add-missing --copy"/'
/home/dan/xenon/buildroot/build_i386/webkit-r44552/autogen.sh
/home/dan/xenon/buildroot/toolchain_build_i386/bin/sed -i -e
's/LIBTOOLIZE_FLAGS=.*/LIBTOOLIZE_FLAGS="--force --automake --copy"/'
/home/dan/xenon/buildroot/build_i386/webkit-r44552/autogen.sh
# Don't run the configure step yet
cd /home/dan/xenon/buildroot/build_i386/webkit-r44552;
AUTOGEN_CONFIGURE_ARGS=--version ./autogen.sh
Warning: not running gtk-docize.
automake: cannot open < gtk-doc.make: No such file or directory
make: ***
[/home/dan/xenon/buildroot/build_i386/webkit-r44552/.stamp_hook_post_extract]
Error 1


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
