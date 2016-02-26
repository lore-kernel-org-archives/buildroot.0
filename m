From: Gabe Evans <gabe@hashrabbit.co>
Date: Fri, 26 Feb 2016 00:27:34 +0000
Subject: [Buildroot] [PATCH 05/32] package/systemd: add
	--enable/disable-zlib
In-Reply-To: <56CF96CD.8030409@mind.be>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-6-git-send-email-gabe@hashrabbit.co>
 <56CF96CD.8030409@mind.be>
Message-ID: <CAHsRNLiCO_gJGV1CfB0kC5Cs68OaEGSTNUA5VDY7cGBCyo6a=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 25, 2016 at 4:05 PM Arnout Vandecappelle <arnout@mind.be> wrote:

> On 02/25/16 22:55, Gabe Evans wrote:
> > Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>  Again, for master.
>
>  I wonder: what is zlib used for? Also for compressed journal? If so, why
> didn't
> you update the help text?
>

In patch 22, systemd-importd selects libcurl, xz, zlib, bzip2, and
libgcrypt . I didn't add notes for the libraries that weren't needed for
anything else.

Thanks,
Gabe


>
>  Regards,
>  Arnout
>
> > ---
> >  package/systemd/systemd.mk | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index 9f15f24..29c764e 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -97,6 +97,13 @@ else
> >  SYSTEMD_CONF_OPTS += --disable-xz
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_ZLIB),y)
> > +SYSTEMD_DEPENDENCIES += zlib
> > +SYSTEMD_CONF_OPTS += --enable-zlib
> > +else
> > +SYSTEMD_CONF_OPTS += --disable-zlib
> > +endif
> > +
> >  ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
> >  SYSTEMD_DEPENDENCIES += libgcrypt
> >  SYSTEMD_CONF_OPTS += \
> >
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-- 
Gabe Evans | Co-Founder & CTO
hashrabbit.co ? angel.co/hashrabbit ? github.com/gevans
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160226/3d176ace/attachment.html>
