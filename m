From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 13 Feb 2014 16:30:37 +0100
Subject: [Buildroot] Open bug analysis
Message-ID: <CAAXf6LUmkkW8RxfC8RjYTYRnFDJ+TbNOiKM+LyMBDHJu37ORZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Here is again an overview of some open bugs. Hopefully we can resolve
them by looking at them collectively.

Doing a Buildroot build from /usr doesn't work
https://bugs.busybox.net/show_bug.cgi?id=5750
ThomasP, you are assigned to this bug. Have you done an analysis about
this in the past? What are the reasons for these problems?


Dbus and /var/run management
https://bugs.busybox.net/show_bug.cgi?id=5420
Here I don't see what the problem is. It is about the creation of
/var/run/dbus while /var/run is a symlink to /tmp. Looking at the
code, I don't see how it can be a problem (which I responded in the
bug report). Unless someone can explain what is going wrong exactly, I
would propose to close this (Resolved/Worksforme for example)


binutils-2.23.2/gas fails with undefined reference to `mbstowcs'
https://bugs.busybox.net/show_bug.cgi?id=6218
The submitter did not respond to questions from ThomasP. The bug
report hardly contains any info.
I tried building an internal toolchain for arm7tdmi, using
binutils-2.23.2, and binutils built fine.
My proposal is to close this bug to Resolved/Worksforme.


binutils-2.23.2/bfd fails with undefined reference to __fini_array_end
https://bugs.busybox.net/show_bug.cgi?id=6236
Same submitter as last patch, but about 10 days later. Logically, if
the first problem is reproducible, one couldn't get a second problem
unless the first one is fixed... So I have my doubts about this. As
said above, I tried building binutils in this configuration (with and
without MMU support) and this succeeded.


Cannot compile gcc without threads (uClibc-based)
https://bugs.busybox.net/show_bug.cgi?id=6230
I tried reproducing this problem, and the build indeed fails, but even
with the proposed modified uclibc config file. So my conclusion is
that this is a real bug that we need to look at.


Support for kernel signed modules
https://bugs.busybox.net/show_bug.cgi?id=6764
This bug report has a patch attached, and both Yann and me asked the
submitter to send it to the list, but without response. It's still
pretty recent though, so hopefully the submitter comes back to us. If
not, someone could adopt it and resend to the list.


procps Unknown HZ value! (XX) Assume 100.
https://bugs.busybox.net/show_bug.cgi?id=6626
ThomasP proposed to replace procps with procps-ng, the submitter
provided a patch, but did not send it to the list.
Note: this is the same submitted as the previous bug.


systemd error: static declaration of 'execvpe' follows non-static
declaration (uClibc)
https://bugs.busybox.net/show_bug.cgi?id=6776
ThomasP proposed a patch on the list yesterday to fix this problem in 2014.02.


toolchainfile.cmake has absolut path references
https://bugs.busybox.net/show_bug.cgi?id=6818
This bug contains a patch, and again the question was raised whether
the submitter could send it to the list instead. In the mean time it
was sent, so I closed the bug so the patch can follow the standard
patch review process. Is this ok? I marked it as Resolved/Fixed, which
is not the best state, but I couldn't find a better state...


Checking external toolchain for eabihf
https://bugs.busybox.net/show_bug.cgi?id=6842
ThomasP: the bug report refers to a small patch, could you have a look at it?



Runtime problems:

Running udhcpc on a system with NFS root kills NFS
https://bugs.busybox.net/show_bug.cgi?id=4790


Boot hangs when starting samba if BR2_ENABLE_LOCALE is enabled
https://bugs.busybox.net/show_bug.cgi?id=5396


Busybox compiled from buildroot hangs on pass from intiramfs to init
https://bugs.busybox.net/show_bug.cgi?id=6794
The submitter claims that stripping the busybox binary causes
incorrect runtime behavior. I asked for more info, but no response
yet.


Thanks all for your feedback,
Thomas
