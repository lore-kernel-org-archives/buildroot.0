From: Dmitry Teytelman <dimtey@gmail.com>
Date: Fri, 16 May 2008 16:38:29 -0700
Subject: [Buildroot] Bash segfaults and other "niceties"
Message-ID: <592c74910805161638t76f70f90sdce3b85faa7b24b3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am having major problems with a recent snapshot of buildroot
(20080513) and suspect the answer is simple - I am doing something
completely wrong :(

A bit of history. I am running buildroot-based system on mini-ITX
hardware (Via processor). I have been using an older version
(20061231) for a while and it has been very reliable. However that
version no longer compiles after the development machine was upgraded
from Fedora Core 5 to Fedora 8.

So I tried to recreate the environment with a new buildroot. I can
build it and install on the target. However I see multiple issues:

1. If /bin/sh is linked to /bin/bash, startup scripts called by rcS
segfault. Some randomly, some (ifup/ifdown) reliably. Making /bin/sh
point to busybox fixes the issue.

2. Running gdb on the target with a program that segfaults kills gdb :(

3. Perl 5.8.8 no longer compiles on the target. I can get Perl 5.10.0
to compile.

4. A number of programs compiled on the target die with segmentation violations.

So what am I doing wrong? Program outputs/config information are
available, if needed. Thanks in advance!

-- 
Dmitry Teytelman <dimtey@gmail.com>
