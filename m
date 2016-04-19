From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 09:22:55 +0200
Subject: [Buildroot] [PATCH] Adding in support for custom configurations
In-Reply-To: <57157458.7080802@mind.be>
References: <1460734834-32123-1-git-send-email-patrick@stwcx.xyz>
 <20160417223143.0b54cce6@free-electrons.com>
 <20160418162528.GA5827@asimov.austin.ibm.com>
 <20160418211558.12db7fdf@free-electrons.com>
 <20160418214442.GB19968@asimov.austin.ibm.com>
 <57157458.7080802@mind.be>
Message-ID: <20160419092255.4ebd2291@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 01:57:12 +0200, Arnout Vandecappelle wrote:

> >> >I think the only reasonable solution to this is to really allow
> >> >multiple BR2_EXTERNAL directories. A patch series doing this was
> >> >proposed by Yann E. Morin a while ago, but due to the fairly
> >> >significant additional complexity, it hasn't been merged so far.
> > Has there been any previous discussion about allowing sub-directories
> > under 'configs'?  The Linux kernel tree allows both
> > $(ARCH)/configs/*_defconfig and $(ARCH)/configs/*/*_defconfig .  Coupled
> > with Steve's proposal for us to use symlinks, we could create
> > $(BR2_EXTERNAL)/configs/custom as a symlink to
> > $(BR2_EXTERNAL)/custom/configs and have a solution as well.
> 
>   If that doesn't add too much complexity (and I can't imagine it does), it 
> could definitely be a good solution. Especially if that allows us to kill the 
> idea of a multi-layered-without-calling-it-layers BR2_EXTERNAL :-)

Our configs/ directory is also growing, so we could think of using
sub-directories to organize the configurations per-vendor, or to
separate the minimal configs from the demo ones, or something.

Or we could move the configs next to the board/ related files they
correspond. Hm, wait, that's what we used to do 5+ years ago :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
