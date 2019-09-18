From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 18 Sep 2019 20:19:14 +0200
Subject: [Buildroot] [pkg-luarocks 3/6] pkg-luarocks: regen packages
 with external dependencies
In-Reply-To: <20190918093501.5b91d097@windsurf>
References: <20190918061915.31250-1-francois.perrad@gadz.org>
 <20190918061915.31250-3-francois.perrad@gadz.org>
 <20190918093501.5b91d097@windsurf>
Message-ID: <CAB0FRstytkW+C-PcTKXQubHJZRwryrGwHB5tr7j-4jwTZt6wCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mer. 18 sept. 2019 ? 09:35, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a ?crit :

> On Wed, 18 Sep 2019 08:19:12 +0200
> Francois Perrad <fperrad@gmail.com> wrote:
>
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/lsqlite3/lsqlite3.mk             | 1 +
> >  package/lua-curl/lua-curl.mk             | 1 +
> >  package/lua-flu/lua-flu.mk               | 3 +++
> >  package/lua-iconv/lua-iconv.mk           | 1 +
> >  package/luadbi-sqlite3/luadbi-sqlite3.mk | 1 +
> >  package/luaexpat/luaexpat.mk             | 1 +
> >  package/luaossl/luaossl.mk               | 3 +++
> >  package/luasec/luasec.mk                 | 1 +
> >  package/luasql-sqlite3/luasql-sqlite3.mk | 1 +
> >  package/wsapi-fcgi/wsapi-fcgi.mk         | 1 +
> >  10 files changed, 14 insertions(+)
> >
> > diff --git a/package/lsqlite3/lsqlite3.mk b/package/lsqlite3/lsqlite3.mk
> > index bbf6a1db1..51f9516fd 100644
> > --- a/package/lsqlite3/lsqlite3.mk
> > +++ b/package/lsqlite3/lsqlite3.mk
> > @@ -8,5 +8,6 @@ LSQLITE3_VERSION = 0.9.5-1
> >  LSQLITE3_SUBDIR = lsqlite3_fsl09y
> >  LSQLITE3_LICENSE = MIT
> >  LSQLITE3_DEPENDENCIES = sqlite
> > +LSQLITE3_BUILD_OPTS = SQLITE_DIR="$(STAGING_DIR)/usr"
>
> I'm not sure to understand this change. It seems a bit redundant for
> all those packages to say "the native libraries you need are in
> $(STAGING_DIR)/usr", since native libraries are always there. Why isn't
> the common infrastructure taking care of this ?
>
>
Yes, it looks redundant.
_BUILD_OPT contains a list of key/value,
the value is always the same ($(STAGING_DIR)/usr),
but the key (SQLITE_DIR in this case) depends of the rock.

This is the LuaRocks way.

Fran?ois



> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190918/bb88f0f3/attachment.html>
