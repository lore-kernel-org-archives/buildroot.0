From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2009 12:12:52 +0000 (UTC)
Subject: [Buildroot] [Bug 505] live555: new package
In-Reply-To: <bug-505-163@https.bugs.busybox.net/>
References: <bug-505-163@https.bugs.busybox.net/>
Message-ID: <20090730121252.573E17781B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=505





--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2009-07-30 12:12:51 UTC ---
After a quick look at the patch :
 * I think we could make the config.arm-linux thing a little more generic, so
as to support other architectures as well
 * The config.arm-linux should probably be generated, or at least sed'ed by the
.mk file, to really use $(TARGET_CC), $(TARGET_CFLAGS), $(TARGET_LD),
$(TARGET_LDFLAGS), etc. This would for example fix this package with external
toolchains


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
