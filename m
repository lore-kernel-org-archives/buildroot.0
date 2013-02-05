From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  5 Feb 2013 14:41:56 +0000 (UTC)
Subject: [Buildroot] [Bug 5900] config flags to the Xenomai build system ...
In-Reply-To: <bug-5900-163@https.bugs.busybox.net/>
References: <bug-5900-163@https.bugs.busybox.net/>
Message-ID: <20130205144156.10DBC9A986@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5900

--- Comment #4 from teratux <raespi@icid.cu> 2013-02-05 14:42:17 UTC ---
I asked the Xenomai team and this is their response:

Xenomai does not do anything special, it uses the autotools default
which is:
- if you pass CFLAGS and LDFLAGS on the right hand of the configure
command line, the generated makefiles are hardcoded with these flags
values, and you need not do anything special later on to get these flags
used for all the compilations. This has been the recommended way of
passing CFLAGS and LDFLAGS when building autotools-based projects for
many years.

- if you want to pass them as environment variables (so, on the left
hand of the configure command line), the makefiles are not generated
with these flags, so, you have to pass them in the environment of the
"make" command.

Maybe buildroot passes the parameters differently ??

(In reply to comment #3)
> They are in fact not necessarily present on the command line because since you
> use the internal backend, we build gcc to generate armv4t code by default, so
> it's not useful to pass -march=armv4t all the time.
> 
> Is Xenomai actually checking the presence of those command line flags directly?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
