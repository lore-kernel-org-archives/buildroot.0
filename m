From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Jul 2017 23:39:32 +0000
Subject: [Buildroot] [Bug 10091] gcc7.1 does not build with graphite support
 due to old isl
In-Reply-To: <bug-10091-163@https.bugs.busybox.net/>
References: <bug-10091-163@https.bugs.busybox.net/>
Message-ID: <bug-10091-163-xDHmbw5d4d@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10091

--- Comment #8 from Ivan <ivan.nazarenko@gmail.com> ---
Created attachment 7126
  --> https://bugs.busybox.net/attachment.cgi?id=7126&action=edit
config of a basic raspberrypi3 + gcc7 + qt + extras

and the config, attached. Note that if I just change gcc to 6.x, everything
builds.

And there is one more odd thing. Some hundreds of lines before this failure, I
noticed this:

g++ -c -pipe -ffunction-sections -O2 -fPIC -std=c++11 -fno-exceptions -Wall -W
-D_REENTRANT -DQT_VERSION_STR='"5.8.0"' -DQT_VERSION_MAJOR=5
-DQT_VERSION_MINOR=8 -DQT_VERSION_PATCH=0 -DQT_BOOTSTRAPPED
-DQT_NO_CAST_TO_ASCII -DQT_NO_FOREACH -DQT_NO_CAST_FROM_ASCII
-DQT_BUILD_BOOTSTRAP_LIB -DQT_BUILDING_QT -DQT_ASCII_CAST_WARNINGS
-DQT_MOC_COMPAT -DQT_USE_QSTRINGBUILDER -DQT_DEPRECATED_WARNINGS
-DQT_DISABLE_DEPRECATED_BEFORE=0x050000 -DQT_NO_EXCEPTIONS
-D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -I.
-I../../3rdparty/zlib -I../../../include -I../../../include/QtCore
-I../../../include/QtCore/5.8.0 -I../../../include/QtCore/5.8.0/QtCore
-I../../../include/QtXml -I../../../include/QtXml/5.8.0
-I../../../include/QtXml/5.8.0/QtXml -I../../../mkspecs/linux-g++ -o
.obj/qvariant.o ../../corelib/kernel/qvariant.cpp
g++ -c -pipe -ffunction-sections -O2 -fPIC -std=c++11 -fno-exceptions -Wall -W
-D_REENTRANT -DQT_VERSION_STR='"5.8.0"' -DQT_VERSION_MAJOR=5
-DQT_VERSION_MINOR=8 -DQT_VERSION_PATCH=0 -DQT_BOOTSTRAPPED
-DQT_NO_CAST_TO_ASCII -DQT_NO_FOREACH -DQT_NO_CAST_FROM_ASCII
-DQT_BUILD_BOOTSTRAP_LIB -DQT_BUILDING_QT -DQT_ASCII_CAST_WARNINGS
-DQT_MOC_COMPAT -DQT_USE_QSTRINGBUILDER -DQT_DEPRECATED_WARNINGS
-DQT_DISABLE_DEPRECATED_BEFORE=0x050000 -DQT_NO_EXCEPTIONS
-D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -I.
-I../../3rdparty/zlib -I../../../include -I../../../include/QtCore
-I../../../include/QtCore/5.8.0 -I../../../include/QtCore/5.8.0/QtCore
-I../../../include/QtXml -I../../../include/QtXml/5.8.0
-I../../../include/QtXml/5.8.0/QtXml -I../../../mkspecs/linux-g++ -o
.obj/qsystemerror.o ../../corelib/kernel/qsystemerror.cpp
g++ -c -pipe -ffunction-sections -O2 -fPIC -std=c++11 -fno-exceptions -Wall -W
-D_REENTRANT -DQT_VERSION_STR='"5.8.0"' -DQT_VERSION_MAJOR=5
-DQT_VERSION_MINOR=8 -DQT_VERSION_PATCH=0 -DQT_BOOTSTRAPPED
-DQT_NO_CAST_TO_ASCII -DQT_NO_FOREACH -DQT_NO_CAST_FROM_ASCII
-DQT_BUILD_BOOTSTRAP_LIB -DQT_BUILDING_QT -DQT_ASCII_CAST_WARNINGS
-DQT_MOC_COMPAT -DQT_USE_QSTRINGBUILDER -DQT_DEPRECATED_WARNINGS
-DQT_DISABLE_DEPRECATED_BEFORE=0x050000 -DQT_NO_EXCEPTIONS
-D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -I.
-I../../3rdparty/zlib -I../../../include -I../../../include/QtCore
-I../../../include/QtCore/5.8.0 -I../../../include/QtCore/5.8.0/QtCore
-I../../../include/QtXml -I../../../include/QtXml/5.8.0
-I../../../include/QtXml/5.8.0/QtXml -I../../../mkspecs/linux-g++ -o
.obj/quuid.o ../../corelib/plugin/quuid.cpp
g++ -c -pipe -ffunction-sections -O2 -fPIC -std=c++11 -fno-exceptions -Wall -W
-D_REENTRANT -DQT_VERSION_STR='"5.8.0"' -DQT_VERSION_MAJOR=5
-DQT_VERSION_MINOR=8 -DQT_VERSION_PATCH=0 -DQT_BOOTSTRAPPED
-DQT_NO_CAST_TO_ASCII -DQT_NO_FOREACH -DQT_NO_CAST_FROM_ASCII
-DQT_BUILD_BOOTSTRAP_LIB -DQT_BUILDING_QT -DQT_ASCII_CAST_WARNINGS
-DQT_MOC_COMPAT -DQT_USE_QSTRINGBUILDER -DQT_DEPRECATED_WARNINGS
-DQT_DISABLE_DEPRECATED_BEFORE=0x050000 -DQT_NO_EXCEPTIONS
-D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -I.
-I../../3rdparty/zlib -I../../../include -I../../../include/QtCore
-I../../../include/QtCore/5.8.0 -I../../../include/QtCore/5.8.0/QtCore
-I../../../include/QtXml -I../../../include/QtXml/5.8.0
-I../../../include/QtXml/5.8.0/QtXml -I../../../mkspecs/linux-g++ -o
.obj/qbitarray.o ../../corelib/tools/qbitarray.cpp

The odd thing is why my system compiler is being called instead of the one
provided by buildroot?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
