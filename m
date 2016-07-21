From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 21 Jul 2016 09:10:35 +0000
Subject: [Buildroot] [Bug 9096] New: rootfs.ubi not created
Message-ID: <bug-9096-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9096

            Bug ID: 9096
           Summary: rootfs.ubi not created
           Product: buildroot
           Version: 2016.02
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: matthias.wieloch at few-bauer.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

When I select to create an embedded UBI Image with buildroot 2016.02 and newer
the creation fails with:
iniparser: cannot open <BR_PATH>/output/build/ubinize.cfg
ubinize: error!: cannot load the input ini file
"/<BR_PATH>/output/build/ubinize.cfg"

With buildroot 2015.08.1 the creation still works.

I know this tells me that the ubinize.cfg is missing but in all versions
following line is added to the fakeroot script _fakeroot.fs
        /usr/bin/install -m 0644 fs/ubifs/ubinize.cfg
<BR_PATH>/output/build/ubinize.cfg ;

I tested it with default configs for sama5d4_xplained.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
