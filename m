From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Oct 2018 06:37:38 +0000
Subject: [Buildroot] [Bug 11401] Impossible do build a qt program using
 kf5-networkmanager-qt
In-Reply-To: <bug-11401-163@https.bugs.busybox.net/>
References: <bug-11401-163@https.bugs.busybox.net/>
Message-ID: <bug-11401-163-7woUgUgfKY@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11401

--- Comment #6 from Nicolas Carrier <carrier.nicolas0@gmail.com> ---
With the following CMakeLists.txt:

cmake_minimum_required(VERSION 3.0)
include(GNUInstallDirs)
find_package(Qt5 REQUIRED COMPONENTS Gui DBus Network)
find_package(KF5NetworkManagerQt REQUIRED)
add_executable(qt-network-manager main.cpp)
target_link_libraries(qt-network-manager Qt5::Gui Qt5::DBus
KF5::NetworkManagerQt)
install(TARGETS qt-network-manager DESTINATION ${CMAKE_INSTALL_BINDIR})

and test-qt-networkmanager.mk:

TEST_QT_NETWORKMANAGER_VERSION = 0.0.1
TEST_QT_NETWORKMANAGER_SITE_METHOD = local
TEST_QT_NETWORKMANAGER_SITE =
$(BR2_EXTERNAL_SPECTRACOM_PATH)/../test-qt-networkmanager-src
TEST_QT_NETWORKMANAGER_DEPENDENCIES = kf5-networkmanager-qt
$(eval $(cmake-package))

It builds fine.

I can't use the cmake solution though, because I need to use NetworkManagerQt
is an already existing and quite complex, qmake-based project, which I'd like
to avoid converting to cmake if possible.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
