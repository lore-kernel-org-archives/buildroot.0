From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 21 Apr 2016 10:01:00 +0000
Subject: [Buildroot] [Bug 8861] With buildroot 2016.02 trying to build for
 corei7-avx fails while trying to build host-binutils.
In-Reply-To: <bug-8861-163@https.bugs.busybox.net/>
References: <bug-8861-163@https.bugs.busybox.net/>
Message-ID: <bug-8861-163-IzgU7CO16w@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8861

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Hum, indeed. Thanks for the bug report! Can you try the below patch:

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 4039db8..efa9567 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -226,6 +226,8 @@ config BR2_ARCH
        default "i686"          if BR2_x86_nocona && BR2_i386
        default "i686"          if BR2_x86_core2 && BR2_i386
        default "i686"          if BR2_x86_corei7 && BR2_i386
+       default "i686"          if BR2_x86_corei7_avx && BR2_i386
+       default "i686"          if BR2_x86_corei7_avx2 && BR2_i386
        default "i686"          if BR2_x86_atom && BR2_i386
        default "i686"          if BR2_x86_opteron && BR2_i386
        default "i686"          if BR2_x86_opteron_sse3 && BR2_i386

And then do your configuration from scratch again, and attempt to do the build.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
