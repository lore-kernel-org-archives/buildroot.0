From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 3 Dec 2011 05:24:26 -0600
Subject: [Buildroot] Real time Linux implementation
In-Reply-To: <20111203120816.4c0f862a@skate>
References: <CAO6BqMXyye4TFHf0Pxc99Naq28wWg1ne=--q=e+VmfvPVuwD3w@mail.gmail.com>
 <201112030453.45164.minimod@morethan.org> <20111203120816.4c0f862a@skate>
Message-ID: <201112030524.28230.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat December 3 2011, Thomas Petazzoni wrote:
> > Will the project need a general policy of just how "strange and unusual"
> > will be considered for inclusion in the build system?
> > 
> > My reason for posing this question early in the life-time of the
> > "kernel extensions" feature is the on-going maintenace chore of 
> > these specializations.
> 
> For all these kernel extensions, Buildroot does not even try to make
> sure that the kernel selected by the user is compatible with the kernel
> extension that was enabled. We leave that work to the user, simply
> because it is impossible to keep track of which kernel extension
> supports which kernel version on which architecture.
> 
> I think that Buildroot is merely a tool to automate the build process
> of an embedded Linux system. It doesn't, and it will never, replace the
> engineer that makes decision on using Xenomai version X, knowing that
> it supports the kernel version Y that he is using on his embedded
> device. Buildroot only helps here by making the build process
> automated, *once* the engineer has made the right choices in terms of
> versions (kernel version and kernel extension version).
> 

Sounds like a policy statement to me.
Buildroot != Automated engineering

Maybe even distill that down to a (polite) "user is on their own here"
comment at the head of the kernel extensions menu branch.
;-)

Since BR does provide a great degree of build automation, a new user
might just assume that it is also fully checking package compatability.
(It doesn't and I agree that it shouldn't - different job.)

Mike
