From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 26 Nov 2020 20:05:37 +0100
Subject: [Buildroot] Add crontab entries from package
In-Reply-To: <92cb0f53-5289-afec-91e7-fc5e93bf29d2@klomp.eu>
References: <92cb0f53-5289-afec-91e7-fc5e93bf29d2@klomp.eu>
Message-ID: <20201126200537.314f2576@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sven,

On Thu, 26 Nov 2020 11:03:00 +0100, Sven Klomp <mail@klomp.eu> wrote:

> Hello,
>
> I want to add entries to /etc/crontabs/root.
> I know I can add abritary scripts to |BR2_ROOTFS_POST_BUILD_SCRIPT| to
> change files. However, as the crontab entry depends on the package, I
> want to change the file from within thepackage and not globally. How is
> this possible?
> The documentation of |BR2_ROOTFS_POST_BUILD_SCRIPT |makes me think there
> must be another solution:
> "You should, however, use this feature with care. Whenever you find that
> a certain package generates wrong or unneeded files, you should fix that
> package rather than work around it with some post-build cleanup scripts."

Maybe use a root filesystem overlay/BR2_ROOTFS_OVERLAY (see [1])...

Regards,
Peter

[1] https://buildroot.org/downloads/manual/manual.html#rootfs-custom


>
>
> Thanks
> Sven
> ||
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
