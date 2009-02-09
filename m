From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  9 Feb 2009 15:02:39 +0000 (UTC)
Subject: [Buildroot] [Bug 91] vsftpd fails to build with ssl support
In-Reply-To: <bug-91-163@https.bugs.busybox.net/>
References: <bug-91-163@https.bugs.busybox.net/>
Message-ID: <20090209150240.67585764FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=91


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jacmet at uclibc.org
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME




--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  2009-02-09 15:02:37 UTC ---
I cannot reproduce this here, vsftpd.mk has:

ifeq ($(BR2_PACKAGE_OPENSSL),y)
VSFTPD_LIBS:=-lcrypt -lssl
else
VSFTPD_LIBS:=-lcrypt
endif

And:

$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" LIBS="$(VSFTPD_LIBS)" -C
$(VSFTPD_DIR)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
