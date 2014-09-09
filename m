From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  9 Sep 2014 17:01:54 +0000 (UTC)
Subject: [Buildroot] [Bug 6944] building toolchain for sh4 fails
In-Reply-To: <bug-6944-163@https.bugs.busybox.net/>
References: <bug-6944-163@https.bugs.busybox.net/>
Message-ID: <20140909170154.924409D64B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6944

--- Comment #11 from mail at waldemar-brodkorb.de 2014-09-09 17:01:53 UTC ---
Hi,

I don't think removing m4-nofpu is the right thing to create a good kernel.
As gcc does not include support for -mno-implicit-fp, there is no way around
using
a multilib gcc to compile a kernel without floating point instructions.

See here for an interesting thread:
http://sourceforge.net/p/linuxsh/mailman/linuxsh-dev/thread/3B732B78.28B8BF39 at pocketpenguins.com/

It seems Codesourcery has some gcc patches included to support
-mno-implicit-fp.
But the gcc people have rejected it. 

best regards
 Waldemar

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
