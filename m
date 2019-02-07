From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 07 Feb 2019 09:37:08 +0000
Subject: [Buildroot] [Bug 11666] Touchscreen with (Py)Qt5 should use tslib
 instead of evdev
In-Reply-To: <bug-11666-163@https.bugs.busybox.net/>
References: <bug-11666-163@https.bugs.busybox.net/>
Message-ID: <bug-11666-163-hQoigulprS@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11666

Tibor Stolz <tistolz@outlook.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #1 from Tibor Stolz <tistolz@outlook.de> ---
Hello,

I found <http://doc.qt.io/qt-5/embedded-linux.html#touch>, which mentions some
more settings to be done by means of environment variables:

~> QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS='inverty' ./qt5test.py

This works for me, I get proper touchscreen input. (Hardware: BeagleBoneBlack
with 4D Systems gen4-4DCAPE-43T LCD)


There are two options to enable tslib:

~> QT_QPA_FB_TSLIB=1 ./qt5test.py

This seems to completely disable touchscreen input.

~> QT_QPA_EGLFS_TSLIB=1 ./qt5test.py

This seems to have no effect, i.e. touchscreen input works but is still y-wise
inverted.

Since there is no need for tslib in my configuration, as y-wise inversion can
be done without it, I declare this bug as RESOLVED WORKSFORME.

Best regards,
Tibor Stolz

-- 
You are receiving this mail because:
You are on the CC list for the bug.
