From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 23 Mar 2021 11:17:58 +0000
Subject: [Buildroot] [Bug 13661] New: host-python2 build fails on aarch64
Message-ID: <bug-13661-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13661

            Bug ID: 13661
           Summary: host-python2 build fails on aarch64
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: christian at paral.in
                CC: buildroot at uclibc.org
  Target Milestone: ---

I'm seeing the following build error on armv8 (aarch64):

/build/host-python-2.7.18/Modules/_ctypes/libffi/src/closures.c:472:7: warning:
ignoring return value of 'ftruncate' declared with attribute
'warn_unused_result' [-Wunused-result]
2021-03-23T08:50:16.2844591Z   472 |       ftruncate (execfd, offset);
2021-03-23T08:50:16.2845961Z       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
2021-03-23T08:50:16.3656935Z
/build/host-python-2.7.18/Modules/_ctypes/libffi/src/aarch64/sysv.S: Assembler
messages:
2021-03-23T08:50:16.3669765Z
/build/host-python-2.7.18/Modules/_ctypes/libffi/src/aarch64/sysv.S:145: Error:
constant expression required at operand 2 -- `tbz
x23,#AARCH64_FFI_WITH_V_BIT,1f'
2021-03-23T08:50:16.3679469Z
/build/host-python-2.7.18/Modules/_ctypes/libffi/src/aarch64/sysv.S:174: Error:
constant expression required at operand 2 -- `tbz
x23,#AARCH64_FFI_WITH_V_BIT,1f'
2021-03-23T08:50:16.3688258Z
/build/host-python-2.7.18/Modules/_ctypes/libffi/src/aarch64/sysv.S:282: Error:
constant expression required at operand 2 -- `tbz
x0,#AARCH64_FFI_WITH_V_BIT,1f'
2021-03-23T08:50:16.3692215Z building dbm using gdbm
2021-03-23T08:50:16.3693379Z 
2021-03-23T08:50:16.3695198Z Python build finished, but the necessary bits to
build these modules were not found:
2021-03-23T08:50:16.3697325Z _tkinter           bsddb185           dl           
2021-03-23T08:50:16.3698676Z imageop            sunaudiodev                     
2021-03-23T08:50:16.3702910Z To find the necessary bits, look in setup.py in
detect_modules() for the module's name.
2021-03-23T08:50:16.3704463Z 
2021-03-23T08:50:16.3705077Z 
2021-03-23T08:50:16.3706170Z Failed to build these modules:
2021-03-23T08:50:16.3707366Z _ctypes                    

This is building on Gentoo arm64 on a Jetson tx2:

gcc --version
gcc (Gentoo 10.2.0-r5 p6) 10.2.0

Is the compiler generating invalid asm? How to fix this, so that host-python
works on arm64?

The full build output is here (& attached to bug):

https://github.com/skiffos/SkiffOS/runs/2172698881

-- 
You are receiving this mail because:
You are on the CC list for the bug.
