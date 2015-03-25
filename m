From: Steve Kenton <skenton@ou.edu>
Date: Wed, 25 Mar 2015 12:44:58 -0500
Subject: [Buildroot] Where is /dev/console created when using devtmpfs?
Message-ID: <5512F41A.3080208@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm currently running with devtmpfs only but am looking into using mdev
so I spent some time looking at my device usage and for the life of me
I can't find where /dev/console gets created during the build process.
Looking at the root filesystem when it's not running shows this in /dev

drwxrwxr-x 2 root root 4096 Mar  1 15:26 pts
lrwxrwxrwx 1 root root   10 Mar  1 15:26 log -> ../tmp/log
crw--w--w- 1 root root 5, 1 Mar 22 21:52 console

and I see that pts and log come from the skeleton but I can't find console.
I'm running an x86_64 system using the default vga console if that matters.
I'm obviously missing something but I can't find a mknod or mkdevs for it.

Where is /dev/console created when using devtmpfs?

Thanks,

Steve
