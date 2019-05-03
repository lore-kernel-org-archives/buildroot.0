From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 May 2019 14:08:34 +0000
Subject: [Buildroot] [Bug 11831] python-pyparsing: "No module named
 'pyparsing'" on target / while building cantools
In-Reply-To: <bug-11831-163@https.bugs.busybox.net/>
References: <bug-11831-163@https.bugs.busybox.net/>
Message-ID: <bug-11831-163-gD8H2tQeaj@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11831

--- Comment #6 from Tibor Stolz <tistolz@outlook.de> ---
The build log for python-cantools in detail:

>>> python-cantools 18.0.1 Downloading
cantools-18.0.1.tar.gz: OK (sha256:
dc5d265103b8b11d4c7cc21996ad1954325b1f1930837505cabb0b5b137d37ee)
>>> python-cantools 18.0.1 Extracting
gzip -d -c
/home/tibor/Buildroot/buildroot-2019.02.2/dl/python-cantools/cantools-18.0.1.tar.gz
| tar --strip-components=1 -C
/home/tibor/Buildroot/buildroot-2019.02.2/output/build/python-cantools-18.0.1  
-xf -
>>> python-cantools 18.0.1 Patching
>>> python-cantools 18.0.1 Configuring
>>> python-cantools 18.0.1 Building
(cd
/home/tibor/Buildroot/buildroot-2019.02.2/output/build/python-cantools-18.0.1//;
_PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata_m_linux_arm-linux-gnueabihf"
PATH="/home/tibor/Buildroot/buildroot-2019.02.2/output/host/bin:/home/tibor/Buildroot/buildroot-2019.02.2/output/host/sbin:/home/tibor/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
PYTHONPATH="/home/tibor/Buildroot/buildroot-2019.02.2/output/target/usr/lib/python3.7/"
PYTHONNOUSERSITE=1
_python_sysroot=/home/tibor/Buildroot/buildroot-2019.02.2/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot
_python_prefix=/usr _python_exec_prefix=/usr 
/home/tibor/Buildroot/buildroot-2019.02.2/output/host/bin/python setup.py build
 )
Traceback (most recent call last):
  File "setup.py", line 4, in <module>
    import cantools
  File
"/home/tibor/Buildroot/buildroot-2019.02.2/output/build/python-cantools-18.0.1/cantools/__init__.py",
line 6, in <module>
    from . import db
  File
"/home/tibor/Buildroot/buildroot-2019.02.2/output/build/python-cantools-18.0.1/cantools/db/__init__.py",
line 4, in <module>
    from .database import Database
  File
"/home/tibor/Buildroot/buildroot-2019.02.2/output/build/python-cantools-18.0.1/cantools/db/database.py",
line 3, in <module>
    from .formats import dbc
  File
"/home/tibor/Buildroot/buildroot-2019.02.2/output/build/python-cantools-18.0.1/cantools/db/formats/dbc.py",
line 4, in <module>
    from pyparsing import Word
ModuleNotFoundError: No module named 'pyparsing'
package/pkg-generic.mk:238: recipe for target
'/home/tibor/Buildroot/buildroot-2019.02.2/output/build/python-cantools-18.0.1/.stamp_built'
failed
make[1]: ***
[/home/tibor/Buildroot/buildroot-2019.02.2/output/build/python-cantools-18.0.1/.stamp_built]
Error 1
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
