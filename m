From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Oct 2014 19:10:18 +0000 (UTC)
Subject: [Buildroot] [Bug 7508] Use of BR2_EXTERNAL and dependencies to
	existing packages
In-Reply-To: <bug-7508-163@https.bugs.busybox.net/>
References: <bug-7508-163@https.bugs.busybox.net/>
Message-ID: <20141020191018.2351EAEF83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7508

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-10-20 19:10:17 UTC ---
I do not understand your use case. You say that the tool is needed for
post-processing linux, uboot, etc. So why do you need to build it _before_
these targets?

It is not a good idea to try and manipulate variables of other packages from a
given package. We will definitely not try to support this as it can break in
many ways. 

If you add a config option for this tool, you can select it explicitly and it
will be built at a right moment. Have you tried this?

If this does not work for you, please describe your use case in more detail.
Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
