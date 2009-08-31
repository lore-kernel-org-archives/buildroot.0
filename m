From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 31 Aug 2009 08:30:16 +0000 (UTC)
Subject: [Buildroot] [Bug 457] e2fsprogs link problem
In-Reply-To: <bug-457-163@https.bugs.busybox.net/>
References: <bug-457-163@https.bugs.busybox.net/>
Message-ID: <20090831083016.D69E177740@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=457





--- Comment #6 from Lionel Landwerlin <lionel.landwerlin@openwide.fr>  2009-08-31 08:30:16 UTC ---
(In reply to comment #5)
> (In reply to comment #0)
> > Hi,
> > 
> > when link e2fsck from the e2fsprogs package, you might experience a problem at
> > the link. e2fsck is looking for -lintl.
> > 
> > Please find a fix as attachment.
> 
> What problem is your patch fixing exactly? It doesn't look like e2fsprogs uses
> libintl.
> 

It adds the --sysroot option when linking. This problem only appears with an
external toolchain when sysroot is the staging directory instead of the
original sysroot of the toolchain (for me its in /opt/STM/STLinux-2.3/...).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
