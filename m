From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 21 Jan 2016 16:55:49 +0000
Subject: [Buildroot] [Bug 8616] Fail to build for raspberrypi_defconfig with
	big endian
In-Reply-To: <bug-8616-163@https.bugs.busybox.net/>
References: <bug-8616-163@https.bugs.busybox.net/>
Message-ID: <bug-8616-163-eTqMcx1Aa7@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8616

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar> ---
You can't just change endianness arbitrarily and expect that to work.

For starters the pre-compiled rpi-firmware required for the boot process is
only enabled for little-endian, which gives you the error you're seeing because
it's not installed for big-endian.

I don't have much technical detail about the broadcom SOCs used in the rpi1/2
and how open they're to changing endianness, some SOCs require hardware changes
(pin bootstrap), others can be switched in the bootloader, others use fuses and
some can't be changed.
Even if they could be switched in the bootloader for the rpi boards that's a
propietary blob in rpi-firmware, so there's not much you can do.

I'm closing this as invalid.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
