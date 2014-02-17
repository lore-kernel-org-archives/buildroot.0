From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 17 Feb 2014 15:37:27 +0100
Subject: [Buildroot] [PATCH 2/2] systemd: enable required kernel
	features.
In-Reply-To: <20140217115721.18895bbb@skate>
References: <1392632536-16714-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1392632536-16714-3-git-send-email-eric.le.bihan.dev@free.fr>
 <20140217115721.18895bbb@skate>
Message-ID: <20140217143726.GB4920@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Mon, Feb 17, 2014 at 11:57:21AM +0100, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
>
> On Mon, 17 Feb 2014 11:22:16 +0100, Eric Le Bihan wrote:
>
> > diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> > index eacc23c..716da2c 100644
> > --- a/package/systemd/Config.in
> > +++ b/package/systemd/Config.in
> > @@ -26,8 +26,16 @@ config BR2_PACKAGE_SYSTEMD
> >  	  elaborate transactional dependency-based service control logic.
> >  	  It can work as a drop-in replacement for sysvinit.
> >
> > -	  Systemd requires a Linux kernel >= 3.0, with inotify, devtmpfs,
> > -	  tmpfs vfs and tmpfs POSIX ACL enabled.
> > +	  Systemd requires a Linux kernel >= 3.0.
> > +
> > +	  The following features will be enabled in the kernel:
> > +
> > +	  - CONFIG_CGROUPS
> > +	  - CONFIG_INOTIFY_USER
> > +	  - CONFIG_FHANDLE
> > +	  - CONFIG_AUTOFS4_FS
> > +	  - CONFIG_TMPFS_POSIX_ACL
> > +	  - CONFIG_TMPFS_XATTR
>
> This formulation is not correct for people who build their kernel
> outside of Buildroot (while the earlier formulation worked for both
> situations).
>
> What about something like:
>
> 	  systemd requires the following options to be enabled in the
> 	  kernel:
>
> 	   - CONFIG_<foo>
> 	   - CONFIG_<bar>
>
> 	  These options will be automatically enabled by Buildroot if
> 	  it is responsible for building the kernel. Otherwise, if you
> 	  are building your kernel outside of Buildroot, make sure
> 	  these options are enabled.
>
Thanks for the suggestion. I'll add it (the more information, the better).

Best regards,
ELB
