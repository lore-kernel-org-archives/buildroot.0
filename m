From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Mar 2017 18:26:30 +0000
Subject: [Buildroot] [Bug 9766] New: support/scripts/pkgutil.py conflicts
 with the pkgutil.py from setuptools => breaks scanpypi (2017.02)
Message-ID: <bug-9766-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9766

            Bug ID: 9766
           Summary: support/scripts/pkgutil.py conflicts with the
                    pkgutil.py from setuptools => breaks scanpypi
                    (2017.02)
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: timo.valimaki at sensoan.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Asked the following in Stackoverflow:

"I'm trying to run the scanpypi script - support script of the Buildroot
(2017.02) but I'm getting the ImportError: cannot import name get_importer.

Traceback (most recent call last): File "./support/scripts/scanpypi", line 52,
in import setuptools File
"/usr/local/lib/python2.7/dist-packages/setuptools/init.py", line 12, in import
setuptools.version File
"/usr/local/lib/python2.7/dist-packages/setuptools/version.py", line 1, in
import pkg_resources File
"/usr/local/lib/python2.7/dist-packages/pkg_resources/init.py", line 40, in
from pkgutil import get_importer ImportError: cannot import name get_importer

I added the following lines into beginning of the scanpypi script to see
sys.path

    import sys
    print(sys.path)

output:

['/home/timo/bldr_lab/buildroot/support/scripts', '/usr/lib/python2.7',
'/usr/lib/python2.7/plat-x86_64-linux-gnu', '/usr/lib/python2.7/lib-tk',
'/usr/lib/python2.7/lib-old', '/usr/lib/python2.7/lib-dynload',
'/usr/local/lib/python2.7/dist-packages', '/usr/lib/python2.7/dist-packages']

As the pkgutil is in the /usr/lib/python2.7 directory the problem is not path
problem.

I have also uninstalled and re-installed python2.7, pip and setuptools but no
help.

What could be reason for the ImportError?"


Got the response:


This is a bug in Buildroot. It is due to commit
12683184b1969f65680cb7db55b547a620a9860f that introduced the pkgutil.py file in
support/scripts. This conflicts with the pkgutil.py from setuptools.

The solution is to rename the pkgutil.py file to something else, and update the
imports in the other scripts accordingly. If you do this, please post a patch
on the Buildroot mailing list, so everyone can benefit. See the manual for
details how to post patches.


http://stackoverflow.com/questions/42892298/import-error-cannot-import-name-get-importer.

Need to practice script creating ...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
