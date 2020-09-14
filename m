From: Stefan =?ISO-8859-1?Q?M=FCller?= <s.mueller@zzeroo.com>
Date: Mon, 14 Sep 2020 17:35:09 +0200
Subject: [Buildroot] Error: host-python3-3.8.5;
 ModuleNotFoundError: No module named 'msvcrt'
Message-ID: <36d2e48cec0b9e6c8ed130745db2c9bcfe383c95.camel@zzeroo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


I try to build my buildroot project with the latest buildroot master on a arch linux box.
I get an error while building host-python3. `make clean` and `make
host-python-dirclean` don't solve the issue.

   Traceback (most recent call last):
     File "/mnt/src/Buildroot/xmz-firmware/make/build/host-python3-
   3.8.5/Lib/subprocess.py", line 64, in <module>
       import msvcrt
   ModuleNotFoundError: No module named 'msvcrt'

   During handling of the above exception, another exception occurred:

   Traceback (most recent call last):
     File "./setup.py", line 13, in <module>
       from distutils import log
     File "/home/smueller/.local/lib/python3.8/site-
   packages/_distutils_hack/__init__.py", line 82, in create_module
       return importlib.import_module('._distutils', 'setuptools')
     File "/mnt/src/Buildroot/xmz-firmware/make/build/host-python3-
   3.8.5/Lib/importlib/__init__.py", line 127, in import_module
       return _bootstrap._gcd_import(name[level:], package, level)
     File "/home/smueller/.local/lib/python3.8/site-
   packages/setuptools/__init__.py", line 8, in <module>
       import _distutils_hack.override  # noqa: F401
     File "/home/smueller/.local/lib/python3.8/site-
   packages/_distutils_hack/override.py", line 1, in <module>
       __import__('_distutils_hack').do_override()
     File "/home/smueller/.local/lib/python3.8/site-
   packages/_distutils_hack/__init__.py", line 64, in do_override
       ensure_local_distutils()
     File "/home/smueller/.local/lib/python3.8/site-
   packages/_distutils_hack/__init__.py", line 51, in
   ensure_local_distutils
       core = importlib.import_module('distutils.core')
     File "/mnt/src/Buildroot/xmz-firmware/make/build/host-python3-
   3.8.5/Lib/importlib/__init__.py", line 127, in import_module
       return _bootstrap._gcd_import(name[level:], package, level)
     File "/home/smueller/.local/lib/python3.8/site-
   packages/setuptools/_distutils/core.py", line 16, in <module>
       from distutils.dist import Distribution
     File "/home/smueller/.local/lib/python3.8/site-
   packages/setuptools/_distutils/dist.py", line 19, in <module>
       from distutils.util import check_environ, strtobool,
   rfc822_escape
     File "/home/smueller/.local/lib/python3.8/site-
   packages/setuptools/_distutils/util.py", line 14, in <module>
       from distutils.spawn import spawn
     File "/home/smueller/.local/lib/python3.8/site-
   packages/setuptools/_distutils/spawn.py", line 11, in <module>
       import subprocess
     File "/mnt/src/Buildroot/xmz-firmware/make/build/host-python3-
   3.8.5/Lib/subprocess.py", line 69, in <module>
       import _posixsubprocess
   ModuleNotFoundError: No module named '_posixsubprocess'
   make[2]: *** [Makefile:616: sharedmods] Error 1
   make[1]: *** [package/pkg-generic.mk:250: /mnt/src/Buildroot/xmz-
   firmware/make/build/host-python3-3.8.5/.stamp_built] Error 2
   make: *** [Makefile:23: _all] Error 2


-- 
mit freundlichem Gru?,
Yours sincerely,
Stefan M?ller
- IT Systemkaufmann -

Stefan M?ller - Hard.- und Software Entwicklung
Am Wasserwerk 4
04654 Frohburg

Tel:	+49 160 97 96 65 28
Mail:	s.mueller at zzeroo.com
Web:	https://zzeroo.com
PGP:	9A6C 0EC3 6C0B ED42 F61A  AD99 E27C 8E9D F3FE 2E7C
	https://www.zzeroo.com/imprint
IBAN:	DE74100110012620762039
BIC:	NTSBDEB1XXX

USt-IdNr.: DE325255754
FA Grimma: 238/251/16346

Wichtig!! 
Diese email kann Betriebs- und Gesch?ftsgeheimnisse unterliegende oder 
sonstige vertrauliche Informationen enthalten. Sollten Sie diese email 
irrt?mlich erhalten haben, ist Ihnen eine Kenntnisnahme des Inhalts,
eine Vervielf?ltigung oder Weitergabe der email ausdr?cklich untersagt.
Bitte benachrichtigen Sie uns und vernichten Sie die email.
Vielen Dank.
 
Important!! 
The information contained in this email message may be confidential 
information. If you are not the intended recipient, any use,
interference with, disclosure or copying of this material is
unauthorised and prohibited. 
Please inform us immediately and destroy the email. 
Thank you for your cooperation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: This is a digitally signed message part
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200914/b31c906d/attachment.asc>
