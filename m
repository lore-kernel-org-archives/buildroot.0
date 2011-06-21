From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 21 Jun 2011 06:22:45 +0000 (UTC)
Subject: [Buildroot] [Bug 3907] New: 2011.05 - Qt 4.7.3 not building on ARM
Message-ID: <bug-3907-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3907

           Summary: 2011.05 - Qt 4.7.3 not building on ARM
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mailinglists at bluespirit.la
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3457
  --> https://bugs.busybox.net/attachment.cgi?id=3457
Config of buildroot-2011.05

Linking of QtWebKit returns: Too many arguments

Using External toolchain from CodeSoucery
(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103=y).

Also posted in Qt bugtracker: http://bugreports.qt.nokia.com/browse/QTBUG-19988
We should track the changes and/or add a patch in the meantime.


/opt/integra/toolchain-arm-cs1103/usr/bin/arm-none-linux-gnueabi-g++
Wl,-rpath-link,/home/charly/Projects/integra-system/buildroot-2.6.37/build/qt-4.7.3/lib
-Wl,no-undefined -Wl,gc-sections -Wl,-no-undefined -Wl,-O1 -shared
-Wl,-soname,libQtWebKit.so.4 -o libQtWebKit.so.4.7.3
.obj/release-shared-emb-arm/SVGNames.o
.obj/release-shared-emb-arm/SVGElementFactory.o
.obj/release-shared-emb-arm/JSSVGElementWrapperFactory.o
.obj/release-shared-emb-arm/XLinkNames.o
.obj/release-shared-emb-arm/JSCounter.o
.obj/release-shared-emb-arm/JSCSSCharsetRule.o
.obj/release-shared-emb-arm/JSCSSFontFaceRule.o
.obj/release-shared-emb-arm/JSCSSImportRule.o [...]
.obj/release-shared-emb-arm/moc_QtFallbackWebPopup.o
.obj/release-shared-emb-arm/moc_DnsPrefetchHelper.o
.obj/release-shared-emb-arm/moc_qwebframe.o
.obj/release-shared-emb-arm/moc_qwebhistoryinterface.o
.obj/release-shared-emb-arm/moc_qwebpluginfactory.o
.obj/release-shared-emb-arm/moc_qwebinspector.o
.obj/release-shared-emb-arm/qrc_WebCore.o
.obj/release-shared-emb-arm/qrc_WebKit.o
-L/home/charly/Projects/integra-system/buildroot-2.6.37/build/qt-4.7.3/lib
-L../JavaScriptCore/release -ljscore
-L/home/charly/Projects/integra-system/buildroot-2.6.37/build/qt-4.7.3/lib
-lQtGui -lQtNetwork -lQtCore -lpthread
linking ../../../../lib/libQtWebKit.so.4.7.3
Too many arguments
make: *** [../../../../lib/libQtWebKit.so.4.7.3] Error 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
