From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Aug 2015 12:12:38 +0000 (UTC)
Subject: [Buildroot] [Bug 4099] cut utility from GNU coreutils works
	incorrect
In-Reply-To: <bug-4099-163@https.bugs.busybox.net/>
References: <bug-4099-163@https.bugs.busybox.net/>
Message-ID: <20150826121238.CD8EF81D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4099

--- Comment #3 from wbx at openadk.org 2015-08-26 12:12:38 UTC ---
Hi,

okay, found the reason. 
It seems following options in uClibc config fixes the problem:
UCLIBC_HAS_STDIO_GETC_MACRO=y
UCLIBC_HAS_STDIO_PUTC_MACRO=y

They are both disabled in the default config in Buildroot.
In OpenADK, which I used to verify the issue, the options are on.

So no difference which uClibc version is in use.

best regards
 Waldemar

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
