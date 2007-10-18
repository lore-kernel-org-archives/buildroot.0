From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 18 Oct 2007 12:52:03 +1000
Subject: [Buildroot] an error in make ( no .config under
	kernel	directory )
In-Reply-To: <ed4892840710171850m506790fbga9e96c0a79250900@mail.gmail.com>
References: <ed4892840710171811k6210e59cn2bb089a8ec21c297@mail.gmail.com>
	<20071018013332.GA724@cloud.net.au>
	<ed4892840710171850m506790fbga9e96c0a79250900@mail.gmail.com>
Message-ID: <20071018025203.GB2149@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 18, 2007 at 09:50:51AM +0800, Steven Woody wrote:
> On 10/18/07, Hamish Moffatt <hamish@cloud.net.au> wrote:
> > > cp -dpRf package/config/buildroot-config
> > > /home/src/buildroot/project_build_arm/M501/buildroot-config
> > > cp -dpf  /home/src/buildroot/project_build_arm/M501/linux-2.6.22.10/.config
> > > ...
> > >
> > > and, i go to dl/M501/linux-2.6.22.10 directory and found no .config
> > > file.  what's wrong here?  the linux-2.6.10 kernel was downloaded in
> > > another computer and was put in dl directory.
> >
> > You have to specify the filename for your configuration file in "make
> > menuconfig" -> kernel.
> 
> understood.  but where can i got a configureation file for the
> 2.6.22.10?  havn't buildroot supplied a default one suitable to
> embedded target for me?

I don't think buildroot can supply a meaningful default configuration
file unless you are using one of the standard target boards found under
target/device (and none of them match an M501).

So you need to make your own. It appears that "make linux26-menuconfig"
should launch the configuration editor for you.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
