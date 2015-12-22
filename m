From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Dec 2015 19:51:31 +0100
Subject: [Buildroot] [PATCH 1/1 v1] nfs-utils: install /etc/nfsmount.conf
In-Reply-To: <alpine.DEB.2.11.1512221934050.15569@tanhuma.tkos.co.il>
References: <1450804337-23440-1-git-send-email-yba@tkos.co.il>
 <20151222172842.GC21998@free.fr>
 <alpine.DEB.2.11.1512221934050.15569@tanhuma.tkos.co.il>
Message-ID: <20151222185131.GD21998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan, All,

On 2015-12-22 19:48 +0200, Jonathan Ben Avraham spake thusly:
> On Tue, 22 Dec 2015, Yann E. MORIN wrote:
> >On 2015-12-22 19:12 +0200, Jonathan Ben-Avraham spake thusly:
> >>From: Jonathan Ben Avraham <yba@tkos.co.il>
[--SNIP--]
> >>+	$(INSTALL) -D -m 644 \
> >>+		$(@D)/utils/mount/nfsmount.conf $(TARGET_DIR)/etc/nfsmount.conf
> >
> >This file is only comments, save for a single un-commented line;
> >   [ NFSMount_Global_Options ]
> >
> >Would it not be better that we just generate a file with just that line,
> >and a comment to see the sources for the format, like so:
> >
> >   # See utils/mount/nfsmount.conf in nfs-utils sources
> >   # for the format of this file.
> >   [ NFSMount_Global_Options ]
> 
> When debugging an unexpected NFS mount problem on a target for which you do
> not have the build system, at a site that might not have Internet access,
> with a root filesystem that might not have the "strings" utility, it is much
> easier to have all of the mount options in front of you rather than to have
> to leave the premises and start searching for the correct nfs-utils sources
> in order to find the full nfsmount.conf. It's just a much more friendly way
> of working. The lack of any nfsmount.conf cost me (my client really) several
> hours of work while I installed "strings" and figured out that there is such
> a thing as nfsmount.conf. It would be unfortunate for others to have to
> repeat this. Most people assigned to debug these types of systems are even
> less experienced than I.

Well, one would argue that the system should have been tested before
being deployed. That's DevOps in action! Hehe! ;-)  (Kidding!)

But as I said: I'm OK with the full file as well. If a user is so
concerned with the size, he can provide a post-build script to tweak
that file, or a rootfs-overlay to provide his own version.

So, my Reviewed-by stands. ;-)

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
