From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 17 Sep 2016 13:59:47 +0000
Subject: [Buildroot] [Bug 9226] Firefly boot fails with: "failed to find
	part:boot"
In-Reply-To: <bug-9226-163@https.bugs.busybox.net/>
References: <bug-9226-163@https.bugs.busybox.net/>
Message-ID: <bug-9226-163-0M067if1R8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9226

--- Comment #2 from Ciro Santilli <ciro.santilli@gmail.com> ---
I have managed to boot from TTL as follows:

- enter recovery mode (hold recovery and restart board by resetting)
- download upgrade tool, and official Ubuntu image, and run:

     sudo ./Linux_Upgrade_Tool_v1.2/upgrade_tool uf
Firefly-RK3288_Ubuntu14.04_201607222032.img

   This burns the image to the eMMC.

-  that image works. From inside of it, clear eMMC to ensure that it will not
be used instead of the SD: sudo dd if=/dev/zero of=/dev/mmblk0

-  try again

However I can't get HDMI / VGA output to my screen, only TTL access.

I also tried to insert the cable after boot, but it did not help.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
