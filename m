From: pborut123 <pborut123@gmail.com>
Date: Mon, 04 Jul 2016 17:06:46 +0200
Subject: [Buildroot] Version 2016.05: Python 3.5.1. Building python packages
 . error: Download error on https://pypi.python.org/simple/: unknown url
 type: https
Message-ID: <577A7B86.2030001@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
Searching for solution I've found that this error is connected with ssl 
access in buildroot's host python3 installation.
If I run exact python3 from buildroot (./output/host/usr/bin/python3) 
and enter code to test https connection:

Python 3.5.1 (default, Jul  3 2016, 21:09:24)
[GCC 4.8.4] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>from urllib.request import urlopen
>>>urlopen('https://askubuntu.com').read()
Traceback (most recent call last):
   File "<stdin>", line 1, in <module>
   File 
"/home/pborut/strhub/2/buildroot2/output/host/usr/lib/python3.5/urllib/request.py", 
line 162, in urlopen
     return opener.open(url, data, timeout)
  ...
   File 
"/home/pborut/strhub/2/buildroot2/output/host/usr/lib/python3.5/urllib/request.py", 
line 1310, in unknown_open
     raise URLError('unknown url type: %s' % type)
urllib.error.URLError: <urlopen error unknown url type: https>

which is same error message I get while building module.

I have built buildroot configuration with python3, I have ssl option 
checked, I have openssl package also selected.

I'm running 64-bit LinuxMint vm (ubuntu) with Python3 3.4.3, works normal.

Do you have any suggestion on what else to check to get over this issue?

Best regards,
Borut.
