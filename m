From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 3 Nov 2018 15:14:56 +0100
Subject: [Buildroot] [PATCH 2/4] llvm: enable bpf
In-Reply-To: <20181103141443.3c86e3f9@windsurf>
References: <20181103122758.10578-1-fontaine.fabrice@gmail.com>
 <20181103122758.10578-2-fontaine.fabrice@gmail.com>
 <20181103141443.3c86e3f9@windsurf>
Message-ID: <CAPi7W801n8zqM-PLUF1RE5uShZ7+Xh9G2OkrnVEdZ3_Y3=bGpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Le sam. 3 nov. 2018 ? 14:14, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Sat,  3 Nov 2018 13:27:56 +0100, Fabrice Fontaine wrote:
> > BPF (in-kernel bytecode machine) is needed by libv4l
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/llvm/llvm.mk | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> > index 1f9bd447f5..dae5d3f16d 100644
> > --- a/package/llvm/llvm.mk
> > +++ b/package/llvm/llvm.mk
> > @@ -54,6 +54,9 @@ ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
> >  LLVM_TARGETS_TO_BUILD += AMDGPU
> >  endif
> >
> > +# Build BPF (in-kernel bytecode machine)
> > +LLVM_TARGETS_TO_BUILD += BPF
>
> Perhaps we should make this optional ? Or maybe the build time
> difference is not that significant ?
llvm and clang are already taking a long time to build on my "old"
machine, I didn't notice a significant difference with or without BPF
but I didn't measure it.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
