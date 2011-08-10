From: Pedro Sanchez <psanchez@fosstel.com>
Date: Wed, 10 Aug 2011 15:18:52 -0400
Subject: [Buildroot] Python standard library problems
Message-ID: <4E42D99C.7080806@fosstel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm testing Python 2.7.1 as available in current BR and I find that I 
can't load several standard modules that otherwise seem to be present.

# python
Python 2.7.1 (r271:86832, Aug  4 2011, 16:19:27)
[GCC 4.5.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
 >>> import socket
Traceback (most recent call last):
   File "<stdin>", line 1, in <module>
   File "/usr/lib/python2.7/socket.py", line 47, in <module>
ImportError: No module named _socket

 >>> import fcntl
Traceback (most recent call last):
   File "<stdin>", line 1, in <module>
ImportError: No module named fcntl

 >>> from subprocess import Popen, PIPE
Traceback (most recent call last):
   File "<stdin>", line 1, in <module>
   File "/usr/lib/python2.7/subprocess.py", line 428, in <module>
ImportError: No module named select


Any ideas what's going on? This is on BR from git.

-- 
Pedro
