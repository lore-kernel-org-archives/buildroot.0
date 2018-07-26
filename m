From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Jul 2018 09:43:34 +0200
Subject: [Buildroot] [PATCH 1 of 3] host-acl: build fix on RHEL6 hosts
 (GCC 4.4.7)
In-Reply-To: <a5beffd9-7db4-1836-ba1e-a301a2ac90c6@mentor.com>
References: <05bbe42a7a77f46daa8a.1532020842@cveaol6qa08.wv.mentorg.com>
 <20180725231245.7e1e2f99@windsurf>
 <a5beffd9-7db4-1836-ba1e-a301a2ac90c6@mentor.com>
Message-ID: <20180726094334.4da615cf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Hollis,

On Wed, 25 Jul 2018 15:10:56 -0700, Hollis Blanchard wrote:

> >> +Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>  
> > Are you sure removing this won't break the build with newer gcc
> > versions ?  
> I've built it with host gcc 6.3.0 and 4.4.7 and saw no warnings in 
> either case. (Aside: patchelf refused to build with 6.3.0, so I had to 
> manually build that.)
> 
> If some toolchain emits a warning on this code, and if the package is 
> built with -Werror somehow, I suppose it's possible to break the build. 

The package doesn't seem to be built with -Werror by default, so it
should be fine. Let's apply your patch, and see if it works fine on the
autobuilders.

> > However, a larger question is: do you intend to contribute an
> > autobuilder that tests Buildroot under RHEL6 ? Indeed, you are fixing
> > just the few packages that are useful to you, but if we are going to
> > support something as old as RHEL6, then we need to do it properly and
> > have an autobuilder running on this distro. Do you think this is
> > something that could be done ?  
> Not certain, but possible. What does it entail, exactly? Do I just have 
> to run 
> https://git.buildroot.net/buildroot-test/tree/scripts/autobuild-run via 
> cron?

It is about running this script yes, but it does not need to be run in
cron, the script itself is an infinite loop that continuously does some
builds and contribute the results to autobuild.buildroot.org.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
