From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  9 Feb 2009 12:10:40 +0000 (UTC)
Subject: [Buildroot] [Bug 91] vsftpd fails to build with ssl support
In-Reply-To: <bug-91-163@https.bugs.busybox.net/>
References: <bug-91-163@https.bugs.busybox.net/>
Message-ID: <20090209121041.63B287644E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=91





--- Comment #1 from Markus Brunner <super.firetwister@googlemail.com>  2009-02-09 12:10:39 UTC ---
Sorry, I forgot to mention that I had to set the LDFLAGS. I'm using an externel
toolchain.

$(VSFTPD_DIR)/$(VSFTPD_BINARY): $(VSFTPD_DIR)/.configured
        $(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)"
LDFLAGS="$(TARGET_LDFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(VSFTPD_DIR)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
