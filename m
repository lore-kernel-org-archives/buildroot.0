From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 3 Dec 2011 04:53:41 -0600
Subject: [Buildroot] Real time Linux implementation
In-Reply-To: <20111203000854.6dcc2764@skate>
References: <CAO6BqMXyye4TFHf0Pxc99Naq28wWg1ne=--q=e+VmfvPVuwD3w@mail.gmail.com>
 <4ED91A0B.10403@relinux.de> <20111203000854.6dcc2764@skate>
Message-ID: <201112030453.45164.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri December 2 2011, Thomas Petazzoni wrote:
> Le Fri, 02 Dec 2011 19:33:47 +0100,
> Stephan Hoffmann <sho@relinux.de> a ?crit :
> 
> > what do you think about adding the PREEMPT_RT patch as a config option
> > to buildroot?
> 
> That would definitely be nice. The only problem is that PREEMPT_RT is
> far from being available for every upstream kernel version, so it's a
> bit hard to integrate from that perspective, but this isn't much
> different from Xenomai and RTAI having similar kernel version
> constraints. So, yes, having some PREEMPT_RT integration would be nice,
> at least to show that it is possible.
> 

And the pending EtherCAT patch which has both kernel version constraints
and supports only a few specific Ethernet adapters.

Having the new "kernel extensions" build support is a nice feature.

And BR does target building embedded systems where "strange and unusual"
kernel extensions are sometimes a way-of-life, but...

Will the project need a general policy of just how "strange and unusual"
will be considered for inclusion in the build system?

My reason for posing this question early in the life-time of the
"kernel extensions" feature is the on-going maintenace chore of 
these specializations.

Often, it will take the actual downloading and examination of each
source package by someone who is also familiar with that BR patch
to do a "version bump" of that kernel extension package.

Maybe a policy of whoever proposes the extension also accept the
responsibility of maintaining its "version bumps"?
And then if a kernel extension gets too old or becomes unusable,
let the normal deprecated/remove maintenace routine get rid of it.

I can't see that expecting the usual maintainers of the BR system
to take on these extra chores of maintaining the "specials" is 
reasonable.

Perhaps this question is too early, but worth bookmarking until
we see just how many one-user, one-time, things get proposed.

Mike
> Regards,
> 
> Thomas
