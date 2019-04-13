From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 13 Apr 2019 12:28:16 +0000
Subject: [Buildroot] [Bug 11781] mariadb build error
In-Reply-To: <bug-11781-163@https.bugs.busybox.net/>
References: <bug-11781-163@https.bugs.busybox.net/>
Message-ID: <bug-11781-163-KrCeA0FlTy@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11781

--- Comment #2 from Arnout Vandecappelle <arnout@mind.be> ---
I can confirm a build failure, but the error is in fact from this (I think):

CMake Error at cmake/os/Linux.cmake:29 (STRING):
STRING sub-command REPLACE requires at least four arguments.
Call Stack (most recent call first):
CMakeLists.txt:101 (INCLUDE)

CMake Error at cmake/os/Linux.cmake:29 (STRING):
STRING sub-command REPLACE requires at least four arguments.
Call Stack (most recent call first):
CMakeLists.txt:101 (INCLUDE)


Note that mariadb doesn't get built in the autobuilders because it comes from a
choice.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
