From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Oct 2018 06:15:09 +0000
Subject: [Buildroot] [Bug 11401] Impossible do build a qt program using
 kf5-networkmanager-qt
In-Reply-To: <bug-11401-163@https.bugs.busybox.net/>
References: <bug-11401-163@https.bugs.busybox.net/>
Message-ID: <bug-11401-163-3Lt74IJfir@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11401

--- Comment #5 from Nicolas Carrier <carrier.nicolas0@gmail.com> ---
I'm going to try to convert the project to cmake.

For now, the following .pro file

QT -= gui                                                                       
QT += dbus network                                                              
CONFIG += c++11 console link_pkgconfig                                          
PKGCONFIG += libnm                                                              
SOURCES += main.cpp                                                             
INCLUDEPATH = $$[QT_SYSROOT]/usr/include/KF5/NetworkManagerQt                   
LIBS += -lKF5NetworkManagerQt                                                   
target.path = /                                                                 
!isEmpty(target.path): INSTALLS += target                                       

allowed me to build (and run) both for desktop and in buildroot. So this proves
at least that the result of the kf5-networkmanager-qt build works fine.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
