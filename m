From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 13:55:35 +0200
Subject: [Buildroot] [PATCH] package/uacme: don't allow ualpn with
 mbedTLS
In-Reply-To: <20200509090808.3ezmxiaucoj5fzc6@einstein.dilieto.eu>
References: <20200509090808.3ezmxiaucoj5fzc6@einstein.dilieto.eu>
Message-ID: <20200509135535.0587e6fc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 9 May 2020 11:08:08 +0200
Nicola Di Lieto <nicola.dilieto@gmail.com> wrote:

> ualpn requires mbedTLS to be configured and built with
> MBEDTLS_X509_ALLOW_UNSUPPORTED_CRITICAL_EXTENSION
> which is not the default and can be a security risk.
> 
> Therefore make BR2_PACKAGE_UACME_UALPN depend on
> BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS.
> 
> Fixes http://autobuild.buildroot.net/results/d241121f8155bad9b6b25c16234576abb7fc940b
> 
> See also
> 
> https://github.com/ndilieto/uacme/issues/23
> https://github.com/ARMmbed/mbedtls/issues/3241
> https://github.com/ARMmbed/mbedtls/pull/3243
> http://lists.busybox.net/pipermail/buildroot/2020-April/281059.html
> http://lists.busybox.net/pipermail/buildroot/2020-April/281108.html
> 
> Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
> ---
>  package/uacme/Config.in | 4 ++++
>  package/uacme/uacme.mk  | 6 +++---
>  2 files changed, 7 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
