From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 18:38:47 +0200
Subject: [Buildroot] [PATCH v2 0/2] Introducing Nios-II architecture
In-Reply-To: <20130828181818.2efd6bf5@skate>
References: <1377115128-29749-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130828181818.2efd6bf5@skate>
Message-ID: <20130828183847.3ae96f8a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

On Wed, 28 Aug 2013 18:18:18 +0200, Thomas Petazzoni wrote:
> Dear Ezequiel Garcia,
> 
> On Wed, 21 Aug 2013 16:58:46 -0300, Ezequiel Garcia wrote:
> > From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> > 
> > This is the second version of the series adding basic support for
> > Altera's Nios-II architecture.
> > Only basic support added so far, but more patches will hopefully follow.
> 
> Nice!
> 
> Once this series is committed, I'll add NIOS-II to the autobuilders.
> Are you willing to look at the resulting package build failures?

I had a quick look, and unfortunately, there is no support for NIOS-II
in libffi. This means that anything that uses libglib or python cannot
be built for NIOS-II. This is a bit annoying as adding a 'depends
on !BR2_nios2' on all reverse dependencies of libglib is a big pain.

Unfortunately, a quick google search doesn't even show the start of an
effort to add NIOS-II support to libffi, so I guess we'll have to live
with that.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
