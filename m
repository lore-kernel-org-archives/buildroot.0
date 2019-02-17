From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Feb 2019 17:53:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/glm: bump to version 0.9.9.3
In-Reply-To: <20190217155457.25581467@windsurf.home>
References: <20190217093529.5634-1-fontaine.fabrice@gmail.com>
 <20190217155457.25581467@windsurf.home>
Message-ID: <CAPi7W800pNzvTCN+tih-C_ae3EhuaiEchW+pZ=iC5m7gTUtD8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Le dim. 17 f?vr. 2019 ? 15:54, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Sun, 17 Feb 2019 10:35:29 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > - Disable tests as they are enabled by default since version 0.9.9.1:
> >   https://github.com/g-truc/glm/commit/d307d390193f4027faec48ac79d7f74b2bec6e56
> > - Static and shared libraries are always built since version 0.9.9.1:
> >   https://github.com/g-truc/glm/commit/a23dd2f800185a5e233534fed82fc5c2840fbe5c
> >   So, add a patch to fix this behavior and disable them as GLM is
> >   header-ony
>
> I don't understand this. Why does the glm CMakeLists.txt has provision
> to build static and shared libraries if it's a header-only library ?
Current version of glm already provides the possibility to build these
libraries through GLM_STATIC_LIBRARY_ENABLE and
GLM_SHARED_LIBRARY_ENABLE but these options are disabled by default.
In the current version, if these two options are disabled, glm tries
to build a glm_dummy executable with the only cpp file in the glm
directory (i.e. glm/detail/glm.cpp which defines a glm namespace with
all the glm structures). This glm_dummy executable raises some build
failures.
I don't really understand how these libraries could be useful,.
However, to keep current behavior, I decided to disable them.
If I get a feedback on my PR, I'll ask upstream about it.
>
> > ++if(BUILD_STATIC_LIBS)
> > + add_library(glm_static STATIC ${ROOT_TEXT} ${ROOT_MD} ${ROOT_NAT}
> > +     ${ROOT_SOURCE}    ${ROOT_INLINE}    ${ROOT_HEADER}
> > +     ${CORE_SOURCE}    ${CORE_INLINE}    ${CORE_HEADER}
> > +@@ -51,7 +52,9 @@ add_library(glm_static STATIC ${ROOT_TEXT} ${ROOT_MD} ${ROOT_NAT}
> > +     ${GTC_SOURCE}     ${GTC_INLINE}     ${GTC_HEADER}
> > +     ${GTX_SOURCE}     ${GTX_INLINE}     ${GTX_HEADER}
> > +     ${SIMD_SOURCE}    ${SIMD_INLINE}    ${SIMD_HEADER})
>
> I.e, what is this code doing ?
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
