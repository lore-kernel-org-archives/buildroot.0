From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 Jul 2012 20:34:43 +0000 (UTC)
Subject: [Buildroot] [Bug 5408] New: qt build failure with Sourcery
	CodeBench ARM 2010.09
Message-ID: <bug-5408-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5408

           Summary: qt build failure with Sourcery CodeBench ARM 2010.09
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: luca.ceresoli at tiscali.it
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4454
  --> https://bugs.busybox.net/attachment.cgi?id=4454
Defconfig to reproduce the problem

Current Buildroot master (fd08153b9d677) fails building with a minimalistic ARM
Cortex-A8 config with Sourcery CodeBench ARM 2010.09 and just Qt enabled.

This is the make output:

$ LANG= make BR2_DL_DIR=~/src BR2_JLEVEL=1
>>> qt 4.8.2 Building
PATH="/home/murray/devel/buildroot/output/host/bin:/home/murray/devel/buildroot/output/host/usr/bin:/home/murray/devel/buildroot/output/host/usr/sbin/:/home/murray/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
PERLLIB="/home/murray/devel/buildroot/output/host/usr/lib/perl" /usr/bin/make
-j1 -C /home/murray/devel/buildroot/output/build/qt-4.8.2
make[1]: Entering directory
`/home/murray/devel/buildroot/output/build/qt-4.8.2'
cd src/tools/bootstrap/ && /usr/bin/make -f Makefile 
make[2]: Entering directory
`/home/murray/devel/buildroot/output/build/qt-4.8.2/src/tools/bootstrap'
make[2]: Nothing to be done for `first'.
make[2]: Leaving directory
`/home/murray/devel/buildroot/output/build/qt-4.8.2/src/tools/bootstrap'
cd src/tools/moc/ && /usr/bin/make -f Makefile 
make[2]: Entering directory
`/home/murray/devel/buildroot/output/build/qt-4.8.2/src/tools/moc'
make[2]: Nothing to be done for `first'.
make[2]: Leaving directory
`/home/murray/devel/buildroot/output/build/qt-4.8.2/src/tools/moc'
cd src/tools/rcc/ && /usr/bin/make -f Makefile 
make[2]: Entering directory
`/home/murray/devel/buildroot/output/build/qt-4.8.2/src/tools/rcc'
make[2]: Nothing to be done for `first'.
make[2]: Leaving directory
`/home/murray/devel/buildroot/output/build/qt-4.8.2/src/tools/rcc'
cd src/tools/uic/ && /usr/bin/make -f Makefile 
make[2]: Entering directory
`/home/murray/devel/buildroot/output/build/qt-4.8.2/src/tools/uic'
make[2]: Nothing to be done for `first'.
make[2]: Leaving directory
`/home/murray/devel/buildroot/output/build/qt-4.8.2/src/tools/uic'
cd src/corelib/ && /usr/bin/make -f Makefile 
make[2]: Entering directory
`/home/murray/devel/buildroot/output/build/qt-4.8.2/src/corelib'
compiling animation/qabstractanimation.cpp
In file included from ../../include/QtCore/qatomic_armv6.h:1:0,
                 from
../../include/QtCore/../../src/corelib/arch/qatomic_armv7.h:56,
                 from ../../include/QtCore/qatomic_armv7.h:1,
                 from
../../include/QtCore/../../src/corelib/arch/qatomic_arm.h:53,
                 from ../../include/QtCore/qatomic_arm.h:1,
                 from
../../include/QtCore/../../src/corelib/arch/qatomic_arch.h:56,
                 from ../../include/QtCore/qatomic_arch.h:1,
                 from
../../include/QtCore/../../src/corelib/thread/qbasicatomic.h:227,
                 from ../../include/QtCore/qbasicatomic.h:1,
                 from
../../include/QtCore/../../src/corelib/thread/qatomic.h:46,
                 from ../../include/QtCore/qatomic.h:1,
                 from
../../include/QtCore/../../src/corelib/tools/qbytearray.h:45,
                 from ../../include/QtCore/qbytearray.h:1,
                 from
../../include/QtCore/../../src/corelib/tools/qstring.h:46,
                 from ../../include/QtCore/qstring.h:1,
                 from
../../include/QtCore/../../src/corelib/kernel/qobject.h:48,
                 from ../../include/QtCore/qobject.h:1,
                 from
../../include/QtCore/../../src/corelib/kernel/qcoreapplication.h:45,
                 from ../../include/QtCore/qcoreapplication.h:1,
                 from global/qt_pch.h:58:
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h: In function
'QThreadStorage<QUnifiedTimer*>* unifiedTimer()':
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:223:25: error:
output number 1 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:223:25: warning:
use of memory input without lvalue in asm operand 5 is deprecated
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h: In constructor
'QUnifiedTimer::QUnifiedTimer()':
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:127:35: error:
output number 2 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:127:35: warning:
use of memory input without lvalue in asm operand 4 is deprecated
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:127:35: error:
output number 2 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:127:35: warning:
use of memory input without lvalue in asm operand 4 is deprecated
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:127:35: error:
output number 2 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:127:35: warning:
use of memory input without lvalue in asm operand 4 is deprecated
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h: In destructor
'QList<T>::~QList() [with T = QAbstractAnimation*]':
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35: error:
output number 2 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35: warning:
use of memory input without lvalue in asm operand 4 is deprecated
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h: In member function
'QList<T>::Node* QList<T>::detach_helper_grow(int, int) [with T =
QAbstractAnimation*]':
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35: error:
output number 2 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35: warning:
use of memory input without lvalue in asm operand 4 is deprecated
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h: In member function
'void QList<T>::detach_helper(int) [with T = QAbstractAnimation*]':
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35: error:
output number 2 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35: warning:
use of memory input without lvalue in asm operand 4 is deprecated
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h: In member function
'void QList<T>::clear() [with T = QAbstractAnimation*]':
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:127:35: error:
output number 2 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:127:35: warning:
use of memory input without lvalue in asm operand 4 is deprecated
make[2]: *** [.obj/release-shared-emb-arm/qabstractanimation.o] Error 1
make[2]: Leaving directory
`/home/murray/devel/buildroot/output/build/qt-4.8.2/src/corelib'
make[1]: *** [sub-corelib-make_default-ordered] Error 2
make[1]: Leaving directory `/home/murray/devel/buildroot/output/build/qt-4.8.2'
make: *** [/home/murray/devel/buildroot/output/build/qt-4.8.2/.stamp_built]
Error 2

And here's the offending code around line 223:

template <typename T>
Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::testAndSetRelaxed(T
*expectedValue, T *newValue)
{
    register T *result;
    asm volatile("0:\n"
                 "ldrex %[result], [%[_q_value]]\n"
                 "eors %[result], %[result], %[expectedValue]\n"
                 "itt eq\n"
                 "strexeq %[result], %[newValue], [%[_q_value]]\n"
                 "teqeq %[result], #1\n"
                 "beq 0b\n"
                 : [result] "=&r" (result),
                   "+m" (_q_value)
                 : [expectedValue] "r" (expectedValue),
                   [newValue] "r" (newValue),
                   [_q_value] "r" (&_q_value)
                 : "cc");   // <--- line 223
    return result == 0;
}

Other errors raise from similar pieces of code.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
