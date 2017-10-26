From: Martin Bark <martin@barkynet.com>
Date: Thu, 26 Oct 2017 11:25:56 +0100
Subject: [Buildroot] [PATCH] nodejs: security bump to version 8.8.0
In-Reply-To: <20171026065933.8311-1-peter@korsgaard.com>
References: <20171026065933.8311-1-peter@korsgaard.com>
Message-ID: <CAFGQKxdy_PWhvO_8vvWcft+f6rqc5KJZntxcqWui7PRoHarGrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

There was a regression in 8.8.0 which as been fixed in 8.8.1.  I have just
upload a patch for 8.8.1

Thanks

Martin

On 26 October 2017 at 07:59, Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes CVE-2017-14919 - In zlib v1.2.9, a change was made that causes an
> error to be raised when a raw deflate stream is initialized with windowBits
> set to 8.  On some versions this crashes Node and you cannot recover from
> it, while on some versions it throws an exception.  Node.js will now
> gracefully set windowBits to 9 replicating the legacy behavior to avoid a
> DOS vector.
>
> For more details, see the announcement:
> https://nodejs.org/en/blog/vulnerability/oct-2017-dos/
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/nodejs/nodejs.hash | 4 ++--
>  package/nodejs/nodejs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index 3cc77b2524..30497eac53 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -1,2 +1,2 @@
> -# From http://nodejs.org/dist/v8.6.0/SHASUMS256.txt
> -sha256 b17071109238295b9f363b768afdff97a9f386203d4f080c91847ce76d4f7e93
> node-v8.6.0.tar.xz
> +# From http://nodejs.org/dist/v8.8.0/SHASUMS256.txt
> +sha256 854f32d27cd62895a13a6af43b87e0542f512f40af960244d15cf16da0914ecf
> node-v8.8.0.tar.xz
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index c1bac35a64..8c30cb96d3 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -4,7 +4,7 @@
>  #
>  ############################################################
> ####################
>
> -NODEJS_VERSION = 8.6.0
> +NODEJS_VERSION = 8.8.0
>  NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
>  NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>  NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
> --
> 2.11.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171026/23943d0b/attachment.html>
