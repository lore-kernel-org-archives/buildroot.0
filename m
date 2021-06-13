From: Jacques Samoun <jacques.samoun33@gmail.com>
Date: Sun, 13 Jun 2021 12:45:22 +0300
Subject: [Buildroot] Buildroot issue since 9 June 2021 ?
In-Reply-To: <87lf7e9lip.fsf@tarshish>
References: <CACaKL1wUo0VwDyXi--E6n-sdpbTtrzdr3XDdfHjgn4TV1D5=2w@mail.gmail.com>
 <87lf7e9lip.fsf@tarshish>
Message-ID: <CACaKL1zA=yzvbKu7eSDiZ7hx_M2BnfPw+pMZ8+sB=FiAzse+8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch

Brilliant,
I applied manually the patch and it allowed to come over this !
Then, it failed a bit further with another package (daemon) but i think i
managed to fix this as well.
Thank you,
Jacques
PS: also from Yokneam :)

On Sun, Jun 13, 2021 at 12:11 PM Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Jacques,
>
> On Sun, Jun 13 2021, Jacques Samoun wrote:
> > i noticed that, since Thurday 9th June, my BR based project could not
> build
> > anymore.
> > It seems that I was able to build till tag "2021.05" (and all the rc's
> > before) but not anymore since then.
> >
> > My build fails on package MTD 2.1.2, where it could not install to target
> >
> > /bin/install -D -m 0755
> > /home/jsadva/work/buildroot/output/build/mtd-2.1.2/ubihealthd
> > /home/jsadva/buildroot/output/target/usr/sbin/ubihealthd
> > /bin/install: cannot stat
> > '/home/jsadva/work/buildroot/output/build/mtd-2.1.2/ubihealthd': No such
> > file or directory
> > make[1]: *** [package/pkg-generic.mk:341:
> >
> /home/jsadva/work/buildroot/output/build/mtd-2.1.2/.stamp_target_installed]
> > Error 1
> >
> > Of course, the buildroot "pull" is the only change to my environment,
> > everything else unchanged (out of tree building)
> > In the bug tracker, i saw a recently logged issue which is quite similar.
> >
> > Has somebody faced this recently ?
>
> You might want to try this patch:
>
>
> http://patchwork.ozlabs.org/project/buildroot/patch/20210609234819.1860554-2-mmayer at broadcom.com/
>
> Or just enable BR2_PACKAGE_MTD_UBIFS_UTILS.
>
> baruch
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210613/b33964ce/attachment.html>
