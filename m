From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 17 Jun 2015 14:01:07 +0200
Subject: [Buildroot] [PATCH 1/2] ltrace: update to current master
In-Reply-To: <55814DD8.1040200@imgtec.com>
References: <1432565559-60249-1-git-send-email-Vincent.Riera@imgtec.com>
 <7882478.jq8kHfg8lW@sagittea> <55814DD8.1040200@imgtec.com>
Message-ID: <1635366.Gf85uioWz5@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vicente,

On Wednesday 17 June 2015 12:37:12 Vicente Olivert Riera wrote:
> Dear J?r?me Pouiller,
> 
> any progress on this?
We are waiting for upstream:
   http://lists.alioth.debian.org/pipermail/ltrace-devel/2015-June/001328.html

I think Buildroot should provide this patch until upstream responds.

> 
> Regards,
> --
> vincent
> 
> On 05/06/15 01:13, J?r?me Pouiller wrote:
> > Hello Vicente,
> >
> > On Monday 25 May 2015 15:52:38 Vicente Olivert Riera wrote:
> >> Lots of fixes have been made to ltrace, including the ones for fixing a
> >> build failure for MIPS architecture. Updating to current master will
> >> allow us to re-enable this package for MIPS and also remove some
> >> upstreamed patches.
> >>
> >> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> >> ---
> >>   .../{0002-arm-plt.patch => 0001-arm-plt.patch}     |    0
> >>   package/ltrace/0001-events.patch                   |   47 -
> >>   package/ltrace/0003-PPC-fix-PPC32-build.patch      |   31 -
> >>   .../ltrace/0004-xtensa-add-xtensa-support.patch    | 1612 --------------------
> >>   package/ltrace/ltrace.mk                           |    2 +-
> >>   5 files changed, 1 insertions(+), 1691 deletions(-)
> >>   rename package/ltrace/{0002-arm-plt.patch => 0001-arm-plt.patch} (100%)
> >>   delete mode 100644 package/ltrace/0001-events.patch
> >>   delete mode 100644 package/ltrace/0003-PPC-fix-PPC32-build.patch
> >>   delete mode 100644 package/ltrace/0004-xtensa-add-xtensa-support.patch
> > [..]
> >> diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
> >> index 7f00ce3..8a78a2a 100644
> >> --- a/package/ltrace/ltrace.mk
> >> +++ b/package/ltrace/ltrace.mk
> >> @@ -4,7 +4,7 @@
> >>   #
> >>   ################################################################################
> >>
> >> -LTRACE_VERSION = 0896ce554f80afdcba81d9754f6104f863dea803
> >> +LTRACE_VERSION = be0c6870e08a3be43b3a0d210fb8dc7614b1e82f
> > It seems this version has a bug introduced by 5ba9e10 ("Split type definitions
> > from the bundled configs into their own files").
> >
> > Two new configuration files are not installed. Therefore, ltrace fail with
> > messages like :
> > /usr/share/ltrace/libm.so.conf:333: error: unknown type around 'ldouble erfl(ldouble);
> >
> > I have just sent a patch to upstream.
> >

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
