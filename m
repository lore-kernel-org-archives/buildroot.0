From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Wed, 6 Apr 2011 09:32:34 +0200
Subject: [Buildroot] Buildroot "install" wrapper to preserve file
	permissions
In-Reply-To: <87ei5fx3u2.fsf@macbook.be.48ers.dk>
References: <BANLkTi=gd8UtSZLpam0=Luyq8dZzcdfO_g@mail.gmail.com>
	<20110405215447.135159ef@surf> <87ipuswjux.fsf@macbook.be.48ers.dk>
	<BANLkTimBTeADgaq2F_MhNY-2UTUQGXz0=g@mail.gmail.com>
	<20110405234253.2d0c2700@surf>
	<BANLkTikZ0Dw6ssSc-F9ea2PV2PTxbysj7g@mail.gmail.com>
	<87ei5fx3u2.fsf@macbook.be.48ers.dk>
Message-ID: <BANLkTi=ZVkD8qaHS7Uu7BWNV=n7Zq+HWbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Den 6 april 2011 08:59 skrev Peter Korsgaard <jacmet@uclibc.org>:
> ?>> How does this wrapper works ? I'd like to check if it solve my dbus
> ?>> issue, because I'm not sure that the dbus build system installs it with
> ?>> the correct ownership (permission will probably be correct, but I'm not
> ?>> sure about ownership).
>
> ?Daniel> There is none yet, but as I think of it, it just adds a line in the
> ?Daniel> device_table.txt with the path and permission to the installed files.
>
> ?Daniel> install -o 1000 -g 1000 -m 755 mybinary /usr/bin/mybinary
>
> Something like that, except it should only do so when called with a
> destination directory under $(TARGET_DIR) and only if called with -o or
> -g to set owner/group differently than root/root. As a further
> complication owner/group can be numeric or names, and names have to get
> resolved to the IDs we have in $(TARGET_DIR)/etc/{passwd,group}.
>
> Finally the -o / -g options should get stripped and the request
> forwarded to the real install program.

Thanks for elaborating!

Is there any permissions not allowed to be set by the user? If that's
the case, one could strip -m as well. That would also prevent
execution of target binaries on host system (if that's the case
nowadays? I'm on an old Buildroot version myself).
