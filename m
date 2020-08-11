From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2020 07:38:28 +0000
Subject: [Buildroot] [Bug 13146] raspberrypi3_defconfig: "Inappropriate
 ioctl for device" almost at end when sdcard.img is created
In-Reply-To: <bug-13146-163@https.bugs.busybox.net/>
References: <bug-13146-163@https.bugs.busybox.net/>
Message-ID: <bug-13146-163-WJ80FEwG7p@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13146

--- Comment #5 from Marie Maurer <marie.maurer@mmeacs.de> ---
I had to use this line to get it working:

if (ret == -EOPNOTSUPP || ret == -ENOTTY)

Now a sdcard.img was generated. No more error message.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
