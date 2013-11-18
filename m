From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 18 Nov 2013 16:02:48 +0100
Subject: [Buildroot] [PATCH v3 3/5] eudev: new package.
In-Reply-To: <20131113234133.2b964da0@skate>
References: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1383752078-25315-4-git-send-email-eric.le.bihan.dev@free.fr>
 <20131113234133.2b964da0@skate>
Message-ID: <20131118150247.GB13924@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Wed, Nov 13, 2013 at 11:41:33PM +0100, Thomas Petazzoni wrote:

> > +	  eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs.
>
> I thought devtmpfs was added in 2.6.32. Are there other kernel features
> that are needed to make eudev work?

That's a typo. There are no exotic dependencies (unlike systemd which requires
cgroup and tmpfs).

> Are you using "git format-patch -M" to create your patches? It detects
> renames/copies, and this file appears to be a copy of the one in
> package/udev/, no?

Surprisingly, '-M' is not enough. I must use the '--find-copies-harder' option
to detect the file copy.

> > +comment "eudev requires a toolchain w/ largefile, wchar"
> > +	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
> > +
> > +comment "eudev requires a toolchain w/ dynamic library"
> > +	depends on BR2_PREFER_STATIC_LIB
>
> Can't you group those two comments?

Unfortunately no. If I group them, the text gets cut in the kconfig menu.

Best Regards,
ELB
