From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  1 Feb 2014 11:57:47 +0000 (UTC)
Subject: [Buildroot] [Bug 6830] Qt5: no fonts are installed
In-Reply-To: <bug-6830-163@https.bugs.busybox.net/>
References: <bug-6830-163@https.bugs.busybox.net/>
Message-ID: <20140201115747.F192F9C727@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6830

--- Comment #2 from syntheticpp at gmx.net 2014-02-01 11:57:47 UTC ---
Seems -fontconfig disables font installation:

$cat qtbase/mkspecs/features/qpa/genericunixfontdatabase.prf
CONFIG += qpa/basicunixfontdatabase
contains(QT_CONFIG, fontconfig) {
    DEFINES += Q_FONTCONFIGDATABASE
    LIBS += -lfontconfig
} else:!android {
    fonts.path = $$[QT_INSTALL_LIBS]/fonts
    fonts.files = $$QT_SOURCE_TREE/lib/fonts/*
    INSTALLS += fonts
}

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
