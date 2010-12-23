From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Dec 2010 13:47:48 +0100
Subject: [Buildroot] [git commit master 1/1] ed: bump to version 1.5
In-Reply-To: <4D133AB5.1010507@zacarias.com.ar>
References: <20101222232249.DB1F38E20B@busybox.osuosl.org>
	<20101223082919.0d574cf8@surf> <87vd2kswmm.fsf@macbook.be.48ers.dk>
	<20101223095612.60df592b@surf> <87mxnwsvpz.fsf@macbook.be.48ers.dk>
	<4D133AB5.1010507@zacarias.com.ar>
Message-ID: <20101223134748.33ba89eb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 23 Dec 2010 09:04:05 -0300
Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> Should we go for gentargets even if they behave like auto thus making
> the package file a tad bigger/redundant?

No strong opinion on this. The thing is that as time goes, the
autotools infrastructure may make more and more assumptions on the fact
that the build system is actually autotools-based. So maybe such
packages might break in the future, so technically, GENTARGETS would be
a better fit. But as you said, this will involve quite a bit of
redundancy. Hard to say what the right (tm) solution is.

An intermediate solution is to add a comment above ED_CONF_OPT to
explain why it's done, so that if ed build breaks in the future, we're
warned that the AUTOTARGETS infrastructure has been abused by this
package.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
