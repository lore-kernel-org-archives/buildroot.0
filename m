From: Alexander Dahl <post@lespocky.de>
Date: Thu, 13 May 2021 19:34:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: security bump to
 version 0.21.1
In-Reply-To: <20210512212120.647405-1-fontaine.fabrice@gmail.com>
References: <20210512212120.647405-1-fontaine.fabrice@gmail.com>
Message-ID: <20210513173417.erlj7433mbnchkbk@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello buildroot folks,

On Wed, May 12, 2021 at 11:21:20PM +0200, Fabrice Fontaine wrote:
> Tag as a security bump as having an up to date bitcoin is important:
> https://patchwork.ozlabs.org/project/buildroot/patch/20200202085526.35742-1-james.hilliard1 at gmail.com
> 
> https://github.com/bitcoin/bitcoin/blob/master/doc/release-notes/release-notes-0.21.1.md

Instead of patching this thing, wouldn't it be better to remove
bitcoin support?  After all it's just a ponzi scheme with a humongous
bad environmental impact.  The electricity consumption is estimated
for around 180 TWh for 2021 alone, a lot sourced from dirty coal
power, with the potential risk of worsening power grid stability in
some places of the world.

I don't think it's ethically justifiable to support proof-of-work
stuff like this.

Greets
Alex

> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bitcoin/bitcoin.hash | 4 ++--
>  package/bitcoin/bitcoin.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
> index 3c65c3d730..6ea3398037 100644
> --- a/package/bitcoin/bitcoin.hash
> +++ b/package/bitcoin/bitcoin.hash
> @@ -1,5 +1,5 @@
> -# From https://bitcoincore.org/bin/bitcoin-core-0.21.0/SHA256SUMS.asc
> -sha256  1a91202c62ee49fb64d57a52b8d6d01cd392fffcbef257b573800f9289655f37  bitcoin-0.21.0.tar.gz
> +# From https://bitcoincore.org/bin/bitcoin-core-0.21.1/SHA256SUMS.asc
> +sha256  caff23449220cf45753f312cefede53a9eac64000bb300797916526236b6a1e0  bitcoin-0.21.1.tar.gz
>  
>  # Hash for license file
>  sha256  96fe807030b21f88305adc32af62f9aa19915f2783509fd6f52aea02cf83f644  COPYING
> diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
> index 5f1684879c..142521835c 100644
> --- a/package/bitcoin/bitcoin.mk
> +++ b/package/bitcoin/bitcoin.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BITCOIN_VERSION = 0.21.0
> +BITCOIN_VERSION = 0.21.1
>  BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
>  BITCOIN_AUTORECONF = YES
>  BITCOIN_LICENSE = MIT
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210513/f5266725/attachment.asc>
