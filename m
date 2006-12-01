From: ynezz <ynezz@true.cz>
Date: Fri, 1 Dec 2006 21:47:43 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/udev
In-Reply-To: <20061201175030.GB27853@aon.at>
References: <20061129185944.32BC84858D@busybox.net>
	<20061129213847.GC15202@ibawizard.net>
	<20061201175030.GB27853@aon.at>
Message-ID: <20061201204743.GH15202@ibawizard.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer <rep.nop@aon.at> [2006-12-01 18:50:30]:

> On Wed, Nov 29, 2006 at 10:38:47PM +0100, Petr Stetiar wrote:
> >aldot at uclibc.org <aldot@uclibc.org> [2006-11-29 10:59:44]:
> >
> >> Author: aldot
> >> Date: 2006-11-29 10:59:43 -0800 (Wed, 29 Nov 2006)
> >> New Revision: 16723
> >> 
> >> Log:
> >> - build a udev for the target rather than for the host.
> >
> >Attached patch bumps version to 100, fixes Makefile and init script.
> 
> I use busybox's mdev if i need someone to mknod under me, but ok.
> A few questions / remarks.
> 
> Why do we want to update udev?

That I don't know :) I wanted to try it it and then found out, that it don't
work. So that's why I've send a patch.

> me at s37:~/src/buildroot$ patch --dry-run -p1 -i udev_100.patch 
> missing header for unified diff at line 5 of patch
> can't find file to patch at input line 5
> Perhaps you used the wrong -p or --strip option?

Hm strange, it was just svn diff > udev_100.patch. No additional editing.

> Not your fault, but if !; then echo;exit;fi
> looks like it be saner on context switches and also cycle-wise nicer.

Ok.

> I guess that this is not relevant for people who use udev, so i'll
> pretend to have kept my silence in this respect. Wonder why your system
> takes longer to boot than the system i'm playing with which needs less
> than 15s? *shrug*

:) I'm just playing with my board, I'm using udev just for kernel/fs updating
purposes via USB flash disk and yes, it's big overhead. Didn't know about
mkdev, I'll try it, thanks.

-- ynezz
