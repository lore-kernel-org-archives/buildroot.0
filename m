From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 31 May 2017 16:31:48 +0000
Subject: [Buildroot] [Bug 9921] New: lockfile module within python-daemon
	not available
Message-ID: <bug-9921-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9921

            Bug ID: 9921
           Summary: lockfile module within python-daemon not available
           Product: buildroot
           Version: 2017.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: reto.rayen at outlook.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi guys

we found a bug which is encountering when we use the python-daemon to run a
script as a daemon. When we want to start the daemon. It always fails because
the lockfile within the python-daemon is not available. Can you please add this
to the standard buildroot image when the package "python-daemon" gets compiled.
We encounter the issue with python2 and python3. In both versions it's not
included. Below you can find a error trace:

Traceback (most recent call last):
  File "/usr/local/bin/bender-daemon", line 9, in <module>
    from daemon import runner
  File
"/home/deployer/projects/buildroot-2017.02.2/output/target/usr/lib/python3.5/site-packages/daemon/runner.py",
line 33, in <module>
ImportError: No module named 'lockfile'

-- 
You are receiving this mail because:
You are on the CC list for the bug.
