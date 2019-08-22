From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 22 Aug 2019 12:29:17 +0000
Subject: [Buildroot] [Bug 12131] New: qt5webengine builderror in the latest
 stable Buildroot 2019.05.01 version
Message-ID: <bug-12131-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12131

            Bug ID: 12131
           Summary: qt5webengine builderror in the latest stable Buildroot
                    2019.05.01 version
           Product: buildroot
           Version: 2019.05.1
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: koller at stettbacher.ch
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8201
  --> https://bugs.busybox.net/attachment.cgi?id=8201&action=edit
Error logfile with ARM linaro toolchain 2018.05 and qt5.12.2

Hi buildroot team

I am using the latest stable Buildroot version 2019.05.1, but I am facing a
builderror with the qt5webengine and I hope, that someone could help me out
with this issue.

My setup:
From a hardware point of view, I am using a Ka-Ro TX6QP computer-on-module with
an i.mx6 (ARM Cortex-A9) processor. For this reason, I am using the Linaro ARM
2018.05 toolchain (Proposed by Buildroot 2019.05.1). The goal is to build the
qt5webengine (Latest: Qt5.12.2) successfully.

The challenge, I am facing right now:
I wanted to build the qt5webengine, but I got several error messages in this
style:

> /home/patrickk/tmp/buildroot/buildroot-2019.05.1/buildroot-2019.05.1/output/host/opt/ext-toolchain/arm-linux-gnueabihf/include/c++/7.3.1/cstdlib:75:15: fatal error: stdlib.h: No such file or directory
>  #include_next <stdlib.h>
>                ^~~~~~~~~~
> compilation terminated.

A quick google search (https://bugreports.qt.io/browse/QTBUG-53367) showed a
known problem with new GCC > 4.8 versions in respect of the argument
"-isystem". Nevertheless, I was not able to solve my described problem at the
source.

Next, I tried to update the linaro toolchain to the newest available version,
but the same error showed off...
Link:
https://releases.linaro.org/components/toolchain/binaries/7.4-2019.02/arm-linux-gnueabihf/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar.xz

My last attempt was to update Qt5 to version 5.13.0. This showed the following
error:
> In file included from ../../3rdparty/chromium/sandbox/linux/seccomp-bpf-helpers/syscall_parameters_restrictions.cc:25:0:
> ../../3rdparty/chromium/sandbox/linux/seccomp-bpf-helpers/syscall_parameters_restrictions.cc: In function ?sandbox::bpf_dsl::ResultExpr sandbox::RestrictPtrace()?:
> ../../3rdparty/chromium/sandbox/linux/seccomp-bpf-helpers/syscall_parameters_restrictions.cc:401:9: error: ?PTRACE_GET_THREAD_AREA? was not declared in this scope
>          PTRACE_GET_THREAD_AREA,
>          ^
I am not sure, if my update from Qt5.12..2 to Qt5.13.0 solved the first error
or even introduced a second error...

It would be awesome, if someone could help me out or give me a hint. I
appreciate every support I get
I attached my .config file to this e-mail. If you need additional information,
please do not hesitate to contact me.
Thanks in advance.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
