From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Apr 2009 07:29:25 +0000 (UTC)
Subject: [Buildroot] [Bug 299] add shared-mime-info package
In-Reply-To: <bug-299-163@https.bugs.busybox.net/>
References: <bug-299-163@https.bugs.busybox.net/>
Message-ID: <20090429072925.9ACE17646C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=299





--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2009-04-29 07:29:25 UTC ---
I've committed your patches with small modifications (r26235 and r26236). They
build correctly for me, for my limited testing.

However, there's one thing that I'm not sure about. You re-generate the MIME
cache from $(STAGING_DIR)/usr/share/mime in the POST_INSTALL hook of
shared-mime-info. But what if a Buildroot package adds a file to
$(STAGING_DIR)/usr/share/mime *after* the execution of shared-mime-info's
POST_INSTALL hook ?

If a package adds something in $(STAGING_DIR)/usr/share/mime, it should
probably depend on shared-mime-info, which will trigger the compilation of
shared-mime-info and the execution of its POST_INSTALL hook before the
compilation of the package.

Am I misunderstanding ? If not, what solution does you see to this problem ?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
