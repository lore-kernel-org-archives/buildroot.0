From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Dec 2018 10:39:17 +0100
Subject: [Buildroot] Alternate solution for the pkg-config mess ?
In-Reply-To: <20181216120421.48937ad1@windsurf.home>
References: <20181216120421.48937ad1@windsurf.home>
Message-ID: <71c33923-587e-1a84-5c8b-0e27d050ea84@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/12/2018 12:04, Thomas Petazzoni wrote:
> Hello,
> 
> You'll find attached a patch that modifies pkgconf 1.5.3 to behave like
> our older pkg-config used to, i.e only prefix by the sysroot a
> specific subset of variables, and leave all others untouched.
> 
> I am clearly not familiar with all the internals of pkgconf, so I won't
> pretend that the patch is perfect, but it seems to do the job.
> 
> If we decide that this is the right approach rather than adjusting
> gazillions of packages for pkgconf 1.5.3, then let me know and I'll
> submit as a proper patch.
> 
> Fabrice: I tested this with util-linux/bash-completion, and it does the
> job. If you have the chance to test it on other situations where you
> had to patch packages to work with pkgconf 1.5.3, it would be very
> useful.

 This is exactly the approach I had in mind when I wrote about whitelisting some
variables. So this patch gets my vote.

 I haven't looked at the details of the implementation though, just at the
principle.

 Regards,
 Arnout
