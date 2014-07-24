From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Jul 2014 12:57:11 +0000 (UTC)
Subject: [Buildroot] [Bug 7280] CMake toolchain file uses the FORCE
 attribute on CMAKE_CXX_FLAGS
In-Reply-To: <bug-7280-163@https.bugs.busybox.net/>
References: <bug-7280-163@https.bugs.busybox.net/>
Message-ID: <20140724125711.9F9109D2E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7280

--- Comment #2 from deblauwetom+buildroot at gmail.com 2014-07-24 12:57:11 UTC ---
Created attachment 5522
  --> https://bugs.busybox.net/attachment.cgi?id=5522
simple application to use with cmake toolchain

Unzip this attachment, and then do this from the directory:

cd ..
mkdir buildSimpleApp
cd buildSimpleApp
cmake -DCMAKE_TOOLCHAIN_FILE=<full path to your buildroot
compilation>/output/host/usr/share/buildroot/toolchainfile.cmake .
../SimpleApp/

This will work OK and generate makefiles. But if you run it again, you will see
the build flags list grow and grow.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
