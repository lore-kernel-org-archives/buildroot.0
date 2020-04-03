From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 Apr 2020 22:27:47 +0000
Subject: [Buildroot] [Bug 12751] New: OpenJdk package installation issues on
 target
Message-ID: <bug-12751-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12751

            Bug ID: 12751
           Summary: OpenJdk package installation issues on target
           Product: buildroot
           Version: 2020.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ameya.joshi at rockwellcollins.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

The current openjdk package INSTALL_TARGET_CMD installs only the lib and bin
folder to /usr/lib

the JRE/lib folder contains a modules file which in conflict with modules
directory which has kernel modules

i am doing a x86_64 build , the lib is symlinked to /usr/lib on target and all
kernel modules get installed /lib/modules

Sometimes the overwrite works during copy and kernel modules get replaced by
java modules file

cp -dpfr $(@D)/build/linux-*-release/images/jre/lib/* $(TARGET_DIR)/usr/lib/

Here is the error i have gotten:

>>> openjdk 13.0.2+8 Installing to target
cp -dpfr
/bulk/ajoshi2/nuc-build/build/openjdk-13.0.2+8/build/linux-*-release/images/jre/bin/*
/bulk/ajoshi2/nuc-build/target/usr/bin/
cp -dpfr
/bulk/ajoshi2/nuc-build/build/openjdk-13.0.2+8/build/linux-*-release/images/jre/lib/*
/bulk/ajoshi2/nuc-build/target/usr/lib/
cp: cannot overwrite directory ?/bulk/ajoshi2/nuc-build/target/usr/lib/modules?
with non-directory

Can we update the INSTALL_TARGET_CMDS for openjdk to install the entire JDK
inside /usr/lib/jvm folder and symlink the binaries?

Regards,
Ameya Joshi
Sr Software Engineer
Collins Aerospace

-- 
You are receiving this mail because:
You are on the CC list for the bug.
