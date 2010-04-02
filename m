From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  2 Apr 2010 15:25:16 +0000 (UTC)
Subject: [Buildroot] [Bug 1393] neon config fails libxml/parser.h: libxml2
 requires, but not dependent on, libiconv
In-Reply-To: <bug-1393-163@https.bugs.busybox.net/>
References: <bug-1393-163@https.bugs.busybox.net/>
Message-ID: <20100402152516.ED3608D9D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1393





--- Comment #2 from Michael J. Hammel <mjhammel@graphics-muse.org>  2010-04-02 15:25:16 UTC ---
Created an attachment (id=1465)
 --> (https://bugs.busybox.net/attachment.cgi?id=1465)
Buildroot config 

I build the cross compiler first, separately, using buildroot.  Then I build
the rootfs.  The xcc source and build trees are completely separate from the
rootfs source and build trees.  I have a metabuild (Makefile, patches, etc.)
that does all this for me.  The metabuild copies over the buildroot tarball to
the build tree, unpacks it, applies patches, copies in the config file (which
is a template that is patched by the metabuild so output goes to the correct
location), and then compiles the rootfs.  The patching of the config file is
done so that all developers can build the project the same way without hard
coded locations in the config file.

My fix to this problem was to enable libiconv in the config file, as shown in
the attachement.

If you'd like to see the metabuild Makefile and includes let me know and I'll
attach them separately.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
