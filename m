From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  3 Sep 2015 20:26:41 +0000 (UTC)
Subject: [Buildroot] [Bug 7424] undefined reference to
	`__builtin_thread_pointer'
In-Reply-To: <bug-7424-163@https.bugs.busybox.net/>
References: <bug-7424-163@https.bugs.busybox.net/>
Message-ID: <20150903202641.D57C681F59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7424

--- Comment #14 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-09-03 20:26:41 UTC ---
(In reply to comment #13)

> So, if gcc is built without tls, this leads to the error from this ticket.
> After switching threads to something different uclibc builds fine without tls
> in gcc. I think, these two options (BR2_PTHREADS_NATIVE and BR2_GCC_ENABLE_TLS)
> should be connected, since tls has to either be enabled in both gcc and uclibc,
> or likewise disabled in both.

Thanks for the report. Our plan is to make the TLS option no longer visible,
and make TLS mandatory when thread support is enabled. If you want to tackle
that, don't hesitate to send a patch!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
