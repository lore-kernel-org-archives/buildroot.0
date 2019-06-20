From: Sam Bobroff <sbobroff@linux.ibm.com>
Date: Thu, 20 Jun 2019 10:19:53 +1000
Subject: [Buildroot] [EXTERNAL] [autobuild.buildroot.net] Your build
 results for 2019-06-13
In-Reply-To: <20190619084851.5500ad30@windsurf>
References: <2t43n5cdd4-1@m0098420.ppops.net>
 <20190619061619.GC24143@tungsten.ozlabs.ibm.com>
 <20190619084851.5500ad30@windsurf>
Message-ID: <20190620001953.GA5542@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 19, 2019 at 08:48:51AM +0200, Thomas Petazzoni wrote:
> Hello Sam,
> 
> On Wed, 19 Jun 2019 16:16:19 +1000
> Sam Bobroff <sbobroff@linux.ibm.com> wrote:
> 
> > I tried to replicate the modem-manager build failure, but it succeeded
> > (I'm using br-reproduce-build). The error is odd as well:
> > 
> > make[4]: Entering directory '/home/buildroot/build/instance-0/output/build/modem-manager-1.10.0/libmm-glib/generated'
> >   GEN      mm-enums-types.h
> >   GEN      mm-errors-types.h
> >   GEN      mm-gdbus-manager.c
> > /bin/sh: line 1: /usr/bin/gdbus-codegen: No such file or directory
> >   GEN      mm-gdbus-sim.c
> > /bin/sh: line 1: /usr/bin/gdbus-codegen: No such file or directory
> >   GEN      mm-gdbus-sms.c
> >   GEN      mm-gdbus-call.c
> > /bin/sh: line 1: /usr/bin/gdbus-codegen: No such file or directory
> > Makefile:1173: recipe for target 'mm-gdbus-sim.c' failed
> > make[4]: *** [mm-gdbus-sim.c] Error 127
> > make[4]: *** Waiting for unfinished jobs....
> > Makefile:1149: recipe for target 'mm-gdbus-manager.c' failed
> > make[4]: *** [mm-gdbus-manager.c] Error 127
> 
> This issue is already fixed by
> https://git.buildroot.org/buildroot/commit/?id=739c581663285db6efb3559969e9e04f873a38f7.
> 
> Best regards,
> 
> Thomas

Ah, thanks. So I couldn't replicate it because my host was different (it
has a gdbus-codegen binary).

Cheers,
Sam.
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190620/ade301e6/attachment.asc>
