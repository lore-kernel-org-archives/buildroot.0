From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 18 Nov 2018 22:33:58 +0100
Subject: [Buildroot] [PATCH v2 1/2] c-ares: support host build
In-Reply-To: <20181118211942.28839-1-robertroyrose@gmail.com>
References: <20181118211942.28839-1-robertroyrose@gmail.com>
Message-ID: <8b5155dd-c5e5-570f-69ca-6f3a9ecc149c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Robert,

On 18/11/2018 22:19, Robert Rose wrote:
> Signed-off-by: Robert Rose <robertroyrose@gmail.com>
> ---
>  package/c-ares/c-ares.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
> index 67254244a1..76e9687b37 100644
> --- a/package/c-ares/c-ares.mk
> +++ b/package/c-ares/c-ares.mk
> @@ -15,3 +15,4 @@ C_ARES_LICENSE = MIT
>  C_ARES_LICENSE_FILES = ares_mkquery.c
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

 We only include host packages if there is a justification for it. That means
either:

- it is needed for building some other package; in this case, you should submit
the patch adding the host package in a series together with the other package; or

- it is used in a post-{build,fakeroot,image} script; in that case, there should
be a Config.in.host option for it so it can be selected, and the commit log
should have some explanation of why it could be useful in a post-* script.


 Regards,
 Arnout
