From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 26 Apr 2014 11:15:41 +0200
Subject: [Buildroot] [PATCH] evemu: bump version to 1.2.0
In-Reply-To: <trinity-1fce5222-5e5e-419c-baab-a89af52a2d58-1398454369404@3capp-gmx-bs30>
 (Peter Seiderer's message of "Fri, 25 Apr 2014 21:32:49 +0200")
References: <trinity-1fce5222-5e5e-419c-baab-a89af52a2d58-1398454369404@3capp-gmx-bs30>
Message-ID: <87eh0kzc1u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

Hi,

 > SOURCE_FILE should be something like "${SYSROOT}/usr/include/linux/input.h", whats the best
 > way to achieve this (and which buildroot set variable should be uesed)?
 > - patch make-event-names.py directly with given sysroot path
 > - patch make-event-names.py to use given environment variable with sysroot path
 > - ...

Thanks for the patch. I see there's also another failure:

http://autobuild.buildroot.net/results/4ec/4ecfbca85ffd5544acad44312166bfcb323283b5/build-end.log

It seems like the python stuff doesn't work with python3. I guess we
will need to:

- Patch make-event-names.py to use python2 instead of python
- Add a configure flag to disable python support and/or fixup python/ to
  work with python3

Care to take a look?

-- 
Bye, Peter Korsgaard
