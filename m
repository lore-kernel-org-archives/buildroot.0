From: Stefan Ott <stefan@ott.net>
Date: Sun, 29 Mar 2020 18:53:13 +0200
Subject: [Buildroot] [PATCH 1/1] unbound: new package
In-Reply-To: <CAGm1_ktqCr1K4qR9A8B3DNSeEwQJmzo3ktLvs6wWtcAy1v9dpQ@mail.gmail.com>
References: <20200321005706.22235-1-stefan@ott.net>
 <CAGm1_ktqCr1K4qR9A8B3DNSeEwQJmzo3ktLvs6wWtcAy1v9dpQ@mail.gmail.com>
Message-ID: <20200329165313.GE18598@greebo.asti.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor

Thanks for your feedback.

On Sat, Mar 21, 2020 at 07:42:39AM +0100, Yegor Yefremov wrote:
> >
> > +config BR2_PACKAGE_UNBOUND
> > +       bool "unbound"
> > +       select BR2_PACKAGE_EXPAT
> > +       select BR2_PACKAGE_LIBEVENT
> > +       select BR2_PACKAGE_OPENSSL
> > +       help
> > +               Unbound is a validating, recursive, and caching DNS resolver.
> > +               It supports DNSSEC, QNAME minimisation, DNS-over-TLS and
> > +               DNSCrypt.
> > +
> > +               https://www.unbound.net
> 
> Looks like you have two tabs instead of one tab and two spaces.
> 
> > +if BR2_PACKAGE_UNBOUND
> > +       config BR2_PACKAGE_UNBOUND_DNSCRYPT
> > +       bool "Enable DNSCrypt"
> > +       select BR2_PACKAGE_LIBSODIUM
> > +       help
> > +               DNSCrypt wraps unmodified DNS queries between a client and
> > +               a DNS resolver. Default port used is 443 and like with
> > +               normal unencrypted DNS, it uses UDP first and falling back
> > +               to TCP if response too large.
> > +
> > +               There is also DNS-over-TLS, a TCP only version
> > +               of proposed standard for DNS encryption (RFC 7858).
> > +               Default port for DNS-over-TLS is 853 and Unbound has
> > +               built-in support for it.
> > +
> > +               https://tools.ietf.org/html/rfc7858
> > +
> > +               Note: Neither DNSCrypt or DNS-over-TLS encrypt the SNI.
> > +               Here is some suggestions how to handle SNI encryption:
> > +
> > +               https://tools.ietf.org/html/draft-ietf-tls-sni-encryption-00
> 
> same here.

Ah yes, I had missed that in the manual. Patch v2 should be with the
proper indentation, thanks for pointing it out.


-- 
Stefan Ott
https://www.ott.net/
