From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 16:57:03 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-26
In-Reply-To: <20170227155403.GB3655@free.fr>
References: <20170227072848.7BD45207F5@mail.free-electrons.com>
 <20170227142854.34d3fb86@free-electrons.com>
 <20170227155403.GB3655@free.fr>
Message-ID: <20170227165703.65cf5408@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Feb 2017 16:54:03 +0100, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2017-02-27 14:28 +0100, Thomas Petazzoni spake thusly:
> [--SNIP--]
> > >          arc |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/fb677a917545adee321bdcd2c2519c81326448c4  
> > 
> > ../video/out/filter_kernels.c: In function 'jinc':
> > ../video/out/filter_kernels.c:318:18: error: implicit declaration of function 'j1' [-Werror=implicit-function-declaration]
> >      return 2.0 * j1(x) / x;
> > 
> > Vlad, this is only occurring on ARC, could you have a look?  
> 
> That's again because of the Synopsys toolchain, whise uClibc has been
> configured without the "Bessel functions of the first kind".

Let's add yet another "depends on !..." then.

Thanks for the investigation!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
