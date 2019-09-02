From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 02 Sep 2019 21:01:36 +0000
Subject: [Buildroot] [Bug 12171] New: Python-opencv needs config.py and
 config-3.7.py to run. Only the *.pyc is not enough.
Message-ID: <bug-12171-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12171

            Bug ID: 12171
           Summary: Python-opencv needs config.py and config-3.7.py to
                    run. Only the *.pyc is not enough.
           Product: buildroot
           Version: 2019.08
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ivan.nazarenko at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When importing cv2 in python 3.7, the program stops with:

  File "usr/lib/python3.7/site-packages/cv2/__init__.py", line 89, in <module>
  File "usr/lib/python3.7/site-packages/cv2/__init__.py", line 58, in bootstrap
  File "usr/lib/python3.7/site-packages/cv2/__init__.py", line 56, in
load_first_config
ImportError: OpenCV loader: missing configuration file: ['config.py']. Check
OpenCV installation.

Since buildroot removed all *.py, leaving the corresponding *.pyc, the above
config.py file is not in target. But these two files are currently needed
uncompiled for "import cv2".

We can of course specify BR2_PACKAGE_PYTHON3_PY_PYC=y, but this would make all
*.py in target, which is sort of a waste.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
