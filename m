From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2020 02:31:38 +0000
Subject: [Buildroot] [Bug 13126] New: make fails - bzip2-1.0.6.tar.gz and
 DirectFB-1.7.7.tar.gz aren't tarballs
Message-ID: <bug-13126-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13126

            Bug ID: 13126
           Summary: make fails - bzip2-1.0.6.tar.gz and
                    DirectFB-1.7.7.tar.gz aren't tarballs
           Product: buildroot
           Version: 2018.02
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: chuckb at craniac.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I'm cross-compiling for ARCH=arm on a 32-bit Fedora-27 system, (64-bit) Xeon
processor.  All packages upgraded with yum as of July 29, 2020.

Executing make, the build fails when it gets to bzip2-1.0.6.tar.gz and then
DirectFB-1.7.7.tar.gz

The problem appears to be that these files, as downloaded during the build, are
not tarballs.  They're uncompressed html files.

When I retrieved files of the same names from sources.buildroot.net, the build
appears to proceed normally.  I'm new at this, so it's possible there will be
problems later, but for now the build is continuing.

My config uses default file sources:
- sources.buildroot.net
- cdn.kernel.org/pub
- ftpmirror.gnu.org
- rocks.moonscript.org
- cpan.metacpan.org

buildroot cloned on July 29, 2020.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
