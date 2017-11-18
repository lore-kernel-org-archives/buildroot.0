From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 18 Nov 2017 22:02:59 +0100
Subject: [Buildroot] Deploy NFS rootfs
In-Reply-To: <CAJ2oMhKdX3x4ujPknQ+wDnvj__pQGoYJOLA=fJNEfh6Vd-=zyw@mail.gmail.com>
References: <CAJ2oMhKdX3x4ujPknQ+wDnvj__pQGoYJOLA=fJNEfh6Vd-=zyw@mail.gmail.com>
Message-ID: <20171118220259.35d05c0d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ran,

On Sat, 18 Nov 2017 22:13:32 +0200, Ran Shalit <ranshalit@gmail.com> wrote:

> Hello,
> 
> How should we deploy nfs filsystem.
> I understand it should not be from /output/target, because of the
> THIS_IS_NOT_YOUR_ROOT_FILESYSTEM warning.
> But How should it be done ?
> 
> Do I need to generate tar from /output/target with different
> ownership/privilege ?

No need to do it by hand, take a look at 'make menuconfig':
  Filesystem images ---> tar the root filesystem
or add 'BR2_TARGET_ROOTFS_TAR=y' to your .config file and
after the next 'make' your will find the result as
  images/rootfs.tar

The documentation is missing the enabling option information ;-)

Regards,
Peter

> 
> Regards,
> Ran
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
