From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 6 May 2016 23:33:56 +0200
Subject: [Buildroot] [PATCH] xserver_xorg-server: use -O2 build
 optimization level
In-Reply-To: <572C8ACE.4010307@zacarias.com.ar>
References: <1462493307-21675-1-git-send-email-gustavo@zacarias.com.ar>
 <20160506084734.56e5caad@gmx.net>
 <572C8ACE.4010307@zacarias.com.ar>
Message-ID: <20160506233356.18752d8d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gustavo,

On Fri, 6 May 2016 09:15:10 -0300, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> On 06/05/16 03:47, Peter Seiderer wrote:
> 
> > Thanks for the patch, will surely improve the 'out of the box' usability of buildroot,
> > but I would prefer a 'blacklist' of known failing combinations and simply disable
> > xserver (with comment why) in this case(s), the only know to me is RPi1:
> >
> >    BR2_ARCH="arm"
> >    BR2_GCC_TARGET_CPU="arm1176jzf-s"
> >    BR2_OPTIMIZE_S=y
> >
> > The perfect solution would be a fix for gcc (and/or xserver)...
> >
> > Regards,
> > Peter
> 
> Hi Peter.
> Isn't that a bit harsh?

Ups, sorry, apologize for my wrong/misleading wording, was not meant so...

> I'm not 100% comfortable with this solution either, however blacklisting 
> xorg will be messy to put it lightly.

Yes, did not catch it that more than one combination is affected (thought it
was only RPi1....until sending the first e-mail, and only afterward registered
the original post was about RPi2...
 
> Also finding the failing combinations will not be simple - it seems ARM 
> in general is affected on several toolchain combinations, as is MIPS as 
> well (both tested in Qemu) - so it goes beyond some particular platforms.

Mind to share your configs and test commands (specially the MIPS one)?

> Another alternative could be finding the exact gcc option that's causing 
> it diffing the output of --help=optimizers and trying enabling/disabling 
> one by one until it's fixed or fails since this would probably help 
> pinpoint the precise optimizations that's causing it (which would in 
> turn help in making a minimal test case to help upstream).
> Regards.

Thanks for the suggestion, will try it with a test case...

Regards,
Peter
