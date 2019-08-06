From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 6 Aug 2019 11:51:15 +0300
Subject: [Buildroot] [PATCH v3 1/1] pkg-infra/show-info: dump
 install_{staging, target} info
In-Reply-To: <20190803063236.GA28984@scaer>
References: <20190731153237.13607-1-vadim4j@gmail.com>
 <93f8a09e-3dac-4a1c-aa2c-64f3ae51aeea@mind.be>
 <41428ed5-ed81-067a-829c-00b3e2bdc3ab@mind.be> <20190803063236.GA28984@scaer>
Message-ID: <CAMw6YJLPGYKLRsqtxnGxuyKe0LjMPL_AA6eH=QDH2Y1cfyVXKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Yann, All

On Sat, Aug 3, 2019 at 9:32 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Arnout, Vadim, All,
>
> On 2019-08-02 22:43 +0200, Arnout Vandecappelle spake thusly:
> > On 02/08/2019 22:42, Arnout Vandecappelle wrote:
> > > On 31/07/2019 17:32, Vadim Kochan wrote:
> > >> provide info if the package will be installed to staging/target
> > >> destinations. Might be useful for analyzing the packages which
> > >> installed only for target/staging.
> > >>
> > >> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> > >> ---
> > >> v2:
> > >>     1) use oneliner 'if' to dump install_{staging,target} properties
> > >>
> > >> v3:
> > >>     1) fix evaluation of true/false value via 'subst' (suggested by Yann E. Morin)
> > >>
> > >>  package/pkg-utils.mk | 2 ++
> > >>  1 file changed, 2 insertions(+)
> > >>
> > >> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> > >> index b7280e930f..ffe198e242 100644
> > >> --- a/package/pkg-utils.mk
> > >> +++ b/package/pkg-utils.mk
> > >> @@ -94,6 +94,8 @@ endef
> > >>  define _json-info-pkg-details
> > >>    "version": "$($(1)_DL_VERSION)",
> > >>    "licenses": "$($(1)_LICENSE)",
> > >> +  "install-target": $(if $(subst NO,,$($(1)_INSTALL_TARGET)),true,false),
> > >> +  "install-staging": $(if $(subst NO,,$($(1)_INSTALL_STAGING)),true,false),
> >
> >  Oh, also, someone commented that you should keep install_staging with
> > underscore because we already have reverse_dependencies.
>
> And install_target too, of course.
>
> And please also introduce install_images.
>
> Regards,
> Yann E. MORIN.
>
> >  Regards,
> >  Arnout
> >
> > >
> > >  I still find this ugly.
> > >
> > >  Could you instead add a macro that does something like
> > > $(subst NO,false,$(subst YES,true,$(1)))
> > > and use that?
> > >
> > >  It may also be handy in other situations.
> > >
> > >  I'm not sure what to call it, maybe bool-to-json or yesno-to-bool
> > >
> > >  Regards,
> > >  Arnout
> > >
> > >>    "downloads": [
> > >>    $(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
> > >>            {
> > >>
>
> --

Thanks for the comments, will do it.

Regards,
Vadim Kochan
