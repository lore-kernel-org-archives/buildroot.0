From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Aug 2015 12:43:25 +0000 (UTC)
Subject: [Buildroot] [Bug 4099] cut utility from GNU coreutils works
	incorrect
In-Reply-To: <bug-4099-163@https.bugs.busybox.net/>
References: <bug-4099-163@https.bugs.busybox.net/>
Message-ID: <20150826124325.C84FA81E74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4099

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-08-26 12:43:25 UTC ---
(In reply to comment #3)
> Hi,
> 
> okay, found the reason. 
> It seems following options in uClibc config fixes the problem:
> UCLIBC_HAS_STDIO_GETC_MACRO=y
> UCLIBC_HAS_STDIO_PUTC_MACRO=y
> 
> They are both disabled in the default config in Buildroot.
> In OpenADK, which I used to verify the issue, the options are on.
> 
> So no difference which uClibc version is in use.

Thanks for the investigation. In other words, you suggest to enable these
options in Buildroot as well? The help text of these options says "Most people
will answer Y."

(It still seems to be a bug in gnulib to assume that uClibc is always built
with those options enabled...)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
