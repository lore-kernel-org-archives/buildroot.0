From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 15 Apr 2012 05:32:59 +0000 (UTC)
Subject: [Buildroot] [Bug 5102] qt package moc, uic,
	rcc read from wrong place
In-Reply-To: <bug-5102-163@https.bugs.busybox.net/>
References: <bug-5102-163@https.bugs.busybox.net/>
Message-ID: <20120415053259.686BB96AB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5102

--- Comment #2 from mehdi <mehsamadi@yahoo.com> 2012-04-15 05:32:58 UTC ---
Created attachment 4274
  --> https://bugs.busybox.net/attachment.cgi?id=4274
qt cross compile log

Buildroot compilation have no error but when I try to cross compile a qt
application it gives me an error. I tried to cross compile spreadsheet example
of qt. I set QMAKESPEC=/arm-linux-qt/mkspecs/qws/linux-arm-g++. Here is the
Makefile that qmake created( qmake.Makefile ).
I followed it to qt compilation and the config.status(
buildroot.qt.config.status) of qt source has this : 
-hostprefix
/home/emb/projects/logger/build-tools/buildroot-2012.02/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot
that could be the cause.

here is the cross compilation commands and the error:

qt-book/chap03/spreadsheet> /arm-linux-qt/bin/qmake -project
qt-book/chap03/spreadsheet> /arm-linux-qt/bin/qmake spreadsheet.pro 
qt-book/chap03/spreadsheet> make
buildroot-2012.02/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/bin/uic
gotocelldialog.ui -o ui_gotocelldialog.h
make:
buildroot-2012.02/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/bin/uic:
Command not found
make: *** [ui_gotocelldialog.h] Error 127

if I copy uic and moc and rcc to
buildroot-2012.02/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/bin/
from buildroot-2012.02/output/host/usr/bin
it compiles fine. But with same configuration by suing 2011.11 version It tries
to run uic and all from correct place.

Thanx for your time and great job with buildroot :-).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
