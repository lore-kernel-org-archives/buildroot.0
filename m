From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 23 Mar 2012 22:26:58 +0000 (UTC)
Subject: [Buildroot] [Bug 4922] Please consider introducing host-make for
 building software packages within the buildroot
In-Reply-To: <bug-4922-163@https.bugs.busybox.net/>
References: <bug-4922-163@https.bugs.busybox.net/>
Message-ID: <20120323222658.9D57996946@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4922

--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org> 2012-03-23 22:26:58 UTC ---
(In reply to comment #2)
> I do not want to encourage using a patched make. I only want to let the user
> this possibility. Following your first argument, this implies for me that we
> should also ban host-autoconf, host-automake etc. from the buildroot because
> they need not be specially configured for cross-compiling and, consequently,
> one could easily require the host environment to provide them (as it is
> currently done for 'make'). So I really fail to see how 'make' does not fit
> into the rest of the 'host-' packages.

The choice between building our own or using whatever is present on the host
depends on several factors. Among those are:

- How common is the package? How likely is the user to already have it present?
- Do we have strict version requirements?
- How many dependencies does it have? How long does it take to build (and how
much space does it need)?

I agree with Thomas that I don't really think the scale for make is tipping
towards a host package.


> By the way, autoconf e.g. does get patched in the buildroot.

For bugfixes, yes - Not for features.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
