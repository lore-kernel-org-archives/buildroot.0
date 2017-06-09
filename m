From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 9 Jun 2017 09:12:59 +0300
Subject: [Buildroot] [PATCH] swupdate: switch to local config librt
	dependency
In-Reply-To: <87lgp29rnw.fsf@dell.be.48ers.dk>
References: <097cb7c8a9791944b484ec31f2cc5660331411c6.1496939346.git.baruch@tkos.co.il>
 <20170608214532.7b77d220@free-electrons.com>
 <87lgp29rnw.fsf@dell.be.48ers.dk>
Message-ID: <20170609061259.d65d6jcrkq35v2t4@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Jun 08, 2017 at 09:59:47PM +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>  >> With glibc 2.17 being 4.5 years old, upstream maintainers start to push back
>  >> on these librt patches. Is it time to stop support for external toolchains
>  >> with older glibc? This means retiring CodeSourcery x86 and SH toolchains.
> 
>  > That's a good question. I think supporting relatively old
>  > configurations is a strength of Buildroot, so I try to be careful when
>  > removing support for old stuff. But maybe glibc 2.17 is now really too
>  > old.
> 
>  > Thoughts of other developers?
> 
> As always, it is a tradeoff. We have already removed gcc 4.8 (released
> March 2013) even though older bootloader/kernels tend to break when
> built with "too new" gcc versions.
> 
> I don't recall the same level of breakage when moving to newer glibc
> versions. Is there any reason to stay with 2.17 instead of newer
> version (incompatibility/bloat/..)? 2.17 presumably is also missing a
> number of security fixes and nice new features.
> 
> I suggest we stop caring about these ancient <= 2.17 glibc versions when
> we introduce 2.26, especially if upstream doesn't want these fixes any
> more.

A small correction: only glibc versions < 2.17 are affected. glibc 2.17 is 
fine.

As far as I understand, the only change we need to do in Buildroot code itself 
if we are to stop support for glibc older than 2.17, is to drop CodeSourcery 
x86 and SH toolchains. That would leave us with no external toolchain for 
these architectures. Is that OK?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
