From: Mike Sander <msander@ripnet.com>
Date: Mon, 05 May 2008 09:18:53 -0400
Subject: [Buildroot] booting root filesystem over nfs
Message-ID: <481F093D.9070906@ripnet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

First of all, I want to thank contributors to
buildroot (and friends).  It is pretty awesome.

I was wondering if it is intended for the
project_build_ARCH/uclibc/root to be suitable for
booting over nfs.  I have seen some indication in the
mailing list that others have done so.

I have tried and encountered 2 issues:

1) After a "make" the /dev entries are all normal
files instead of device nodes.   This does not appear
to depend upon the target root filesystem type.  Is
this correct behavior?   If not, is there an
additional step I need to perform.   For now I have
manually created /dev/console & /dev/null

2) the "root" in path to the root filesystem was
causing boot problems on my target.    I was getting
error messages of the form "mounting proc/ ... mount:
permission denied.  (are you root?)".   Simply
renaming "root" to "rfs" (for example) on my Host
(ubuntu 7.10) caused this particular problem to go
away.  Having to do this makes me wonder if I am
doing something wrong.

Any guidance would be appreciated.

Regards,

Mike
