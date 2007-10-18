From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 18 Oct 2007 08:16:31 +0200
Subject: [Buildroot] an error in make ( no .config under
	kernel	directory )
In-Reply-To: <ed4892840710172245n7ebf6997q8f4722ba25d8c963@mail.gmail.com>
References: <ed4892840710171811k6210e59cn2bb089a8ec21c297@mail.gmail.com>
	<20071018013332.GA724@cloud.net.au>
	<ed4892840710171850m506790fbga9e96c0a79250900@mail.gmail.com>
	<20071018025203.GB2149@cloud.net.au>
	<ed4892840710172245n7ebf6997q8f4722ba25d8c963@mail.gmail.com>
Message-ID: <1192688191.4844.22.camel@c-f87ee255>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2007-10-18 klockan 13:45 +0800 skrev Steven Woody:
> On 10/18/07, Hamish Moffatt <hamish@cloud.net.au> wrote:
> > On Thu, Oct 18, 2007 at 09:50:51AM +0800, Steven Woody wrote:
> > > On 10/18/07, Hamish Moffatt <hamish@cloud.net.au> wrote:
> > > > > cp -dpRf package/config/buildroot-config
> > > > > /home/src/buildroot/project_build_arm/M501/buildroot-config
> > > > > cp -dpf  /home/src/buildroot/project_build_arm/M501/linux-2.6.22.10/.config
> > > > > ...
> > > > >
> > > > > and, i go to dl/M501/linux-2.6.22.10 directory and found no .config
> > > > > file.  what's wrong here?  the linux-2.6.10 kernel was downloaded in
> > > > > another computer and was put in dl directory.
> > > >
> > > > You have to specify the filename for your configuration file in "make
> > > > menuconfig" -> kernel.
> > >
> > > understood.  but where can i got a configureation file for the
> > > 2.6.22.10?  havn't buildroot supplied a default one suitable to
> > > embedded target for me?
> >
> > I don't think buildroot can supply a meaningful default configuration
> > file unless you are using one of the standard target boards found under
> > target/device (and none of them match an M501).
> >
> > So you need to make your own. It appears that "make linux26-menuconfig"
> > should launch the configuration editor for you.
> >
> > Hamish
> 
> thanks for the answer.
> 
> 1, when i type in `make linux26-menuconfig', an error i got:
> 
> [ -f /home/src/buildroot/project_build_arm/M501/linux-2.6.22.10/.config
> ] || cp  /home/src/buildroot/project_build_arm/M501/linux-2.6.22.10/.config
> cp: missing destination file operand after
> `/home/src/buildroot/project_build_arm/M501/linux-2.6.22.10/.config'
> 
> it seems it still need a .config under the linux-2.6.22.10 directory.
> 
> 2, my M501 is an ARM 922T, if buildroot did not provide a default
> kernel configuration for it, where can i get a similar one as a good
> startup?
> 

go to the linux directory and do

make ARCH=arm xconfig 

and set whatever options you want.

If you do not know what options you need to set, 
then you should ask your chip vendor for a file.


> thanks.
> 
> -
> woody
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
Best Regards,
Ulf Samuelsson          mail:   ulf at atmel.com
Atmel Nordic AB
Box 2033, 174 52 Sundbyberg
Kavalleriv?gen 24, 174 58 Sundbyberg
Sweden
Tel:    +46 8 441 54 22 GSM:    +46 706 224457
