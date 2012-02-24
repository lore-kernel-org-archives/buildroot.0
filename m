From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Fri, 24 Feb 2012 17:35:10 +0100
Subject: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
In-Reply-To: <63D6870D443E63419AC4A0C97B86C092030FCA26@MBXCLUSTER.mdh.local>
References: <20120223171716.GA5622@tarshish>
 <63D6870D443E63419AC4A0C97B86C092030FCA22@MBXCLUSTER.mdh.local>
 <CAGm1_kut30F-BRwP8pwxbonFGJkJATSKBcJpisE0C1=QY9Ld9Q@mail.gmail.com>
 <63D6870D443E63419AC4A0C97B86C092030FCA23@MBXCLUSTER.mdh.local>
 <CAGm1_ksrQ9Hp6LL4YiETokRf5gvJDpx3hmLqEUdSMg8eFE_xVA@mail.gmail.com>
 <63D6870D443E63419AC4A0C97B86C092030FCA24@MBXCLUSTER.mdh.local>
 <CAGm1_kuoq9uoEPVDUftFeUS9xfrtri_GTf-r9R0fuoZ1=woH3Q@mail.gmail.com>
 <63D6870D443E63419AC4A0C97B86C092030FCA25@MBXCLUSTER.mdh.local>
 <20120224154055.GB6613@game.jcrosoft.org>
 <63D6870D443E63419AC4A0C97B86C092030FCA26@MBXCLUSTER.mdh.local>
Message-ID: <20120224163510.GC6613@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16:58 Fri 24 Feb     , Mikael ?sberg wrote:
> 
> >in barebox wecan boot a raw image and we did on imx to boot in less than 400ms
> 
> Aha, that sounds great! By "raw image" do you mean the vmlinux image?
no excatly

I'm outside I do'nt have the doc with me but IIRC, I did ~700ms with a zImage
with lzo but this will depends on where do you boot from.

But this will depends also on your rootfs and so on.

