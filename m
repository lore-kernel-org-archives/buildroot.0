From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 23 Sep 2007 18:12:45 +0200
Subject: [Buildroot] Qtopia4 Failure
Message-ID: <1190563965.7015.21.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anyone building qtopia?
I get (when compiling with gcc-4.2.1/binutils-2.18/uclibc-0.9.29):


arm-linux-g++ -c -pipe -g -g -fvisibility=hidden
-fvisibility-inlines-hidden -Wall -W -D_REENTRANT -fPIC -DQT_SHARED
-DTSLIBMOUSEHANDLER_DEBUG -DQT_BUILD_CORE_LIB -DQT_NO_CAST_TO_ASCII
-DQT_ASCII_CAST_WARNINGS -DQT3_SUPPORT -DQT_MOC_COMPAT
-D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE
-I../../mkspecs/qws/linux-arm-g++ -I. -I../../include
-I../../include/QtCore -Iglobal -I.moc/debug-shared-emb-arm
-I.uic/debug-shared-emb-arm
-o .obj/debug-shared-emb-arm/qresource_iterator.o
io/qresource_iterator.cpp
io/qresource_iterator.cpp:46:66: error: macro "index" requires 2
arguments, but only 1 given
io/qresource_iterator.cpp: In constructor
?QResourceFileEngineIterator::QResourceFileEngineIterator(QFlags<QDir::Filter>, const QStringList&)?:
io/qresource_iterator.cpp:47: error: expected `(' before ?{? token
make[2]: *** [.obj/debug-shared-emb-arm/qresource_iterator.o] Fel 1


when compiling "src/corelib/io/qresource_iterator.cpp"
This is the line giving problems.

QResourceFileEngineIterator::QResourceFileEngineIterator(QDir::Filters
filters,
                                                         const
QStringList &filterNames)
    : QAbstractFileEngineIterator(filters, filterNames), index(-1)
{
}



Best Regards
Ulf Samuelsson
