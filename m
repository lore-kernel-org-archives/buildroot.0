From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 28 Nov 2015 15:13:39 -0200
Subject: [Buildroot] [PATCH] libtirpc: add dependency on atomic
	operations
In-Reply-To: <20151128180738.747a776a@free-electrons.com>
References: <1448728422-24462-1-git-send-email-sergio.prado@e-labworks.com>
 <20151128180738.747a776a@free-electrons.com>
Message-ID: <CANu7NGvBv_zqPEpR6AEgnd8_Wzz3+sMoFEn5cZRh350Ra7HS9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-11-28 15:07 GMT-02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Sergio,
>
> Thanks for the patch.
>
> On Sat, 28 Nov 2015 14:33:42 -0200, Sergio Prado wrote:
> > Fixes:
> >
> http://autobuild.buildroot.net/results/9e6c3c701e09007860bf842f1877142ea20cbb55
> >
> http://autobuild.buildroot.net/results/dce2b68429734dbd63bab0bf75593b9dc44a5e42
> >
> http://autobuild.buildroot.net/results/9a13d40e7cc54a632b1a4063e7e9fcea5402c368
> >
> > And many more.
> >
> > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> > ---
> >  package/libtirpc/Config.in | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
> > index 2e9c939fa815..a7dfaf79db08 100644
> > --- a/package/libtirpc/Config.in
> > +++ b/package/libtirpc/Config.in
> > @@ -1,6 +1,7 @@
> >  config BR2_PACKAGE_LIBTIRPC
> >       bool "libtirpc"
> >       depends on BR2_TOOLCHAIN_HAS_THREADS
> > +     depends on BR2_ARCH_HAS_ATOMICS
> >       help
>
> This is not correct, because when you add such dependencies, they must
> be replicated in all packages that do "select BR2_PACKAGE_LIBTIRPC".
>
Right.


>
> Also, we have updated libtirpc to version 1.0.1 in the next branch, and
> this new version no longer requires atomic operations. So I believe we
> will leave things as is for 2015.11 (i.e libtirpc broken for
> sparc), and 2016.02 will have the update of libtirpc to 1.0.1.
>
OK, makes sense.


>
> Best regards,
>
Thanks,


>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151128/a61c89d8/attachment.html>