Best Regards,
J.
> 
> --------------------------------------------------------------
> Mikael ?sberg
> PhD student (Doktorand), Computer Engineering
> School of Innovation, Design and Engineering
> M?lardalen University, V?ster?s Sweden
> Phone: +46(0)21 101502
> Room nr: U1-145
> Mail: mikael.asberg at mdh.se
> --------------------------------------------------------------
> ________________________________________
> Fr?n: Jean-Christophe PLAGNIOL-VILLARD [plagnioj at jcrosoft.com]
> Skickat: den 24 februari 2012 16:40
> Till: Mikael ?sberg
> Kopia: Yegor Yefremov; buildroot at busybox.net
> ?mne: Re: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
> 
> On 16:22 Fri 24 Feb     , Mikael ?sberg wrote:
> >
> > This application is for the automotive industry. In a car, the embedded system must be able to boot within maximum ~1 second. I was thinking, can I use mkimage to convert vmlinux to an uImage (uncompressed version)?
> > Or, is there a setting in Buildroot or Barebox where I can specify the builder to not compress the uImage?
> in barebox wecan boot a raw image and we did on imx to boot in less than 400ms
> 
> Best Regards,
> J.
> >
> > --------------------------------------------------------------
> > Mikael ?sberg
> > PhD student (Doktorand), Computer Engineering
> > School of Innovation, Design and Engineering
> > M?lardalen University, V?ster?s Sweden
> > Phone: +46(0)21 101502
> > Room nr: U1-145
> > Mail: mikael.asberg at mdh.se
> > --------------------------------------------------------------
> > ________________________________________
> > Fr?n: Yegor Yefremov [yegorslists at googlemail.com]
> > Skickat: den 24 februari 2012 16:10
> > Till: Mikael ?sberg
> > Kopia: buildroot at busybox.net
> > ?mne: Re: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
> >
> > I don't know, if it is possible to pack vmlinuz in uImage. Why do you need this?
> >
> > On Fri, Feb 24, 2012 at 3:33 PM, Mikael ?sberg <mikael.asberg@mdh.se> wrote:
> > >
> > > Ahh ok. Do you know how to create an uImage which is not compressed?
> > >
> > > --------------------------------------------------------------
> > > Mikael ?sberg
> > > PhD student (Doktorand), Computer Engineering
> > > School of Innovation, Design and Engineering
> > > M?lardalen University, V?ster?s Sweden
> > > Phone: +46(0)21 101502
> > > Room nr: U1-145
> > > Mail: mikael.asberg at mdh.se
> > > --------------------------------------------------------------
> > > ________________________________________
> > > Fr?n: Yegor Yefremov [yegorslists at googlemail.com]
> > > Skickat: den 24 februari 2012 15:06
> > > Till: Mikael ?sberg
> > > Kopia: buildroot at busybox.net
> > > ?mne: Re: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
> > >
> > > This is zImage with u-boot specific wrapper. uImage will be created
> > > from zImage using mkimage tool.
> > >
> > > Yegor
> > >
> > > On Fri, Feb 24, 2012 at 2:53 PM, Mikael ?sberg <mikael.asberg@mdh.se> wrote:
> > >> Hi,
> > >>
> > >> Ok, but is uImage a compressed file like zImage? If yes, can I de-compress it somehow?
> > >>
> > >> Regards
> > >>
> > >> --------------------------------------------------------------
> > >> Mikael ?sberg
> > >> PhD student (Doktorand), Computer Engineering
> > >> School of Innovation, Design and Engineering
> > >> M?lardalen University, V?ster?s Sweden
> > >> Phone: +46(0)21 101502
> > >> Room nr: U1-145
> > >> Mail: mikael.asberg at mdh.se
> > >> --------------------------------------------------------------
> > >> ________________________________________
> > >> Fr?n: Yegor Yefremov [yegorslists at googlemail.com]
> > >> Skickat: den 24 februari 2012 14:33
> > >> Till: Mikael ?sberg
> > >> Kopia: Baruch Siach; buildroot at busybox.net
> > >> ?mne: Re: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
> > >>
> > >> AFAIK it is always uImage format for both u-boot and barebox. RedBoot
> > >> has used zImage.
> > >>
> > >> Yegor
> > >>
> > >> On Fri, Feb 24, 2012 at 2:19 PM, Mikael ?sberg <mikael.asberg@mdh.se> wrote:
> > >>> Hey,
> > >>>
> > >>> Ok great, thx!
> > >>>
> > >>> One last thing, depending on which bootloader that is used, i.e., u-boot, barebox etc., does it matter which kernel image that is used for the boot (zImage, uImage, vmlinux)?
> > >>> If I use barebox, which image can I use? (I prefer an uncompressed kernel)
> > >>>
> > >>> Kind regards
> > >>>
> > >>> --------------------------------------------------------------
> > >>> Mikael ?sberg
> > >>> PhD student (Doktorand), Computer Engineering
> > >>> School of Innovation, Design and Engineering
> > >>> M?lardalen University, V?ster?s Sweden
> > >>> Phone: +46(0)21 101502
> > >>> Room nr: U1-145
> > >>> Mail: mikael.asberg at mdh.se
> > >>> --------------------------------------------------------------
> > >>> ________________________________________
> > >>> Fr?n: Baruch Siach [baruch at tkos.co.il]
> > >>> Skickat: den 23 februari 2012 18:17
> > >>> Till: Mikael ?sberg
> > >>> Kopia: buildroot at busybox.net
> > >>> ?mne: Re: SV: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
> > >>>
> > >>> Hi Mikael,
> > >>>
> > >>> Please keep the list in Cc.
> > >>>
> > >>> On Thu, Feb 23, 2012 at 02:35:37PM +0100, Mikael ?sberg wrote:
> > >>>> Hi,
> > >>>>
> > >>>> Thanks a lot for the info!
> > >>>>
> > >>>> I guess its easier to use Barebox, then you just also specify mxs_defconfig
> > >>>> when you configure.
> > >>>
> > >>> You original question was about the Linux kernel not Barebox.
> > >>>
> > >>> Barebox includes support for the TX28 board which is based on i.MX28
> > >>> (tx28stk5_defconfig).
> > >>>
> > >>>> One more thing, since i.MX28 uses the "454MHz ARM926EJ-S" processor, should
> > >>>> I choose "arm926t" in the config?
> > >>>
> > >>> The kernel (and Barebox) defconfig files should include all the relevant
> > >>> settings, including this one.
> > >>>
> > >>> baruch
> > >>>
> > >>>> Fr?n: Baruch Siach [baruch at tkos.co.il]
> > >>>> Skickat: den 23 februari 2012 13:38
> > >>>> Till: Mikael ?sberg
> > >>>> Kopia: buildroot at busybox.net
> > >>>> ?mne: Re: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
> > >>>>
> > >>>> Hi Mikael,
> > >>>>
> > >>>> On Thu, Feb 23, 2012 at 12:22:09PM +0100, Mikael ?sberg wrote:
> > >>>> > Does anyone have experience with compiling Linux kernels with Buildroot for
> > >>>> > i.MX28 EVK?
> > >>>> > I'm not sure which board name to be set for u-boot for example...
> > >>>> > Also, which defconfig should be used, imx27ads_defconfig or versatile_defconfig perhaps?
> > >>>> >
> > >>>> > Any help or pointers would be valueable!
> > >>>>
> > >>>> Although it's named i.MX28, this chip is very different from i.MX27, but is
> > >>>> similar to i.MX23. Latest kernels (since v3.0) contain mxs_defconfig, which
> > >>>> should be suitable for i.MX28 (and i.MX23).
> > >>>>
> > >>>> baruch
> > >>>
> > >>> --
> > >>>     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> > >>> =}------------------------------------------------ooO--U--Ooo------------{=
> > >>>   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
> > >>> _______________________________________________
> > >>> buildroot mailing list
> > >>> buildroot at busybox.net
> > >>> http://lists.busybox.net/mailman/listinfo/buildroot
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
