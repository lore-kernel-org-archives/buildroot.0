From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jan 2013 09:22:31 +0100
Subject: [Buildroot] New kernel source mode [Proposal]
In-Reply-To: <772dc0cb-8f56-4bd5-8862-8c95ad4457a5@zimbra2.corp.accelance.fr>
References: <20130115085501.52a772cc@skate>
 <772dc0cb-8f56-4bd5-8862-8c95ad4457a5@zimbra2.corp.accelance.fr>
Message-ID: <20130115092231.35fa854a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Rosen,

On Tue, 15 Jan 2013 09:18:14 +0100 (CET), Jeremy Rosen wrote:

> >      So, for each package, the source code is extracted in
> >      output/sources/<pkg>-<version>/, and the build takes places in
> >      output/build/<pkg>-<version>/ for target packages, and
> >      output/build/host-<pkg>-<version>/ for host packages.
> > 
> 
> just a small detail but...
> 
> could you consider building in output/build/target instead of directly int
> output/build/ for the target ?

Hum, why? Building in output/build/<pkgname>-<pkgversion>/ is already
what we do today.

> 1) the host/ part won't be hidden in the middle of all sorts of directories that are package specific

Hum? I didn't suggest a host/ part. My proposal, in terms of build
directories, do not change anything compared to what we have today:

	output/build/host-foo-1.0/ for the host version of package foo
	output/build/foo-1.0/ for the target version of package foo

That's what we do today.

> 2) it would avoid confusion in the case we somday include a utility named "host"

It would be:

	output/build/host-host-4.2/
	output/build/host-4.2/

But that's the same thing today. I am not sure there is an upstream
project called simply "host", so at this point, I don't see the need to
change the naming of those directories.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
