From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jan 2018 22:55:11 +0000
Subject: [Buildroot] [Bug 10041] Qt5base: examples were not installed
In-Reply-To: <bug-10041-163@https.bugs.busybox.net/>
References: <bug-10041-163@https.bugs.busybox.net/>
Message-ID: <bug-10041-163-MQksmusczp@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10041

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
With:

BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_EXAMPLES=y

I indeed see a bunch of examples installed:

$ find output/target/usr/lib/qt/examples/
output/target/usr/lib/qt/examples/
output/target/usr/lib/qt/examples/README
output/target/usr/lib/qt/examples/network
output/target/usr/lib/qt/examples/network/README
output/target/usr/lib/qt/examples/network/network.pro
output/target/usr/lib/qt/examples/network/downloadmanager
output/target/usr/lib/qt/examples/network/downloadmanager/textprogressbar.h
output/target/usr/lib/qt/examples/network/downloadmanager/textprogressbar.cpp
output/target/usr/lib/qt/examples/network/downloadmanager/downloadmanager
output/target/usr/lib/qt/examples/network/downloadmanager/downloadmanager.cpp
output/target/usr/lib/qt/examples/network/downloadmanager/main.cpp
output/target/usr/lib/qt/examples/network/downloadmanager/downloadmanager.h
output/target/usr/lib/qt/examples/network/downloadmanager/downloadmanager.pro
output/target/usr/lib/qt/examples/network/dnslookup
output/target/usr/lib/qt/examples/network/dnslookup/dnslookup.cpp
output/target/usr/lib/qt/examples/network/dnslookup/dnslookup
output/target/usr/lib/qt/examples/network/dnslookup/dnslookup.pro
output/target/usr/lib/qt/examples/network/dnslookup/dnslookup.h
output/target/usr/lib/qt/examples/network/download
output/target/usr/lib/qt/examples/network/download/download
output/target/usr/lib/qt/examples/network/download/download.pro
output/target/usr/lib/qt/examples/network/download/main.cpp
output/target/usr/lib/qt/examples/network/shared
output/target/usr/lib/qt/examples/network/shared/sctpchannels.h
output/target/usr/lib/qt/examples/qtconcurrent
output/target/usr/lib/qt/examples/qtconcurrent/README
output/target/usr/lib/qt/examples/qtconcurrent/qtconcurrent.pro
output/target/usr/lib/qt/examples/corelib
output/target/usr/lib/qt/examples/corelib/json
output/target/usr/lib/qt/examples/corelib/json/savegame
output/target/usr/lib/qt/examples/corelib/json/savegame/character.h
output/target/usr/lib/qt/examples/corelib/json/savegame/game.h
output/target/usr/lib/qt/examples/corelib/json/savegame/savegame.pro
output/target/usr/lib/qt/examples/corelib/json/savegame/main.cpp
output/target/usr/lib/qt/examples/corelib/json/savegame/savegame
output/target/usr/lib/qt/examples/corelib/json/savegame/game.cpp
output/target/usr/lib/qt/examples/corelib/json/savegame/level.cpp
output/target/usr/lib/qt/examples/corelib/json/savegame/character.cpp
output/target/usr/lib/qt/examples/corelib/json/savegame/level.h
output/target/usr/lib/qt/examples/corelib/json/json.pro
output/target/usr/lib/qt/examples/corelib/mimetypes
output/target/usr/lib/qt/examples/corelib/mimetypes/mimetypes.pro
output/target/usr/lib/qt/examples/corelib/corelib.pro
output/target/usr/lib/qt/examples/corelib/threads
output/target/usr/lib/qt/examples/corelib/threads/README
output/target/usr/lib/qt/examples/corelib/threads/semaphores
output/target/usr/lib/qt/examples/corelib/threads/semaphores/semaphores
output/target/usr/lib/qt/examples/corelib/threads/semaphores/semaphores.pro
output/target/usr/lib/qt/examples/corelib/threads/semaphores/semaphores.cpp
output/target/usr/lib/qt/examples/corelib/threads/threads.pro
output/target/usr/lib/qt/examples/corelib/threads/waitconditions
output/target/usr/lib/qt/examples/corelib/threads/waitconditions/waitconditions.cpp
output/target/usr/lib/qt/examples/corelib/threads/waitconditions/waitconditions.pro
output/target/usr/lib/qt/examples/corelib/threads/waitconditions/waitconditions
output/target/usr/lib/qt/examples/examples.pro
output/target/usr/lib/qt/examples/xml
output/target/usr/lib/qt/examples/xml/README
output/target/usr/lib/qt/examples/xml/htmlinfo
output/target/usr/lib/qt/examples/xml/htmlinfo/htmlinfo
output/target/usr/lib/qt/examples/xml/htmlinfo/resources.qrc
output/target/usr/lib/qt/examples/xml/htmlinfo/w3c_org.html
output/target/usr/lib/qt/examples/xml/htmlinfo/apache_org.html
output/target/usr/lib/qt/examples/xml/htmlinfo/trolltech_com.html
output/target/usr/lib/qt/examples/xml/htmlinfo/main.cpp
output/target/usr/lib/qt/examples/xml/htmlinfo/simpleexample.html
output/target/usr/lib/qt/examples/xml/htmlinfo/youtube_com.html
output/target/usr/lib/qt/examples/xml/htmlinfo/htmlinfo.pro
output/target/usr/lib/qt/examples/xml/xml.pro
output/target/usr/lib/qt/examples/xml/xmlstreamlint
output/target/usr/lib/qt/examples/xml/xmlstreamlint/xmlstreamlint.pro
output/target/usr/lib/qt/examples/xml/xmlstreamlint/main.cpp
output/target/usr/lib/qt/examples/xml/xmlstreamlint/xmlstreamlint

So like Peter Seiderer suggested, I believe Refik forgot to rebuild after
enabling BR2_PACKAGE_QT5BASE_EXAMPLES.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
