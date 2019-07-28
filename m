From: Vadim Kochan <vadim4j@gmail.com>
Date: Sun, 28 Jul 2019 12:48:50 +0300
Subject: [Buildroot] [PATCH v2 1/1] pkg-infra/show-info: dump
 install_{staging, target} info
In-Reply-To: <CAJ4jsaefr8e3ufjV_ZdnvaZZ4mkaiTvxwtYyOGTQD49UHYFSwA@mail.gmail.com>
References: <20190723125657.27702-1-vadim4j@gmail.com>
 <CAJ4jsaefr8e3ufjV_ZdnvaZZ4mkaiTvxwtYyOGTQD49UHYFSwA@mail.gmail.com>
Message-ID: <CAMw6YJJZjAtCiL7brZGy0Rd2mq9xxhHTJY9TAvnd=Guk83MXzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

On Sat, Jul 27, 2019 at 5:40 AM Carlos Santos <unixmania@gmail.com> wrote:
>
> On Tue, Jul 23, 2019 at 9:57 AM Vadim Kochan <vadim4j@gmail.com> wrote:
> >
> > provide info if the package will be installed to staging/target
> > destinations. Might be useful for analyzing the packages which
> > installed only for target/staging.
> >
> > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> > ---
> >
> > v2:
> >     1) use oneliner 'if' to dump install_{staging,target} properties
> >
> >  package/pkg-utils.mk | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> > index b7280e930f..1dcf2805cb 100644
> > --- a/package/pkg-utils.mk
> > +++ b/package/pkg-utils.mk
> > @@ -94,6 +94,8 @@ endef
> >  define _json-info-pkg-details
> >         "version": "$($(1)_DL_VERSION)",
> >         "licenses": "$($(1)_LICENSE)",
> > +       "install-target": $(if $($(1)_INSTALL_TARGET),true,false),
>
> This tests if if $($(1)_INSTALL_TARGET is not empty, e.g.
>
> $ fgrep '_INSTALL_TARGET =' package/*/*.mk
> package/azmq/azmq.mk:AZMQ_INSTALL_TARGET = NO
> [...]
>
> $ make azmq-show-info
> { "azmq": { "type": "target", "virtual": false, "version": "1.0.2",
> "licenses": "BSL-1.0", "install-target": true, "install-staging":
> true, "downloads": [ { "source": "azmq-1.0.2.tar.gz", "uris": [
> "https+https}
>
> > +       "install-staging": $(if $($(1)_INSTALL_STAGING),true,false),
>
> $ make bash-show-info
> { "bash": { "type": "target", "virtual": false, "version": "4.4.18",
> "licenses": "GPL-3.0+", "install-target": true, "install-staging":
> true, "downloads": [ { "source": "bash-4.4.18.tar.gz", "uris": [
> "http+htt}
>
> --
> Carlos Santos <unixmania@gmail.com>

Thanks a lot for this, and sorry for waste your time :(
Somehow I messed YES with true :(

Regards,
Vadim Kochan
