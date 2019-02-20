From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Feb 2019 13:51:31 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-02-17
In-Reply-To: <23ee4267-a989-942d-4101-15d834008801@mind.be>
References: <20190218070048.D838922270@silver.osuosl.org>
 <20190218150524.58b7f1a1@x230>
 <20190219113834.073a4630@windsurf.home>
 <23ee4267-a989-942d-4101-15d834008801@mind.be>
Message-ID: <20190220135131.1cd9cc0f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Feb 2019 13:47:08 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> > However, it turns out that libquadmath can be disabled in gcc, and
> > guess what, the gcc in the toolchain causing the failure has been built
> > with --disable-libquadmath.
> > 
> > So it seems like we need to turn this into a real Config.in option:
> > 
> >  - BR2_TOOLCHAIN_HAS_LIBQUADMATH remains a hidden option, has no
> >    default value, and a depends on BR2_i386 || BR2_x86_64
> > 
> >  - The internal toolchain backend selects it because we always enable
> >    it for internal toolchains (to be checked)
> > 
> >  - All pre-defined external toolchain packages must be updated to
> >    select it
> > 
> >  - toolchain-external-custom needs to be extended with a
> >    BR2_TOOLCHAIN_EXTERNAL_LIBQUADMATH option that users can set/unset.
> >    It should depends on BR2_i386 / BR2_x86_64, default to yes, and
> >    select BR2_TOOLCHAIN_HAS_LIBQUADMATH.
> > 
> >  - A check needs to be added in toolchain/helpers.mk to verify that the
> >    value of BR2_TOOLCHAIN_HAS_LIBQUADMATH matches the presence/absence
> >    of libquadmath in the toolchain.  
> 
>  Or we can say that this is an exceptional situation and exclude this toolchain
> in genrandconfig. fftw-quad is the only package that depends on quadmath.

Yes, that's another approach indeed. I don't mind either way. Perhaps
your approach makes sense, I'm not sure there are really a lot of
toolchains that don't have quadmath support.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
