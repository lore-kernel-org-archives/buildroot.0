From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Jun 2018 21:15:55 +0000
Subject: [Buildroot] [Bug 11111] raspberry pi 3 b+: missing BSP for 64-bit
 kernel
In-Reply-To: <bug-11111-163@https.bugs.busybox.net/>
References: <bug-11111-163@https.bugs.busybox.net/>
Message-ID: <bug-11111-163-DQCji6OELh@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11111

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to nospam+busybox from comment #0)

Did try the raspberrypi3_64_defconfig (on buildroot-git master) on rpi3b (no
plus), did work out of the box with functional login on HDMI and serial
console.

The three changes which are post 2018.5 are:

- configs/raspberrypi*: bump kernel version (from 4.14.29 to 4.15.39), see [1]
- configs/raspberrypi3_64_defconfig: add support for rpi3b+, see [2]
- package/rpi-firmware: bump version, see [3]

[1]
https://git.buildroot.net/buildroot/commit/configs/raspberrypi3_64_defconfig?id=b677b490f7055963ac1f5a15856a6eab904ccbc7

[2]
https://git.buildroot.net/buildroot/commit/configs/raspberrypi3_64_defconfig?id=fbb45f6d7f937e503900a04ff920320c411d8f34

[3]
https://git.buildroot.net/buildroot/commit/package/rpi-firmware?id=975fff568f9b5ea99d02b1c24d434ee4cb490864

So no need for 1. and 2.

Suggestion 3. works (as expected), patch welcome ;-)

Regards,
Peter

-- 
You are receiving this mail because:
You are on the CC list for the bug.
