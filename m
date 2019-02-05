From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 05 Feb 2019 15:45:58 +0000
Subject: [Buildroot] [Bug 11666] New: Touchscreen with (Py)Qt5 should use
 tslib instead of evdev
Message-ID: <bug-11666-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11666

            Bug ID: 11666
           Summary: Touchscreen with (Py)Qt5 should use tslib instead of
                    evdev
           Product: buildroot
           Version: 2018.02.9
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: tistolz at outlook.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7946
  --> https://bugs.busybox.net/attachment.cgi?id=7946&action=edit
PyQt5 test application

Hello,

I compiled Qt5 with Tslib support (BR2_PACKAGE_QT5BASE_TSLIB=y), and
ts_calibrate and ts_test work properly. I also have a
/usr/lib/qt/plugins/generic/libqtslibplugin.so, so the compilation part seems
to have worked.

I created a tiny PyQt5 test application (see attachment), which creates 4
buttons. When I run this qt5test.py, the y-axis of the touchscreen appears
inverted (x-axis ok).

I've read
http://lists.busybox.net/pipermail/buildroot/2015-November/143571.html and from
that it seems that my PyQt5 application uses evdev instead of tslib for input.
I can use an extra environment variable:

~> QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS='rotate=180' ./qt5test.py

Now the touchscreen is indeed rotated by 180 degrees, i.e. the x-axis is
inverted while the y-axis is ok. Further trials with 'rotate=90' or
'rotate=270' changed the touchscreen orientation accordingly, but none is
usable to cancel the inversion of the y-axis.

What strikes me is that the above is an **evdev** option, despite the fact that
I want to use Qt5 with **tslib**. I've read about a "-plugin tslib"
command-line option, but that changes nothing with my Python script.

So I'm going to need either a way to switch to tslib (preferred), or a
QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS value that just flips the y-axis.^

Any help or info will be really appreciated.

Best regards,
Tibor Stolz

-- 
You are receiving this mail because:
You are on the CC list for the bug.
