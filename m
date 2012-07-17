From: Charles Krinke <charles.krinke@gmail.com>
Date: Tue, 17 Jul 2012 07:36:25 -0700
Subject: [Buildroot] Trouble compiling Qt with CodeSourcery 2011.09-50
	external toolchain
Message-ID: <CALo-6+jm1Erc88r0q9fMx0z8oNtuygF1APZYurfATRoN5uLrsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In trying to use the CodeSourcery 2011.09-50 external toolchain which
I downloaded and referenced externally, I get bolloxed up in Qt
compile with "output number X not directly addressable" and wonder if
someone could suggest a reason why?
-- 
Charles Krinke

../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h: In
destructor 'QVariantAnimationPrivate::~QVariantAnimationPrivate()':
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35:
error: output number 2 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35:
warning: use of memory input without lvalue in asm operand 4 is
deprecated
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h: In
function 'QInterpolatorVector* registeredInterpolators()':
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:127:35:
error: output number 2 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:127:35:
warning: use of memory input without lvalue in asm operand 4 is
deprecated
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:223:25:
error: output number 1 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:223:25:
warning: use of memory input without lvalue in asm operand 5 is
deprecated
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h: In
constructor 'QVariantAnimationPrivate::QVariantAnimationPrivate()':
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:127:35:
error: output number 2 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:127:35:
warning: use of memory input without lvalue in asm operand 4 is
deprecated
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h: In member
function 'QList<T>::Node* QList<T>::detach_helper_grow(int, int) [with
T = QAbstractAnimation*]':
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35:
error: output number 2 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35:
warning: use of memory input without lvalue in asm operand 4 is
deprecated
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h: In member
function 'void QVariantAnimationPrivate::setCurrentValueForProgress(qreal)':
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:164:25:
error: output number 1 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:164:25:
warning: use of memory input without lvalue in asm operand 5 is
deprecated
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h: In member
function 'void QList<T>::detach_helper(int) [with T =
QAbstractAnimation*]':
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35:
error: output number 2 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35:
warning: use of memory input without lvalue in asm operand 4 is
deprecated
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h: In member
function 'void QVector<T>::realloc(int, int) [with T = QVariant
(*)(const void*, const void*, float)]':
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35:
error: output number 2 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35:
warning: use of memory input without lvalue in asm operand 4 is
deprecated
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h: In member
function 'void QVector<T>::realloc(int, int) [with T = QPair<float,
QVariant>]':
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35:
error: output number 2 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35:
warning: use of memory input without lvalue in asm operand 4 is
deprecated
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h: In member
function 'QVector<T>& QVector<T>::operator=(const QVector<T>&) [with T
= QPair<float, QVariant>]':
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:127:35:
error: output number 2 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:127:35:
warning: use of memory input without lvalue in asm operand 4 is
deprecated
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35:
error: output number 2 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:145:35:
warning: use of memory input without lvalue in asm operand 4 is
deprecated
make[2]: *** [.obj/release-shared-emb-arm/qvariantanimation.o] Error 1
make[2]: *** Waiting for unfinished jobs....
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h: In member
function 'void QList<T>::clear() [with T = QAbstractAnimation*]':
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:127:35:
error: output number 2 not directly addressable
../../include/QtCore/../../src/corelib/arch/qatomic_armv6.h:127:35:
warning: use of memory input without lvalue in asm operand 4 is
deprecated
make[2]: *** [.obj/release-shared-emb-arm/qabstractanimation.o] Error 1
make[2]: Leaving directory
`/home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/src/corelib'
make[1]: *** [sub-corelib-make_default-ordered] Error 2
make[1]: Leaving directory
`/home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1'
make: *** [/home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/.stamp_built]
Error 2
ckrinke at hwa:~/buildroot-2012.05$
