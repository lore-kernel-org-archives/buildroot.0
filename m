From: Ran Shalit <ranshalit@gmail.com>
Date: Sun, 19 Nov 2017 08:22:12 +0200
Subject: [Buildroot] Deploy NFS rootfs
In-Reply-To: <20171118220259.35d05c0d@gmx.net>
References: <CAJ2oMhKdX3x4ujPknQ+wDnvj__pQGoYJOLA=fJNEfh6Vd-=zyw@mail.gmail.com>
 <20171118220259.35d05c0d@gmx.net>
Message-ID: <CAJ2oMhK=OG5HXyRKcWyCXp-gje_sxoq0Pg+F+8+PkMcXJjg9DQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Thank you for the information.
I also interested to know if the files inside tar are with different
ownership/privilege.
It is said that we can't run directly from target folder becauae of this.
From that I assume that files in tar must have different owners/privilege.
Is that correct?

Thanks
Ran

?????? 18 ???? 2017 23:24, "Peter Seiderer" <ps.report@gmx.net> ???:
>
> Hello Ran,
>
> On Sat, 18 Nov 2017 22:13:32 +0200, Ran Shalit <ranshalit@gmail.com>
wrote:
>
> > Hello,
> >
> > How should we deploy nfs filsystem.
> > I understand it should not be from /output/target, because of the
> > THIS_IS_NOT_YOUR_ROOT_FILESYSTEM warning.
> > But How should it be done ?
> >
> > Do I need to generate tar from /output/target with different
> > ownership/privilege ?
>
> No need to do it by hand, take a look at 'make menuconfig':
>   Filesystem images ---> tar the root filesystem
> or add 'BR2_TARGET_ROOTFS_TAR=y' to your .config file and
> after the next 'make' your will find the result as
>   images/rootfs.tar
>
> The documentation is missing the enabling option information ;-)
>
> Regards,
> Peter
>
> >
> > Regards,
> > Ran
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171119/582b9700/attachment.html>
