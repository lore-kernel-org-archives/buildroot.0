From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 4 Aug 2011 16:56:07 +0000 (UTC)
Subject: [Buildroot] libssp still missing from target
Message-ID: <j1eiv7$irk$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This has come up before, and IIRC, I ended up tweaking ext-tool.mk to
work around it.

I've just upgraded to Buildroot 2011.05, and it seems ext-tool.mk
still isn't copying libssp to the target. It's need by (among other
things) ssh:

  Starting network...
  ip: RTNETLINK answers: File exists
  Generating ECDSA Key...
  THIS CAN TAKE A MINUTE OR TWO DEPENDING ON YOUR PROCESSOR!

  /usr/bin/ssh-keygen: can't load library 'libssp.so.0'
  Starting sshd: /usr/sbin/sshd: can't load library 'libssp.so.0'

Is there some configuration option I've missed?

-- 
Grant Edwards               grant.b.edwards        Yow! I want you to MEMORIZE
                                  at               the collected poems of
                              gmail.com            EDNA ST VINCENT MILLAY
                                                   ... BACKWARDS!!
