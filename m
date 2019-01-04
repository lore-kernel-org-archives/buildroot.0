From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 04 Jan 2019 20:35:56 +0000
Subject: [Buildroot] [Bug 10851] Patch to handle numpad Enter key properly
In-Reply-To: <bug-10851-163@https.bugs.busybox.net/>
References: <bug-10851-163@https.bugs.busybox.net/>
Message-ID: <bug-10851-163-EDbEH0DVyl@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10851

--- Comment #4 from Alexandre Esse <alexandre.esse.dev@gmail.com> ---
Hello,

I have the same problem. And I use another workaround that doesn't involves
patch on Buildroot.

Under X:
 - Return keycode is 36 (keysym 0xff0d, Return)
 - Enter (Keypad key) keycode is 104 (keysym 0xff8d, KP_Enter)

Then, I remap the Enter key with ~/.xmodmap.conf file containing one line:
keycode 104 = Return

And apply this configuration: xmodmap ~/.xmodmap.conf

Then, launch: make menuconfig

-- 
You are receiving this mail because:
You are on the CC list for the bug.
