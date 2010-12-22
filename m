From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Dec 2010 09:14:04 +0000 (UTC)
Subject: [Buildroot] [Bug 2875] Kernel doesn't build Ext2 support
	out-of-the-box
In-Reply-To: <bug-2875-163@https.bugs.busybox.net/>
References: <bug-2875-163@https.bugs.busybox.net/>
Message-ID: <20101222091404.B58E688F68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2875

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Well, in general we only try to minimally interact with the kernel
configuration. For example, regardless of whether IPv6 is enabled or not at the
toolchain level, we do not enforce IPv6 configuration at the kernel level. Or
it's not because you have enabled the iptables package that we enforce
Netfilter configuration at the kernel level. I don't think Buildroot can
replace the embedded developer Linux brain and skills, it would involve too
much black magic.

Therefore, I'm tempted to say that we should live it as it is in the code. But
we could definitely improve the documentation.

I will not mark the bug as WONTFIX, waiting for other Buildroot developers to
comment.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
