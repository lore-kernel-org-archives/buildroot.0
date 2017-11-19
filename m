From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 19 Nov 2017 08:50:42 +0200
Subject: [Buildroot] Deploy NFS rootfs
In-Reply-To: <CAJ2oMhK=OG5HXyRKcWyCXp-gje_sxoq0Pg+F+8+PkMcXJjg9DQ@mail.gmail.com>
References: <CAJ2oMhKdX3x4ujPknQ+wDnvj__pQGoYJOLA=fJNEfh6Vd-=zyw@mail.gmail.com>
 <20171118220259.35d05c0d@gmx.net>
 <CAJ2oMhK=OG5HXyRKcWyCXp-gje_sxoq0Pg+F+8+PkMcXJjg9DQ@mail.gmail.com>
Message-ID: <20171119065042.mrb3qvgv2mnyz4zh@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ran,

On Sun, Nov 19, 2017 at 08:22:12AM +0200, Ran Shalit wrote:
> Thank you for the information.
> I also interested to know if the files inside tar are with different
> ownership/privilege.
> It is said that we can't run directly from target folder becauae of this.
> From that I assume that files in tar must have different owners/privilege.
> Is that correct?

The tar archive contains ownership information per file. To reproduce the 
correct ownership of the files in the root filesystem you must extract the 
rootfs.tar file for your NFS as root. Section 4 of the Buildroot manual[1] 
says this:

  If you need an extracted image of the root filesystem for booting over NFS, 
  then use the tarball image generated in images/ and extract it as root.

See also section 10.6[2] and 13.1.1[3].

[1] http://nightly.buildroot.org/manual.html

[2] http://nightly.buildroot.org/manual.html#faq-why-not-use-target-as-chroot

[3] http://nightly.buildroot.org/manual.html#_boot_the_generated_images

baruch

> ?????? 18 ???? 2017 23:24, "Peter Seiderer" <ps.report@gmx.net> ???:
> >
> > Hello Ran,
> >
> > On Sat, 18 Nov 2017 22:13:32 +0200, Ran Shalit <ranshalit@gmail.com>
> wrote:
> >
> > > Hello,
> > >
> > > How should we deploy nfs filsystem.
> > > I understand it should not be from /output/target, because of the
> > > THIS_IS_NOT_YOUR_ROOT_FILESYSTEM warning.
> > > But How should it be done ?
> > >
> > > Do I need to generate tar from /output/target with different
> > > ownership/privilege ?
> >
> > No need to do it by hand, take a look at 'make menuconfig':
> >   Filesystem images ---> tar the root filesystem
> > or add 'BR2_TARGET_ROOTFS_TAR=y' to your .config file and
> > after the next 'make' your will find the result as
> >   images/rootfs.tar
> >
> > The documentation is missing the enabling option information ;-)
> >
> > Regards,
> > Peter

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
