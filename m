From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 23 Nov 2019 16:47:20 +0000
Subject: [Buildroot] [Bug 12346] New: Python 3.8/GObject on 2019-11rc2
Message-ID: <bug-12346-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12346

            Bug ID: 12346
           Summary: Python 3.8/GObject on 2019-11rc2
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: info at hifiberry.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The 201911 release have been upgraded to Python 3.8. However, the included
python-gobject is incompatible with Python 3.8:

Python 3.8.0 (default, Nov 23 2019, 09:12:01) 
[GCC 8.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import gobject
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.8/site-packages/gobject/__init__.py", line 26, in
<module>
    from glib import spawn_async, idle_add, timeout_add, timeout_add_seconds, \
  File "/usr/lib/python3.8/site-packages/glib/__init__.py", line 22, in
<module>
    from glib._glib import *
SystemError: initialization of _glib raised unreported exception

An alternative to python gobject would be python GI, but this requires
introspection. As far as I understand this is not yet working.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
