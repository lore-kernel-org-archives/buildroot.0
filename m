From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  4 Mar 2014 19:57:22 +0000 (UTC)
Subject: [Buildroot] [Bug 6944] building toolchain for sh4 fails
In-Reply-To: <bug-6944-163@https.bugs.busybox.net/>
References: <bug-6944-163@https.bugs.busybox.net/>
Message-ID: <20140304195722.3C6FD9BD2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6944

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-03-04 19:57:20 UTC ---
Thanks for the patch!

However, I am not sure it will work correctly in all cases. It works in your
case because only one multilib variant gets built, and installed in the !m4
directory. But if you have
BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu", then two
multilib variants will be built, and you will have two directories, not one.

Could you check this case?

It's also a bit annoying that on SuperH, specifying a custom gcc option is
needed to even be able to build a kernel. Do you know if there's something that
can be done about it?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
