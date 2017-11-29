From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Nov 2017 15:49:24 +0000
Subject: [Buildroot] [Bug 10531] New: QtWebengine doesn't build if the host
 hasn't a 32 bits C++ compiler working
Message-ID: <bug-10531-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10531

            Bug ID: 10531
           Summary: QtWebengine doesn't build if the host hasn't a 32 bits
                    C++ compiler working
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: pinaraf at pinaraf.info
                CC: buildroot at uclibc.org
  Target Milestone: ---

When trying to build QtWebEngine for a raspberry pi 3 (ARM 32bits), a bunch of
host tools are built using C++. Instead of being built directly for my amd64
arch, they are built for x86.
My debian sid installation was incomplete, I had gcc-multilib only and was
missing at least libstdc++-7-dev:i386 and g++-multilib.
A warning from buildroot would be nice since this error occurs after a quite
long build time.


As discussed on IRC?:
<gportay> kos_tom: Do you prefer to add a BR2_HOSTARCH_NEEDS_IA32_CXX_COMPILER;
or BR2_HOSTARCH_NEEDS_IA32_COMPILER checks for both c and c++ multilib support?
<kos_tom> gportay: that is a good question :-)
<kos_tom> I would say keep it simple, and just test for C++ support in
BR2_HOSTARCH_NEEDS_IA32_COMPILER
<gportay> kos_tom: because we do not really want for force installation of c++
multilib when not needed
<gportay> okay
<kos_tom> but don't hesitate to raise this point in a note in your commit log,
so that others can comment


Thanks to you guys for the support on IRC :)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
