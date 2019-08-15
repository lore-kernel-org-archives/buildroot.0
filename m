From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Aug 2019 12:04:55 +0000
Subject: [Buildroot] [Bug 11741] pigpio does not build host-pigpio.
In-Reply-To: <bug-11741-163@https.bugs.busybox.net/>
References: <bug-11741-163@https.bugs.busybox.net/>
Message-ID: <bug-11741-163-TQdSEjF2uT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11741

--- Comment #1 from Ivan <ivan.nazarenko@gmail.com> ---

It is only 3 ".h" files that are not being installed in staging.
Just adding these 3 lines to pigpio.mk would solve this issue:

diff a/package/pigpio.mk b/package/pigpio.mk
22a23,25
> 	$(INSTALL) -D -m 0644 $(@D)/pigpio.h $(STAGING_DIR)/usr/include/pigpio.h
> 	$(INSTALL) -D -m 0644 $(@D)/pigpiod_if.h $(STAGING_DIR)/usr/include/pigpiod_if.h
> 	$(INSTALL) -D -m 0644 $(@D)/pigpiod_if2.h $(STAGING_DIR)/usr/include/pigpiod_if2.h

-- 
You are receiving this mail because:
You are on the CC list for the bug.
