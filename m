From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Feb 2017 08:33:31 +0000
Subject: [Buildroot] [Bug 9666] New: qt5quickcontrols install fails
Message-ID: <bug-9666-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9666

            Bug ID: 9666
           Summary: qt5quickcontrols install fails
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: b.terrier at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Using 2017.02-rc1 I encountered an error during the install of
qt5quickcontrols.

I had to remove the line

    cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/PrivateWidgets
$(TARGET_DIR)/usr/qml/QtQuick

in `package/qt5/qt5quickcontrols/qt5quickcontrols.mk` as
`$(STAGING_DIR)/usr/qml/QtQuick/PrivateWidgets` does not exist.

Please note that this allowed the build process to complete, but I did not test
QtQuick Controls 1 on the target device.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
