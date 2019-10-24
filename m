From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 24 Oct 2019 13:18:52 -0700
Subject: [Buildroot] [RFC PATCH v2 06/30] lld: new package
In-Reply-To: <ec315691-c0bc-602c-783b-06bccac1963c@smile.fr>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
 <20191017152929.49153-7-michael.drake@codethink.co.uk>
 <86e76345-b5eb-76b1-ed81-ccaa36b205de@mind.be>
 <31d8a2ba-40a9-011a-69a1-5858872d0734@smile.fr>
 <80aab2a9-4a7b-b118-b1cf-c6760aa33517@smile.fr>
 <CAMWSM7izyfDRC+kL+3WYGLY=ZtDRiProermKKk_bG6b6HLa9VQ@mail.gmail.com>
 <ec315691-c0bc-602c-783b-06bccac1963c@smile.fr>
Message-ID: <CAMWSM7hBJw5zZ7jpk-8iwC_bsZ916kGueYnERd1swV=QscfCSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Thu, Oct 24, 2019 at 1:05 PM Romain Naour <romain.naour@smile.fr> wrote:
>
> Hello Joseph,
>
> Le 24/10/2019 ? 21:56, Joseph Kogut a ?crit :
> > On Thu, Oct 24, 2019 at 12:38 PM Romain Naour <romain.naour@smile.fr> wrote:
> >>
> >> Le 24/10/2019 ? 21:35, Romain Naour a ?crit :
> >>> Hi Arnout,
> >>>
> >>> Le 20/10/2019 ? 00:39, Arnout Vandecappelle a ?crit :
> >>>>> +++ b/package/lld/Config.in.host
> >>>>> @@ -0,0 +1,16 @@
> >>>>> +config BR2_PACKAGE_HOST_LLD
> >>>>> +   bool "host lld"
> >>>>> +   depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # llvm
> >>>>> +   depends on BR2_HOST_GCC_AT_LEAST_4_8 # llvm
> >>>>> +   select BR2_PACKAGE_HOST_LLVM
> >>>>
> >>>>  I'm confused now... I thought the previous patch would be needed to support
> >>>> lld, but you don't select BR2_PACKAGE_HOST_LLVM_ENABLE_HOST_ARCH here, so the
> >>>> option introduced in the previous patch is not used at all... Why is that patch
> >>>> needed then?
> >>>>
> >>>>
> >>>>  Also, in Joseph's original submission, [1] was included. Now it is no longer
> >>>> there. Was it not needed after all?
> >>>>
> >>>>  Anyway, I think I'll apply Joseph's original patch now.
> >>>
> >>> Thanks for merging lld :)
> >>>
> >>> But lld package needs to be at the same version as llvm (currently 9.0.0).
> >>> lld package was sent to the mailing list at the time where llvm package was
> >>> using 8.0.0.
> >>>
> >
> > I've been getting emails about the build failures, and I arrived at
> > the same conclusion yesterday. If nobody else is working on this, I
> > can send patches in to fix these issues later today.
>
> Bumping the package version is easy, I'm doing it right now.
> But I don't have time to do a runtime test, can you do it?
>

Yes, I can handle that.
