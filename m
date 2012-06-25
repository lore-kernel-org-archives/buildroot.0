From: Aras Vaichas <aras.vaichas@gmail.com>
Date: Mon, 25 Jun 2012 12:46:50 +0100
Subject: [Buildroot] how to repopulate /output/target/lib?
Message-ID: <CAJkQPOnh+SqhaV5eZ1YQhVzK2cfmzK=StTVSGZ=P1V0Oxgdi3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm currently moving a project to Buildroot. So I'm configuring
Buildroot to create an identical fs tree to my existing tree.

My workflow is:

* run make
* compare output/target against my original fs (using xxdiff)
* adjust Buildroot settings. e.g. skeleton, post build script, etc
* clear out output/target
* repeat

I have a helper script that does some of the dirty work:

#!/bin/sh
find -name .stamp_target_installed | xargs rm
rm -rf output/target
rm output/build/.root
echo now run make

My problem is that "make" no longer populates output/target/lib or
output/target/usr/lib at this stage of the build and I don't know why.

I understand that output/staging holds all the libraries, but how do
the correct libraries get copied to output/target? How can I trigger
this action without having to do a "make clean; make"?

Thanks in advance,

Aras Vaichas
