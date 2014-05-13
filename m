From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 May 2014 22:18:33 +0200
Subject: [Buildroot] virtual-packages: the case for multiple providers
	selected
In-Reply-To: <a67a948f-b496-4385-9796-fc2d079d9641@email.android.com>
References: <20140513180945.GC3507@free.fr>
 <a67a948f-b496-4385-9796-fc2d079d9641@email.android.com>
Message-ID: <20140513221833.016e1d8e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

(Would be nice to wrap your e-mails!)

On Tue, 13 May 2014 22:12:59 +0200, Thomas De Schampheleire wrote:

> >  - going with the choice means that it is no longer possible to add a
> >    new provider in BR2_EXTERNAL without changing the Buildroot source
> >    tree, one of the main selling-point of BR2_EXTERNAL to begin with,
> 
> I guess it's not possible to put an 'include' statement inside the choice? The included file would then just contain the external options.

What would it include? Remember that include statements in kconfig fail
if the target file doesn't exist.

> >  - going with the check means that it will still possible to generate
> >    such configurations, which means we'd still get autobuild failures
> >    for those (unless the autobuilders are tweaked to recognise this,)
> >    while it would be a minimal annoyance to the user.
> >
> 
> It doesn't look too difficult to me to handle such prebuild checks in a generic way in the autobuilders.
> Suppose that a magic return code is used if a prebuild check fails (also for the kernel headers check for example), then the autobuilders can check for this magic code and then simply ignore the configuration and generate a new one.

Or we could have a specific make target to allow the autobuilders to
check a configuration before starting the build.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
