From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Aug 2017 16:18:35 +0200
Subject: [Buildroot] Failing bind 9.11.1-P3 configure failure
In-Reply-To: <20170808001926.554b1a0a@gmx.net>
References: <15dba6532c8-c03-26aa@webjas-vab011.srv.aolmail.net>
 <20170808001926.554b1a0a@gmx.net>
Message-ID: <2de931b7-cef0-5eb4-07bf-55db96252451@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Peter,

On 08-08-17 00:19, Peter Seiderer wrote:
> Local build of bind here (with a random configuration) succeeds, mind to try
> the following buildroot patch:
> 
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 988f40e1c2..c65568e9e3 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -24,6 +24,7 @@ BIND_CONF_ENV = \
>         BUILD_CC="$(TARGET_CC)" \
>         BUILD_CFLAGS="$(TARGET_CFLAGS)"
>  BIND_CONF_OPTS = \
> +       --without-lmdb \
>         --with-libjson=no \
>         --with-randomdev=/dev/urandom \
>         --enable-epoll \

 Could you send this as an official patch?


> (*) Using a real name instead of any pseudonym or fake name is preferred

 Actually, only when submitting patches. For bug reporting, asking questions, on
IRC, etc. use pseudonyms all you like.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
