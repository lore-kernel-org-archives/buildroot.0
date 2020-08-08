From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 23:40:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: add openssl optional
 dependency
In-Reply-To: <20200727125140.GY19818@scaer>
References: <20200727124145.1825309-1-fontaine.fabrice@gmail.com>
 <20200727125140.GY19818@scaer>
Message-ID: <20200808234052.4e6ff454@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Jul 2020 14:51:40 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2020-07-27 14:41 +0200, Fabrice Fontaine spake thusly:
> > openssl is an optional dependency that is enabled by default since
> > version 0.7.0 and
> > https://github.com/capnproto/capnproto/commit/23db5e3fd91104a0b2881d8f8ab3c10bf9dd8e75  
> 
> Seeing how they are testing for openssl, will that no fail for a staitc
> link, because they forget to link with -lz in that case ?
> 
>       AC_CHECK_LIB(ssl, OPENSSL_init_ssl, [:], [
>         with_openssl=no
>       ], [-lcrypto])
> 
> Why don't they yse pkg-config?

It is weird, we don't have any build failures for this. I would assume
that any configuration where OpenSSL gets built before capnproto (by
chance) and is static should exhibit a build failure, but it's not the
case.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
