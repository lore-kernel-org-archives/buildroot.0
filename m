From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 27 Oct 2009 16:01:50 +0000 (UTC)
Subject: [Buildroot] [Bug 683] SDL-dfb does not select directfb
In-Reply-To: <bug-683-163@https.bugs.busybox.net/>
References: <bug-683-163@https.bugs.busybox.net/>
Message-ID: <20091027160150.E22DC77687@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=683





--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2009-10-27 16:01:49 UTC ---
Thanks Damien for reporting the issue.

I'm wondering whether we should use a select as you suggested, or a depends on.
We usually use "select" so that the user doesn't need to care about missing
dependencies. But in the case of DirectFB, many things can (and should ?) be
configured at the DirectFB level, so I'm not sure that selecting DirectFB
behind the user's back is good.

something like:

 config BR2_PACKAGE_SDL_DIRECTFB
        bool "SDL DirectFB video driver"
+       depends on BR2_PACKAGE_DIRECTFB

+ comment "sdl-dfb requires directfb support"
+        depends on !BR2_PACKAGE_DIRECTFB

Peter, your opinion on this ?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
