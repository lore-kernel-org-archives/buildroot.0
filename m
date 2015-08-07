From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Aug 2015 10:52:00 +0000 (UTC)
Subject: [Buildroot] [Bug 8266] mplayer build issue
In-Reply-To: <bug-8266-163@https.bugs.busybox.net/>
References: <bug-8266-163@https.bugs.busybox.net/>
Message-ID: <20150807105200.CBEEF81EE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8266

--- Comment #2 from Siegfried Siegert <s.siegert@atb-online.eu> 2015-08-07 10:52:00 UTC ---
(In reply to comment #1)
> Can you make sure that the problem still occurs
> after disabling ccache support and doing a "make clean all" ?

same issue again after "make clean all" without ccache.

> 
> Also:
> 
> BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-float=hard --with-fpu=vfpv4-d16"
> BR2_TARGET_OPTIMIZATION=" -pipe -mfpu=vfpv4-d16 -mfloat-abi=hard"
> 
> are not needed. If you want --with-float=hard, select EABIhf instead of EABI in
> the Target options. The FPU type is already passed since you selected
> BR2_ARM_FPU_VFPV4D16=y.

Made further tests with and without this options, also tried EABIhf instead of
EABI (always "make clean all" after configuration change) without any different
result.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
