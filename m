From: Dinesh Guleria <din.gulu.er@gmail.com>
Date: Wed, 4 Nov 2015 18:33:51 +0530
Subject: [Buildroot] buildroot configuration files -- query
In-Reply-To: <20151104120028.546dbec5@free-electrons.com>
References: <CAKpDV8sD-00LdpoqPS_pgbPGkqdn5bm2HX_JBGCgKHdq39sdvw@mail.gmail.com>
 <20151104120028.546dbec5@free-electrons.com>
Message-ID: <CAKpDV8uObv=yVohKJOEWH0U6JuTxruaRO-mjOWOCtbd6tsR_OQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas for your reply.

Regards,
Dinesh
On 4 Nov 2015 16:30, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
wrote:

> Dear Dinesh Guleria,
>
> On Wed, 4 Nov 2015 16:06:49 +0530, Dinesh Guleria wrote:
>
> > I am referring following document to learn buildroot.
> > http://buildroot.uclibc.org/downloads/manual/manual.html
> >
> > 1> What exactly is the difference between the configuration files in*
> > /board* directory & */configs* directory ?
> >
> >    For example these two config files are for at91sam9260ek MCU :--
> >    /board/atmel/at91sam9260ek/linux-3.9.config
>
> This is a Linux kernel configuration file. It describes which kernel
> features are enabled (drivers, filesystems, network protocols, kernel
> features, etc.).
>
> >    /configs/at91sam9260eknf_defconfig
>
> This is a Buildroot configuration file. It describes your embedded
> Linux system as a whole (architecture, toolchain, target packages,
> etc.).
>
> > 2> we can load the configuration using following command :--
> >   * make <name>_defconfig command*
> >
> >    we can save a configuration by following command *make savedefconfig*.
> > As said in following section :--
> >    9.3. Storing the Buildroot configuration
> >    The Buildroot configuration can be stored using the command make
> > savedefconfig.
> >    The recommended place to store this defconfig is
> > configs/<boardname>_defconfig.
> >
> >    a> Now my question how the configuration file for new MCU is created
> > first time in /configs directory. What is the command to use for this ?
>
> "make savedefconfig", which by default will create a file named
> "defconfig", which you simply move to configs/, under a name like
> <blabla>_defconfig:
>
> $ make savedefconfig
> $ mv defconfig configs/blabla_defconfig
>
> >    b> How the configuration file for a particular board is created first
> > time & saved (lets say for example this /board/atmel/XXXX)
> >       Now how to create & save configuration file for XXXX board ? What
> is
> > command to use for this ?
>
> It's not a configuration file for a "board", but for example a Linux
> kernel configuration file. If you're talking about the Linux kernel
> configuration file, then you can use the "make linux-update-config" or
> "make linux-update-defconfig" targets.
>
> See the manual for more details, or also
> http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf
> slide 74 and following.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151104/8f4fb5b5/attachment.html>
