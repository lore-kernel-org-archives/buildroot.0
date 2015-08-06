From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  6 Aug 2015 21:03:45 +0000 (UTC)
Subject: [Buildroot] [Bug 8266] mplayer build issue
In-Reply-To: <bug-8266-163@https.bugs.busybox.net/>
References: <bug-8266-163@https.bugs.busybox.net/>
Message-ID: <20150806210345.92A5B81ECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8266

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-08-06 21:03:43 UTC ---
Thanks for your bug report. Can you make sure that the problem still occurs
after disabling ccache support and doing a "make clean all" ?

Also:

BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-float=hard --with-fpu=vfpv4-d16"
BR2_TARGET_OPTIMIZATION=" -pipe -mfpu=vfpv4-d16 -mfloat-abi=hard"

are not needed. If you want --with-float=hard, select EABIhf instead of EABI in
the Target options. The FPU type is already passed since you selected
BR2_ARM_FPU_VFPV4D16=y.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
