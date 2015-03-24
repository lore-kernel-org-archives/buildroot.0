From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 24 Mar 2015 20:43:41 +0000 (UTC)
Subject: [Buildroot] [Bug 7971] New: python-flask,
	python-flask. No module named zlib
Message-ID: <bug-7971-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7971

           Summary: python-flask, python-flask. No module named zlib
           Product: buildroot
           Version: 2015.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: nikita_23k at mail.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Target: raspberry pi 1
Host: Linux Mint 17.1

I'm trying to run a web-server using python-flask. A similar problem with
http://git.buildroot.net/buildroot/commit/?id=82e23f15a11c2cd66d0f6c6397906663c9c9e1d7

My steps:
1. cd /home/n1/test
2. download buildroot
3. cd buildroot
4. make nconfig # add nano, python (2.*), python-flask (zlib added auto)
,wchar, etc (for rpi)
6. make
7. upload to sd card

When I run the project (python-flask) on rpi:

from flask import Flask
app = Flask(__name__)
@app.route("/")
def hello():
  return "Hello World!"
  app.run()

I get an error:
 traceback (most recent call last):
   File "test.py", line 1 in, in <module>
     from flask import Flask
      File
"home/n1/test/buildroot/output/target/usr/lib/python2.7/site-packeges/flask/__init__.py,
line 17, in <module>
      File
"home/n1/test/buildroot/output/target/usr/lib/python2.7/site-packeges/werkzeug/__init__.py,
line 154, in <module>
...
   ImportError: No module named zlib

I tried to compile with the help of https://github.com/gamaral/rpi-buildroot ,
but got the same error. My bug report:
https://github.com/gamaral/rpi-buildroot/issues/34

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
