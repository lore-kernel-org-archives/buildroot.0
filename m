From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  4 Sep 2015 10:50:16 +0000 (UTC)
Subject: [Buildroot] [Bug 7424] undefined reference to
	`__builtin_thread_pointer'
In-Reply-To: <bug-7424-163@https.bugs.busybox.net/>
References: <bug-7424-163@https.bugs.busybox.net/>
Message-ID: <20150904105016.ABEFE81F7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7424

--- Comment #15 from Alex Potapenko <opotapenko@gmail.com> 2015-09-04 10:50:15 UTC ---
(In reply to comment #14)
> Thanks for the report. Our plan is to make the TLS option no longer visible,
> and make TLS mandatory when thread support is enabled. If you want to tackle
> that, don't hesitate to send a patch!

I think forcing TLS is a good idea, and BR2_PTHREADS_NATIVE should be the only
threads option (if enabled) for uclibc, as with uclibc-ng.

If I had known about TLS when I was building my original toolchains for my
Optware-ng project using Buildroot-2015-02, I would have enabled it. For now,
until I eventually migrate to uclibc-ng (plan to create new feeds and abandon
old ones), I have to make sure that upgraded toolchains are compatible with the
old ones, so have to disable TLS.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
