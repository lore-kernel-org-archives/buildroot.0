From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 11:31:57 +0200
Subject: [Buildroot] [git commit] arch/x86: add support for Intel X1000
In-Reply-To: <20151020080505.82B8581E83@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 20 Oct 2015 10:04:52 +0200")
References: <20151020080505.82B8581E83@busybox.osuosl.org>
Message-ID: <87k2qh28du.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: http://git.buildroot.net/buildroot/commit/?id=968f5d5e59195e6e6a9a349ec9a118fb3a50b8b3
 > branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The Intel X1000 is the Pentium class microprocessor that ships with
 > Galileo Gen 1/2. This patch adds changes to arch and toolchain-wrapper
 > to omit the lock prefix for the X1000.

 > [Thomas: tweak commit log and Config.in help text.]

 > Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  arch/Config.in.x86             |   12 ++++++++++++
 >  toolchain/toolchain-wrapper.c  |    3 +++
 >  toolchain/toolchain-wrapper.mk |    4 ++++
 >  3 files changed, 19 insertions(+), 0 deletions(-)

 > diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
 > index 43f6abc..dca30da 100644
 > --- a/arch/Config.in.x86
 > +++ b/arch/Config.in.x86
 > @@ -34,6 +34,16 @@ config BR2_x86_i486
 >  config BR2_x86_i586
 >  	bool "i586"
 >  	depends on !BR2_x86_64
 > +config BR2_x86_x1000
 > +	bool "x1000"
 > +	depends on !BR2_x86_64
 > +	help
 > +	  The Intel X1000 is a Pentium class microprocessor in the
 > +	  Quark (sub-Atom) Product Line. The X1000 has a bug on the
 > +	  lock prefix requiring that prefix must be stripped at build
 > +	  time.
 > +
 > +	  See https://en.wikipedia.org/wiki/Intel_Quark.

The final dot (.) is not part of the URL, so I'll remove that.

-- 
Bye, Peter Korsgaard
