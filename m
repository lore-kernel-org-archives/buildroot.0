From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Jul 2010 07:08:19 +0000 (UTC)
Subject: [Buildroot] [Bug 635] util-linux fails to build in 2009.08
In-Reply-To: <bug-635-163@https.bugs.busybox.net/>
References: <bug-635-163@https.bugs.busybox.net/>
Message-ID: <20100729070819.4CBF883670@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=635

--- Comment #7 from Peter Korsgaard <jacmet@uclibc.org>  ---
(In reply to comment #6)
> Created attachment 2269 [details]
> last .config
> 
> (In reply to comment #5)
> > Please provide your Buildroot .config to allow us to reproduce the issue.
> 
> linux/a.out.h seems to belongs to kernel headers and I don't have a kernel
> cross-compiled. which make more.c depends on kernel-headers, because needs 3
> constants ?! OMAGIC NMAGIC ZMAGIC. 

Yes, kernel headers are seperate from building a kernel for your target.

linux/a.out.h is a legacy header (for the a.out format), which is only
available on the following archs:

ls arch/*/include/asm/a.out.h                      ~/source/linux-2.6
arch/alpha/include/asm/a.out.h  arch/m68k/include/asm/a.out.h
arch/arm/include/asm/a.out.h    arch/x86/include/asm/a.out.h

So that won't work on mipsel.

I'll see what we can do about it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
