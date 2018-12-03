From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 3 Dec 2018 14:14:29 +0100
Subject: [Buildroot] [PATCH 01/15] package/pkg-rebar.mk: Remove
 dependencies from rebar.config
In-Reply-To: <20181128222848.27df2a6a@windsurf.home>
References: <20181126110807.31431-1-johan.oudinet@gmail.com>
 <20181126110807.31431-2-johan.oudinet@gmail.com>
 <20181128222848.27df2a6a@windsurf.home>
Message-ID: <CAJtjsKaHzR35EuEcLq584vffGmOqAPK_sda0hxDRRH3HStE-hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Nov 28, 2018 at 10:28 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Mon, 26 Nov 2018 12:07:53 +0100, Johan Oudinet wrote:
>
> > +# Remove dependencies listed in rebar.config unless the package says
> > +# otherwise
> > +ifeq ($$($(2)_KEEP_DEPENDENCIES),)
> > +define remove_dependencies_from_rebar_config
> > +     $(SED) '/^{deps/,/}\.$$$$/d' $$($$(PKG)_DIR)/rebar.config
>
> I renamed this macro:
>
>         remove-rebar-config-dependencies
>
> and moved it outside of the inner-rebar-package macro, so that it is
> declared together with the other macros in pkg-rebar.mk.
>
> Also, an added benefit is that we can avoid the double escaping so $$$$
> becomes just $$, and $$ becomes just $.
>
> I've applied to next, but could you please send a follow-up patch that
> documents this <pkg>_KEEP_DEPENDENCIES variable in the Buildroot
> manual in the rebar package infrastructure section ?

Thanks. I've just sent a patch to document this variable in the
Buildroot manual.

Best,
-- 
Johan
