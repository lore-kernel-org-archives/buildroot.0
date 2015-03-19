From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 19 Mar 2015 16:59:39 +0000 (UTC)
Subject: [Buildroot] [Bug 7961] New: Qt5 fails to build for
	xtensa-buildroot-linux-uclibc
Message-ID: <bug-7961-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7961

              Host: x86_64
            Target: xtensa-buildroot-linux-uclibc
           Summary: Qt5 fails to build for xtensa-buildroot-linux-uclibc
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: uwe at hermann-uwe.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


See attachments for details.


/home/jenkins_slave/buildroot-xtensa-buildroot-linux-uclibc/output/host/usr/bin/xtensa-buildroot-linux-uclibc-g++
-c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-mlongcalls -mtext-section-literals -Os

--sysroot=/home/jenkins_slave/buildroot-xtensa-buildroot-linux-uclibc/output/host/usr/xtensa-buildroot-linux-uclibc/sysroot
-O3 -O3 -fvisibility=hidden -fvisibility-inlines-hidden -std=c++0x
-fno-exceptions -Wall -W -D_REENTRA
NT -fPIC -DQT_NO_MTDEV -DQT_NO_LIBUDEV -DQT_NO_USING_NAMESPACE
-DQT_BUILD_GUI_LIB -DQT_BUILDING_QT -DQT_NO_CAST_TO_ASCII
-DQT_ASCII_CAST_WARNINGS -DQT_MOC_COMPAT -DQT_USE_QSTRINGBUILDER
-DQT_DEPRECATED_WARNINGS -DQT_DISABLE_DEP
RECATED_BEFORE=0x050000 -DQT_ENABLE_HARFBUZZ_NG -DQT_NO_EXCEPTIONS
-D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_CORE_LIB -I.
-I../../include -I../../include/QtGui -I../../include/QtGui/5.4.1
-I../../include/QtGu
i/5.4.1/QtGui -Iimage -I../3rdparty/harfbuzz-ng/include
-I../../include/QtCore/5.4.1 -I../../include/QtCore/5.4.1/QtCore
-I../../include/QtCore -I.moc -I../../mkspecs/devices/linux-buildroot-g++ -o
.obj/qimagewriter.o image/qim
agewriter.cpp
In file included from ../../include/QtGui/qwindow.h:1:0,
                 from ../../include/QtGui/QWindow:1,
                 from
../../include/QtGui/../../src/gui/kernel/qpaintdevicewindow.h:37,
                 from ../../include/QtGui/qpaintdevicewindow.h:1,
                 from ../../include/QtGui/QPaintDeviceWindow:1,
                 from kernel/qpaintdevicewindow_p.h:37,
                 from kernel/qpaintdevicewindow.cpp:34:
../../include/QtGui/../../src/gui/kernel/qwindow.h: In member function ?virtual
QSize QWindow::_ZThn8_NK7QWindow4sizeEv() const?:
../../include/QtGui/../../src/gui/kernel/qwindow.h:219:18: internal compiler
error: in expand_expr_addr_expr_1, at expr.c:7669
     inline QSize size() const { return geometry().size(); }
                  ^
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.
Makefile:22325: recipe for target '.obj/qpaintdevicewindow.o' failed
make[3]: *** [.obj/qpaintdevicewindow.o] Error 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
