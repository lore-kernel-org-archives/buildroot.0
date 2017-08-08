From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 8 Aug 2017 19:00:23 +0200
Subject: [Buildroot] Failing bind 9.11.1-P3 configure failure
In-Reply-To: <2de931b7-cef0-5eb4-07bf-55db96252451@mind.be>
References: <15dba6532c8-c03-26aa@webjas-vab011.srv.aolmail.net>
 <20170808001926.554b1a0a@gmx.net>
 <2de931b7-cef0-5eb4-07bf-55db96252451@mind.be>
Message-ID: <20170808190023.2a1c6a6b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Tue, 8 Aug 2017 16:18:35 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

>  Hi Peter,
> 
> On 08-08-17 00:19, Peter Seiderer wrote:
> > Local build of bind here (with a random configuration) succeeds, mind to try
> > the following buildroot patch:
> > 
> > diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> > index 988f40e1c2..c65568e9e3 100644
> > --- a/package/bind/bind.mk
> > +++ b/package/bind/bind.mk
> > @@ -24,6 +24,7 @@ BIND_CONF_ENV = \
> >         BUILD_CC="$(TARGET_CC)" \
> >         BUILD_CFLAGS="$(TARGET_CFLAGS)"
> >  BIND_CONF_OPTS = \
> > +       --without-lmdb \
> >         --with-libjson=no \
> >         --with-randomdev=/dev/urandom \
> >         --enable-epoll \
> 
>  Could you send this as an official patch?

O.k, patch is on the way...

> 
> 
> > (*) Using a real name instead of any pseudonym or fake name is preferred
> 
>  Actually, only when submitting patches. For bug reporting, asking questions, on
> IRC, etc. use pseudonyms all you like.

And thanks for clarifying...

Regards,
Peter

> 
>  Regards,
>  Arnout
> 
