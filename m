From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 Jul 2012 19:07:00 +0000 (UTC)
Subject: [Buildroot] [Bug 5366] can't login (root or default)
In-Reply-To: <bug-5366-163@https.bugs.busybox.net/>
References: <bug-5366-163@https.bugs.busybox.net/>
Message-ID: <20120726190700.1B76C96F45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5366

--- Comment #11 from Shokurov Anton V. <anton@fit.com.ru> 2012-07-26 19:06:59 UTC ---
(In reply to comment #9)
> (In reply to comment #8)
> 
> > I think i figures out the cause of the problem.
> > What should the '/bin/login' be? In the versions that work it points to
> > 'busybox'. In the version that does not work (this version) it's a standard
> > executable.
> > 
> > Could this be the reason that i can't login?
> 
> Ah, yes, good point! /bin/login can be provided by util-linux. I thought about
> getty (which I told you already), but I forgot about /bin/login. Can you try
> disabling BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS to see if it works better?
> 

Yup, if i disable BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS it works (i can login).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
