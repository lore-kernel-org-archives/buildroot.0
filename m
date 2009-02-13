From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Feb 2009 09:14:38 +0000 (UTC)
Subject: [Buildroot] [Bug 105] menuconfig segfaults on tinyx if wchar is not
	selected
In-Reply-To: <bug-105-163@https.bugs.busybox.net/>
References: <bug-105-163@https.bugs.busybox.net/>
Message-ID: <20090213091438.6CE8B7644D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=105


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jacmet at uclibc.org
             Status|NEW                         |ASSIGNED




--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  2009-02-13 09:14:37 UTC ---
It seems like Kconfig doesn't like comment entries in choice selections. The
comments were added to make it clear why you can't select xorg/tinyx, but you
are ofcourse not supposed to be able to select those comments.

It seems to me that the easiest fix (besides reporting upstream, the bug exists
in the latest kernel as well) is to move the comments outside the choice /
endchoice


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
