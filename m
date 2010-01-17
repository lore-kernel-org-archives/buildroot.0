From: Clark Rawlins <clark.rawlins@escient.com>
Date: Sat, 16 Jan 2010 19:59:20 -0500
Subject: [Buildroot] [PATCH] Permit building grub with an external
 toolchain.
In-Reply-To: <1262627315.31246.8.camel@venture>
References: <1262472376.23927.19.camel@venture>
	<1262477625.23193.2.camel@coalu.atr>
	<1262484948.23927.25.camel@venture>
	<1262491694.23193.10.camel@coalu.atr>
	<1262526218.23927.27.camel@venture>
	<1262610104.3853.6.camel@venture>  <20100104142056.7ab397fc@surf>
	<1262611748.3853.16.camel@venture> <1262627315.31246.8.camel@venture>
Message-ID: <1263689960.6123.2.camel@venture>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ping?

Is there anything wrong with this patch that should be fixed prior to
its inclusion in master?

On Mon, 2010-01-04 at 12:48 -0500, Clark Rawlins wrote:
> I have attached the complete file for review as well as the git
> format-patch generated diff.
> 
> On Mon, 2010-01-04 at 08:29 -0500, Clark Rawlins wrote:
> > On Mon, 2010-01-04 at 14:20 +0100, Thomas Petazzoni wrote:
> > > Hello Clark!
> > > 
> > > Le Mon, 04 Jan 2010 08:01:44 -0500,
> > > Clark Rawlins <clark.rawlins@escient.com> a ?crit :
> > > 
> > > > Here is my attempt to use the autotools macros.
> > > > I look forward to any discussion, suggestions for improvement etc.
> > > > 
> > > > I attach the whole file since it is effectively a rewrite.  If it is
> > > > acceptable I will submit as a git diff against head.  
> > > 
> > > Thanks for your work.
> > > 
> > > Maybe the GRUB_SUPPORTED_ARCH thing should be handled at the
> > > Config.in level.
> > 
> > Of course I was just copying what was already there for that part.
> > 
> > In grub/Config.in BR2_TARGET_GRUB depends on BR2_i386 || BR2_x86_64.
> > It seems that it would be equivalent to replace all the
> > GRUB_SUPPORTED_ARCH stuff with a single check for 
> > 
> > ifeq ($(BR2_TARGET_GRUB),y)
> > 
> > endif
> > 
> > > 
> > > Thomas
> > > -- 
> > > Thomas Petazzoni, Free Electrons
> > > Kernel, drivers and embedded Linux development,
> > > consulting, training and support.
> > > http://free-electrons.com
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> > 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
