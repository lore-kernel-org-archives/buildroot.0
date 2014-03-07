From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 14:04:23 +0100
Subject: [Buildroot] [PATCH 6/6] liburcu: disable build with gcc-4.8.x
 on ARM
In-Reply-To: <CAHXCMM+YsCrFrnW06BdJ=AGR3VrUhZb_2UA+NevfdJXF=D+HTg@mail.gmail.com>
References: <1393717193-19774-1-git-send-email-s.martin49@gmail.com>
 <1393717193-19774-7-git-send-email-s.martin49@gmail.com>
 <20140306231723.32e217fd@skate>
 <CAHXCMM+YsCrFrnW06BdJ=AGR3VrUhZb_2UA+NevfdJXF=D+HTg@mail.gmail.com>
Message-ID: <20140307140423.064ce228@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Fri, 7 Mar 2014 13:59:29 +0100, Samuel Martin wrote:

> > The exclusion of BR2_GCC_VERSION_4_8_X is wrong, because we have in
> > Buildroot the patch fixing the
> > http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854 gcc bug.
> >
> > But generally, I'm not really happy with this approach, as we would
> > have to update these dependencies every time we bump/change the
> > external toolchain Kconfig options... Unfortunately I don't have a
> > better suggestion.
> 
> I did this because of the patch in liburcu checking for the compiler version.
> I did not notice BR carries the patch fixing this bug.

So liburcu checks itself that the gcc version should be different than
4.8.0, 4.8.1 and 4.8.2 ? It doesn't take into account that the 4.8.2
might have been patched to fix the problem ? Can this test be disabled ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
