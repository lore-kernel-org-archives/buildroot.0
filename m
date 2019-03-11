From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Mar 2019 23:11:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/libdrm: fix build without fork
In-Reply-To: <20190311225421.31ebff20@windsurf>
References: <20190310094627.20440-1-fontaine.fabrice@gmail.com>
 <20190310191758.7d1707e3@gmx.net>
 <CAPi7W82UfzUoZ_SuNoA4BQc8RfosQW_RCu9F+105p-6yD=3rQw@mail.gmail.com>
 <20190311225421.31ebff20@windsurf>
Message-ID: <CAPi7W83_uaTgvWyUEE4ev96wySz1hyHJrCFzhpgDOogK7B7hOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Le lun. 11 mars 2019 ? 22:54, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Mon, 11 Mar 2019 18:52:37 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > > Will the test succeed without fork? Maybe better disable the whole test in case
> > > fork is not available? Or simple wait for Upstream suggestions/opinion.... ;-)
> > Indeed, you were right, the test won't succeed but upstream does not
> > want to disable the test either:
> > https://patchwork.freedesktop.org/patch/291508.
> > Should we add a dependency on BR2_USE_MMU to libdrm and all its
> > reverse dependencies?
>
> Why on libdrm ?
>
> As upstream said: amdgpu is never going to be used on noMMU platforms,
> and the amdgpu tests are only compiled in when the amdgpu driver is
> enabled. From tests/Makefile.am:
>
> if HAVE_AMDGPU
> if HAVE_CUNIT
> SUBDIRS += amdgpu
> endif
> endif
>
> So, just make BR2_PACKAGE_LIBDRM_AMDGPU depends on BR2_USE_MMU. Isn't
> that sufficient ?
Indeed, I missed this one, I'll send a new patch.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
