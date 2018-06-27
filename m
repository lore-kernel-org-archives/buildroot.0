From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Jun 2018 18:36:57 +0000
Subject: [Buildroot] [Bug 11116] New: Buildroot should set PYTHON_EGG_CACHE
 instead of writing files to ~/.python-eggs
Message-ID: <bug-11116-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11116

            Bug ID: 11116
           Summary: Buildroot should set PYTHON_EGG_CACHE instead of
                    writing files to ~/.python-eggs
           Product: buildroot
           Version: 2015.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: lotorev at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

There is PYTHON_EGG_CACHE variable for overriding directory for eggs files.

Buildroot should not use $HOME/.python-eggs directory and should set
PYTHON_EGG_CACHE internally to be independent on extra directories as less as
possible.

Existing packages in default $HOME/.python-eggs can influence on build
reproducibility.

Think of multiple Jenkins jobs building in parallel and using the same
$HOME/.python-eggs directory.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
