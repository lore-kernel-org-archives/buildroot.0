From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Dec 2013 09:22:33 +0100
Subject: [Buildroot] [PATCH] qt5: install headers into /usr/include/qt5
In-Reply-To: <201312241015.24272.fatih.asici@gmail.com>
References: <1387868037-31734-1-git-send-email-fatih.asici@gmail.com>
 <20131224084720.55ea41c3@skate>
 <201312241015.24272.fatih.asici@gmail.com>
Message-ID: <20131224092233.418c799a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Tue, 24 Dec 2013 10:15:24 +0200, Fatih A??c? wrote:

> g++ -c -pipe -O2 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -fno-exceptions -Wall -W -D_REENTRANT -DQT_NO_LIBUDEV -DQT_NO_XCB -DQT_NO_XKBCOMMON -
> DQT_BUILD_QMLDEVTOOLS_LIB -DQT_BUILDING_QT -DQT_NO_CAST_TO_ASCII -DQT_ASCII_CAST_WARNINGS -DQT_MOC_COMPAT -DQT_USE_QSTRINGBUILDER -DQT_DEPRECATED_WARNINGS -
> DQT_DISABLE_DEPRECATED_BEFORE=0x050000 -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_BOOTSTRAP_LIB -DQT_BOOTSTRAPPED -
> DQT_LITE_UNICODE -DQT_NO_CAST_TO_ASCII -DQT_NO_CODECS -DQT_NO_DATASTREAM -DQT_NO_LIBRARY -DQT_NO_QOBJECT -DQT_NO_SYSTEMLOCALE -DQT_NO_THREAD -DQT_NO_UNICODETABLES -
> DQT_NO_USING_NAMESPACE -DQT_NO_DEPRECATED -DQT_NO_TRANSLATION -DQT_QMAKE_LOCATION="/home/fatih/git/buildroot/output/build/qt5base-5.2.0/bin/qmake" -
> I/home/fatih/git/buildroot/output/host/usr/mkspecs/linux-g++ -I. -I../../include -I../../include/QtQml -I../../include/QtQml/5.2.0 -I../../include/QtQml/5.2.0/QtQml 
> -I/home/fatih/git/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/qt5

This is still really ugly, as it is including target headers when doing
a compilation for the host. If they know what they are doing and know
that including Qt headers is fine and needed, then they should include
them from the Qt source tree and not from the Qt installation tree.

> > To me, this change seems more like work-arounding a problem in the Qt
> > build system rather than a real fix.
> 
> Upstream states[1] that including qt headers from sysroot is not a problem
> since they don't contain anything platform-specific.
> 
> [1] https://bugreports.qt-project.org/browse/QTBUG-35330?focusedCommentId=224486&page=com.atlassian.jira.plugin.system.issuetabpanels:comment-tabpanel#comment-224486

I don't really agree, but if that's what upstream recommends, then ok
for the patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
