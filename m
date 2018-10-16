From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Oct 2018 16:31:05 +0000
Subject: [Buildroot] [Bug 11401] Impossible do build a qt program using
 kf5-networkmanager-qt
In-Reply-To: <bug-11401-163@https.bugs.busybox.net/>
References: <bug-11401-163@https.bugs.busybox.net/>
Message-ID: <bug-11401-163-UYOlcapQJh@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11401

--- Comment #4 from Pierre Ducroquet <pinaraf@pinaraf.info> ---
I will try to investigate tomorrow. I did not test with a QMake project, only
with a CMake one. Could you try converting from qmake to cmake ?
The CMakeLists.txt would look like this:

cmake_minimum_required(VERSION 3.0)

find_package(Qt5 REQUIRED COMPONENTS Gui DBus)
find_package(KF5NetworkManagerQt REQUIRED)
add_executable(qt-network-manager main.cpp)
target_link_libraries(qt-network-manager Qt5::Gui Qt5::DBus
KF5::NetworkManagerQt)

This would help confirm the issue lies in the QMake files.

Thank you very much for your report

-- 
You are receiving this mail because:
You are on the CC list for the bug.
