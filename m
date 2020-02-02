From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Feb 2020 10:12:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: add backporting
 requirement note to bitcoin package
In-Reply-To: <20200202085526.35742-1-james.hilliard1@gmail.com>
References: <20200202085526.35742-1-james.hilliard1@gmail.com>
Message-ID: <20200202091245.GA4107@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-02-02 01:55 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/bitcoin/bitcoin.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
> index 040c55b8a6..c58bd9797c 100644
> --- a/package/bitcoin/bitcoin.mk
> +++ b/package/bitcoin/bitcoin.mk
> @@ -4,6 +4,10 @@
>  #
>  ################################################################################
>  
> +# Major version updates must be backported unconditionally, if backporting
> +# is not feasible the bitcoin package must be removed from any such branches.
> +# Details:
> +# https://bitcoinmagazine.com/articles/linux-distribution-packaging-and-bitcoin-1374549783

The referenced post is not about ensuring the latest version is
packaged, but it is a pledge that distributions do not package bitcoin
at all, or that if they do, they just plainly use binaries provided by
upstream, and that the distributions do carefully assess the unbundling
of bundled libraries if they do so.

And the reasons they provide do not really apply to us, I believe,
because we are not a distribution; we are a buildsystem that generates
firmware images. Once such an image is flashed on a device, we have no
way to guarantee that it will be updated, or even updatable.

Besides, we're not doing any unbundling on that package; the only
external dependencies (bot optional) are not bundled.

Finally, if one were to use a released version of Buildroot, say
2019.05, we are no longer maintaining it, so it would anyway be stuck to
the older bitcoin version anyway...

The best we can ensure is that we try to follow upstream releases as
closely as possible in master (and thus interesting parties should send
patches), and when it makes sense secrity-wise, to backport it to the
older branches, like we do for all other packages.

So, this comment is not about what upstream said, and, I believe, does
not make sense us. Or we'd need to have such a comment in all
packages...

Regards,
Yann E. MORIN.

>  BITCOIN_VERSION = 0.19.0.1
>  BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
>  BITCOIN_AUTORECONF = YES
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
