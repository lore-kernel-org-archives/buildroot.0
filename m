From: Chris Packham <judge.packham@gmail.com>
Date: Sun, 26 Mar 2017 14:47:18 +1300
Subject: [Buildroot] [Bug 9776] New: libubox build failed
In-Reply-To: <CAFOYHZBZ0Fo8202HtObbrkv4bAMV2vu1mZvewf8G+Vgg7EJ9cg@mail.gmail.com>
References: <bug-9776-163@https.bugs.busybox.net/>
 <CAFOYHZA+Q-J3+591sPK21CY+i0PV+2d3LYTwD0EMhCtoLk_7+A@mail.gmail.com>
 <CAFOYHZBZ0Fo8202HtObbrkv4bAMV2vu1mZvewf8G+Vgg7EJ9cg@mail.gmail.com>
Message-ID: <CAFOYHZBDzK3tqrzBByt2Dn9p_NreRwhG_jz-DUAOZ_2ZjK+9Ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/03/2017 9:54 PM, <bugzilla@busybox.net> wrote:

https://bugs.busybox.net/show_bug.cgi?id=9776

            Bug ID: 9776
           Summary: libubox build failed
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: linhuikui at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

libubox: installs files in
/home/lhk/workspace/smdk2440/host/usr/arm-buildroot-linux-
gnueabi/sysroot//home/lhk/workspace/smdk2440
package/pkg-generic.mk:255: recipe for target
'/home/lhk/workspace/smdk2440/build/libubox-290c64ef5b5c3e75be851594f269d6
a9568e64e5/.stamp_staging_installed'
failed

above is the logs from linux console


This looks like the install check that ensures build machine paths don't
leak into the target/staging directories. You'll notice "home" appears
twice in the error message.

I think I saw an explanation of that on another thread (sorry on mobile so
I can't find a link easily, but it was in the last few days). Perhaps
something has gone into a config file that shouldn't.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170326/c38886e0/attachment.html>
