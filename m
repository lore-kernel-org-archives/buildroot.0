From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 30 Aug 2009 06:08:41 +0000 (UTC)
Subject: [Buildroot] [Bug 527] misc fixes for dnsmasq package
In-Reply-To: <bug-527-163@https.bugs.busybox.net/>
References: <bug-527-163@https.bugs.busybox.net/>
Message-ID: <20090830060842.1D83377753@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=527





--- Comment #16 from Peter Korsgaard <jacmet@uclibc.org>  2009-08-30 06:08:41 UTC ---
(In reply to comment #15)
> Created an attachment (id=613)
 --> (https://bugs.busybox.net/attachment.cgi?id=613) [details]
> dnsmasq.mk converted to new autotools package format

Thanks. I noticed:

+       $(SED) 's^--ldflags dbus-1^--ldflags dbus-1 \| sed
s\\\#-I/\\\#-I$(STAGING_DIR)/\\\#g^' \
                $(DNSMASQ_DIR)/Makefile

There's no such line in the dnsmasq makefile and afaik pkg-config doesn't even
accept the --ldflags option. Did you mean --libs instead?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
