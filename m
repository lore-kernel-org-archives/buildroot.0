From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 23:58:19 +0200
Subject: [Buildroot] Analysis of build failures, help requested!
In-Reply-To: <20140417213939.35afc5ff@skate>
References: <20140417063009.B2279100D24@stock.ovh.net>
 <20140417213939.35afc5ff@skate>
Message-ID: <20140417235819.1eca322d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Apr 2014 21:39:39 +0200, Thomas Petazzoni wrote:

> >    powerpc |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/a0937887e3a395ac6b8d32ac71d3e7c62244d40b/
> >       i686 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/da377d7c8e5210bf221c09178dfe8fe3ca59c813/
> >        arm |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/4a3e6093f1c0a54c653d8e3ed3bc8781739e2cf0/
> >      avr32 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/dfeff1eb7464afce359adcf38a7a611062562bb4/
> >       mips |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/5a7832ed8e62b1c0859e2a2a3d3ae77c0e2fa917/
> > microblazeel |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/17e075d388dcb69458fd7595f1cd95d518ceb41d/
> >       i686 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/ab4ace43dccadf51119f20396c10e3362259fb2a/
> 
> The annoying jquery-ui problem. Despite Gustavo's patch, there are
> still some invalid tarballs in the autobuilders. I need to clean them
> up, at least for the ones I control.

I've removed the tarballs on my autobuilder.

> >        arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/a7bd26d799ab7293afce03a1df56f107338b65b0/
> 
> I need to add a new exclusion in the autobuilder script to avoid this.

Fixed.

> >        arm |            xapp_xdriinfo-1.0.4 | NOK | http://autobuild.buildroot.net/results/f7af081048ad967ed4a76afd8c527395f7b0c2dc/
> >        arm |            xapp_xdriinfo-1.0.4 | NOK | http://autobuild.buildroot.net/results/90a8226a8a2978eb13d02645cb9e3d95d9b95757/
> 
> checking for library containing glXGetProcAddressARB... no
> configure: error: in `/scratch/peko/build/xapp_xdriinfo-1.0.4':
> configure: error: cannot find GL library - make sure Mesa or other OpenGL package is installed
> 
> Probably fixed by Bernd's patch?

I've committed Bernd's patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
