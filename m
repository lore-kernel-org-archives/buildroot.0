From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Sep 2015 15:55:49 +0100
Subject: [Buildroot] First rootfile system build using buildroot
In-Reply-To: <CAKpDV8s=1pCEaM33q-5YRADPhrAfkEaRbncFKBPeb3CWwxz_Ew@mail.gmail.com>
References: <CAKpDV8tYxteVo=nKwMih_Ub-dxCQM=xh2G-AC3riPevrMySrNw@mail.gmail.com>	<944894A3EB1D044A9003B2F944389BB20474C3452F@svr-wa-exch1.atg.lc>	<CAKpDV8stME3N6uU8n_DVUYp=sgLGr9RDk_563FCy8XQqRQSL5Q@mail.gmail.com>	<944894A3EB1D044A9003B2F944389BB20474C34560@svr-wa-exch1.atg.lc>	<944894A3EB1D044A9003B2F944389BB20474C34562@svr-wa-exch1.atg.lc>	<CAKpDV8uny8GAJrEkEBmMdcboOrGuVQ4G09KRtL9yuvgH1XKE=Q@mail.gmail.com>	<944894A3EB1D044A9003B2F944389BB20474C3458C@svr-wa-exch1.atg.lc>	<CAKpDV8svFZsaBA_hZjpoM5SFdSohihmugGW_9jYps=zsNzG5Mw@mail.gmail.com>	<20150902033810.GS17874@tarshish>	<CAKpDV8u0ojKAuOJMEzFOjd7dKx6k9Sm-fK8Z5xk7Y7_xdJPNyg@mail.gmail.com>	<20150902114729.GA18583@tarshish>	<CAKpDV8vpO_2UUWUBssE6hDCV=Jh3b1sAeY4=V-b6xEazzdJAPg@mail.gmail.com>	<55E700A5.3080403@imgtec.com>
 <CAKpDV8s=1pCEaM33q-5YRADPhrAfkEaRbncFKBPeb3CWwxz_Ew@mail.gmail.com>
Message-ID: <55E70DF5.7060309@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dinesh Guleria,

On 09/02/2015 03:51 PM, Dinesh Guleria wrote:
>>> one quick question. Which one is your name, "Katoch" or "Dinesh Guleira"?
> Katoch is my nick name real name is as per my mail id Dinesh Guleria .. :-)
> 
>>> it is an existing defconfig file in the kernel tree, not in the
> Buildroot tree. You can find them in "arch/<your architecture>/configs/".
> So i need to copy this file from kernel tree to my buildroot tree & point
> BR2_LINUX_KERNEL_DEFCONFIG variable to it. Right ?

no, you have to go to:

Kernel
-> Linux Kernel
  -> Kernel configuration

And choose "Using an in-tree defconfig file", which is the default option.

Now go to:

Kernel
-> Linux Kernel
  -> Defconfig name

And type the name of the defconfig (without the trailing _defconfig).

Regards,

Vincent.

> Regards,
> Katoch
> 
> On 2 Sep 2015 19:29, "Vicente Olivert Riera" <Vincent.Riera@imgtec.com
> <mailto:Vincent.Riera@imgtec.com>> wrote:
> 
>     Dear Katoch,
> 
>     one quick question. Which one is your name, "Katoch" or "Dinesh
>     Guleira"?
> 
>     On 09/02/2015 02:54 PM, Dinesh Guleria wrote:
>     >>> You need to set
>     > BR2_LINUX_KERNEL_DEFCONFIG (label: "Defconfig name") to the name
>     of your
>     > in-tree defconfig file.
>     > Is this file an existing file or will be created at runtime ? If
>     > existing then where does this in-tree deconfig file lies in the
>     > buildroot directory ?
> 
>     it is an existing defconfig file in the kernel tree, not in the
>     Buildroot tree. You can find them in "arch/<your
>     architecture>/configs/".
> 
>     If you want to use a custom defconfig file, then place it into the
>     Buildroot tree, maybe at $(TOPDIR), and use the appropriate option in
>     the Buildroot menuconfig.
> 
>     Regards,
> 
>     Vincent.
> 
>     > Regards,
>     > Katoch
>     >
>     > Hi Katoch,
>     >
>     > On Wed, Sep 02, 2015 at 04:36:51PM +0530, Dinesh Guleria wrote:
>     >> I have successfully compiled a linux rootfs.Now I am trying to
>     compile a
>     >> linux kernel using buildroot.
>     >> My kernel settings are ;--
>     >> Kernel version : 4.0.4
>     >> kernel configuration : use an in-tree deconfig file
>     >>
>     >> But i am getting following error, when make :--
>     >> linux/linux.mk:367 <http://linux.mk:367> <http://linux.mk:367>:
>     *** No kernel defconfig name
>     > specified, check your
>     >> BR2_LINUX_KERNEL_DEFCONFIG setting.  Stop.
>     >
>     > This means that BR2_LINUX_KERNEL_DEFCONFIG is empty. You need to set
>     > BR2_LINUX_KERNEL_DEFCONFIG (label: "Defconfig name") to the name
>     of your
>     > in-tree defconfig file.
>     >
>     > baruch
>     >
>     > --
>     >      http://baruch.siach.name/blog/                  ~. .~   Tk
>     Open Systems
>     >
>     =}------------------------------------------------ooO--U--Ooo------------{=
>     >    - baruch at tkos.co.il <mailto:baruch@tkos.co.il>
>     <mailto:baruch at tkos.co.il <mailto:baruch@tkos.co.il>> - tel:
>     > +972.2.679.5364, http://www.tkos.co.il -
>     >
>     >
>     > _______________________________________________
>     > buildroot mailing list
>     > buildroot at busybox.net <mailto:buildroot@busybox.net>
>     > http://lists.busybox.net/mailman/listinfo/buildroot
>     >
> 
