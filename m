From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  2 May 2014 17:22:27 +0000 (UTC)
Subject: [Buildroot] [Bug 6944] building toolchain for sh4 fails
In-Reply-To: <bug-6944-163@https.bugs.busybox.net/>
References: <bug-6944-163@https.bugs.busybox.net/>
Message-ID: <20140502172227.5303F9CABB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6944

--- Comment #9 from George <gdalex@gmail.com> 2014-05-02 17:22:26 UTC ---
Yes, I was able to build using the default defconfig for ecovec24.
I had to modify the ./arch/sh/Makefile in that kernel by removing the -m4-nofpu
for sh4.


cflags-$(CONFIG_CPU_SH4)        := $(call cc-option,-m4,) \
    $(call cc-option,-mno-implicit-fp)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
