From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 20 Nov 2019 14:08:47 +0000
Subject: [Buildroot] [Bug 12331] New: meson issue
Message-ID: <bug-12331-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12331

            Bug ID: 12331
           Summary: meson issue
           Product: buildroot
           Version: 2019.02.7
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jpcartal at free.fr
                CC: buildroot at uclibc.org
  Target Milestone: ---

Meson script uses full path to python3 when executed which gives errors when
the path is too long :

$ cat host/bin/meson 
#!/home/Dev/Ssd/buildroot/buildroot-2019.02.7/host/bin/python3
# EASY-INSTALL-ENTRY-SCRIPT: 'meson==0.49.0','console_scripts','meson'
__requires__ = 'meson==0.49.0'
import re
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])
    sys.exit(
        load_entry_point('meson==0.49.0', 'console_scripts', 'meson')()
    )

-- 
You are receiving this mail because:
You are on the CC list for the bug.
