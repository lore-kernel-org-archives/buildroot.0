From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Jan 2010 17:19:30 +0000 (UTC)
Subject: [Buildroot] [Bug 907] mkisofs: No such file or directory
In-Reply-To: <bug-907-163@https.bugs.busybox.net/>
References: <bug-907-163@https.bugs.busybox.net/>
Message-ID: <20100115171930.44EEB77716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=907





--- Comment #1 from maximus <max@olo.com.pl>  2010-01-15 17:19:28 UTC ---
I found bug in:

target/iso9660/iso9660.mk
MKISOFS_TARGET=$(MKISOFS_DIR)/mkisofs/OBJ/$(HOST_ARCH)-linux-cc/mkisofs

I change it to
MKISOFS_TARGET=$(MKISOFS_DIR)/mkisofs/OBJ/$(ARCH)-linux-cc/mkisofs

and i have
MKISOFS_TARGET=$(MKISOFS_DIR)/mkisofs/OBJ/i686-linux-cc/mkisofs


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
