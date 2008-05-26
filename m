From: Hebbar <gururajakr@sanyo.co.in>
Date: Mon, 26 May 2008 02:41:20 -0700 (PDT)
Subject: [Buildroot] Need few clarification/help regarding qtopia & x11 build
Message-ID: <17468762.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


HI all,

This is with respect to porting qtopia-phone to buildroot. 1st i am trying
at my end. once all goes well will forwar it to buildroot. b4 that i need
few help,

I used the qtopia build from john voltz buildroot fork tree & Recently i
came across his google code and found he had made few changes to qtopia
build. i tried to implement the same into qtopia
phone(qtopia-opensource-4.3.1) and few bugs here and there. 
 
1 main thing is that when he sed the qmake.conf file for qmake_cxx , it
edits all the references of qmake_cxx and not just qmake_cxx, i mean it also
changes below variables. kindly help me to resolve the same. how to make the
sed edit only the mentioned qmake_cxx.

this edit 

$(SED) '\,QMAKE_CXX, c\QMAKE_CXX = $(TARGET_CXX)'
$(QTOPIA_PHONE_TARGET_DIR)/qtopiacore/qt/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA_PHONE_EMB_PLATFORM)-g++/qmake.conf
 
changes 
 

QMAKE_CXX  = arm-linux-g++
QMAKE_CXXFLAGS  = $$QMAKE_CFLAGS -DQT_QWS_CELLON -DQWS -fno-rtti
QMAKE_CXXFLAGS_WARN_ON = $$QMAKE_CFLAGS_WARN_ON
QMAKE_CXXFLAGS_WARN_OFF = $$QMAKE_CFLAGS_WARN_OFF
QMAKE_CXXFLAGS_RELEASE = $$QMAKE_CFLAGS_RELEASE
QMAKE_CXXFLAGS_DEBUG = $$QMAKE_CFLAGS_DEBUG
QMAKE_CXXFLAGS_SHLIB = $$QMAKE_CFLAGS_SHLIB
QMAKE_CXXFLAGS_YACC = $$QMAKE_CFLAGS_YACC
QMAKE_CXXFLAGS_THREAD = $$QMAKE_CFLAGS_THREAD
 
to 
 
QMAKE_CXX =
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-g++
QMAKE_CXX =
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-g++
QMAKE_CXX =
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-g++
QMAKE_CXX =
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-g++
QMAKE_CXX =
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-g++
QMAKE_CXX =
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-g++
QMAKE_CXX =
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-g++
QMAKE_CXX =
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-g++
QMAKE_CXX =
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-g++
QMAKE_CXX =
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-g++
 
 
 
Also
 
$(SED) '\,QMAKE_LINK, c\QMAKE_LINK = $(TARGET_CXX)'
$(QTOPIA_PHONE_TARGET_DIR)/qtopiacore/qt/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA_PHONE_EMB_PLATFORM)-g++/qmake.conf
 
changes
 
QMAKE_LINK  = arm-linux-g++
QMAKE_LINK_SHLIB = arm-linux-g++
 
to 
 
QMAKE_LINK =
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-g++
QMAKE_LINK =
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-g++
 

Also i think he contributed for the xserver implementation and thanks to he
i learnt a lot and now i am successfully running xserver on arm926ejs with
tslib, xcalibrate and many other x11 apps. i added a few patches taken from
openembedded and now tslib, xcalibrate and many other works very nicely. i
can send the patch if  buildrrot needs it. 
 
Thanks in advance
 
Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/Need-few-clarification-help-regarding-qtopia----x11-build-tp17468762p17468762.html
Sent from the BuildRoot mailing list archive at Nabble.com.
