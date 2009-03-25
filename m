From: Tobias McNulty <tobias@caktusgroup.com>
Date: Tue, 24 Mar 2009 23:57:36 -0400
Subject: [Buildroot] using linux 2.4 headers AND python
In-Reply-To: <877i2ejzrj.fsf@macbook.be.48ers.dk>
References: <49C9614C.6010205@caktusgroup.com>
	<877i2ejzrj.fsf@macbook.be.48ers.dk>
Message-ID: <49C9ABB0.8080501@caktusgroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> The 2009.02 release had support for 2.4.41 if you go to build
> options->Show packages that are deprecated or obsolete, but we have
> removed it from subversion after the release.
> 
> Notice though that there aren't many people using the 2.4 support, so
> something might not work ..

Thanks that seemed to work.  I had to add some typedefs for __u32 and
__u8 to watchdog.h but otherwise it built fine.  There is probably a
smarter fix.

Upon further investigation Python doesn't seem to be complete though:

$ python -v
Could not find platform independent libraries <prefix>
Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
# installing zipimport hook
import zipimport # builtin
# installed zipimport hook
'import site' failed; traceback:
ImportError: No module named site
Python 2.4.5 (#1, Mar 24 2009, 23:15:27)
[GCC 4.3.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import os
Traceback (most recent call last):
  File "<stdin>", line 1, in ?
ImportError: No module named os
>>>

and, sure enough, I don't see os.py anywhere on the filesystem.  I have
not looked at the python build output yet but I'll do that tomorrow when
I'm more awake.

(It was also this way before the rebuild, the switch to 2.4 did not
introduce the problem.)

Toby
-- 
Tobias McNulty
Caktus Consulting Group, LLC
P.O. Box 1454
Carrboro, NC 27510
(919) 951-0052
http://www.caktusgroup.com
