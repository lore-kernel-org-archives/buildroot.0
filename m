From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Wed, 5 Dec 2018 07:29:05 +0000
Subject: [Buildroot] Buildroot autobuilder: make[2]: c: Command not found
Message-ID: <225065e1ea283f69952dae60f05daca8e93ebc27.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Just got a report about failed build, see
http://autobuild.buildroot.net/results/cb5/cb555a124bb3bdb9c5a3465673c21022d94cf2ca/

But there's definitely something strange there as instead of "gcc" command "c" gets executed,
see http://autobuild.buildroot.net/results/cb5/cb555a124bb3bdb9c5a3465673c21022d94cf2ca//build-end.log:
------------------------>8-----------------------
c -o option.o -pipe -ffunction-sections -O2 -g  -I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/qmake
-I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/qmake/library -I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-
5.6.3/qmake/generators -I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/qmake/generators/unix
-I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/qmake/generators/win32 -I/home/buildroot/autobuild/run/instance-
0/output/build/qt5base-5.6.3/qmake/generators/mac -I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/qmake/generators/integrity
-I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/include -I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-
5.6.3/include/QtCore -I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/include/QtCore/5.6.3
-I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/include/QtCore/5.6.3/QtCore -I../src/corelib/global -DHAVE_QCONFIG_CPP
-I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/mkspecs/linux-g++ -I/home/buildroot/autobuild/run/instance-
0/output/build/qt5base-5.6.3/tools/shared -DQT_VERSION_STR=\"5.6.3\" -DQT_VERSION_MAJOR=5 -DQT_VERSION_MINOR=6 -DQT_VERSION_PATCH=3 -DQT_BUILD_QMAKE
-DQT_BOOTSTRAPPED -DPROEVALUATOR_FULL -DQT_NO_TEXTCODEC -DQT_NO_UNICODETABLES -DQT_NO_COMPONENT -DQT_NO_COMPRESS -DQT_NO_THREAD -DQT_NO_QOBJECT
-DQT_NO_GEOM_VARIANT -DQT_NO_DATASTREAM -DQT_CRYPTOGRAPHICHASH_ONLY_SHA1 -DQT_JSON_READONLY -DQT_NO_STANDARDPATHS
/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/qmake/option.cpp
make[2]: c: Command not found

make[2]: [option.o] Error 127 (ignored)
c -o property.o -pipe -ffunction-sections -O2 -g  -I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/qmake
-I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/qmake/library -I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-
5.6.3/qmake/generators -I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/qmake/generators/unix
-I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/qmake/generators/win32 -I/home/buildroot/autobuild/run/instance-
0/output/build/qt5base-5.6.3/qmake/generators/mac -I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/qmake/generators/integrity
-I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/include -I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-
5.6.3/include/QtCore -I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/include/QtCore/5.6.3
-I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/include/QtCore/5.6.3/QtCore -I../src/corelib/global -DHAVE_QCONFIG_CPP
-I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/mkspecs/linux-g++ -I/home/buildroot/autobuild/run/instance-
0/output/build/qt5base-5.6.3/tools/shared -DQT_VERSION_STR=\"5.6.3\" -DQT_VERSION_MAJOR=5 -DQT_VERSION_MINOR=6 -DQT_VERSION_PATCH=3 -DQT_BUILD_QMAKE
-DQT_BOOTSTRAPPED -DPROEVALUATOR_FULL -DQT_NO_TEXTCODEC -DQT_NO_UNICODETABLES -DQT_NO_COMPONENT -DQT_NO_COMPRESS -DQT_NO_THREAD -DQT_NO_QOBJECT
-DQT_NO_GEOM_VARIANT -DQT_NO_DATASTREAM -DQT_CRYPTOGRAPHICHASH_ONLY_SHA1 -DQT_JSON_READONLY -DQT_NO_STANDARDPATHS
/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/qmake/property.cpp
make[2]: c: Command not found
------------------------>8-----------------------

Any thoughts?

-Alexey
