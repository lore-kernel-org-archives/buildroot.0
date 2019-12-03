From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Dec 2019 23:08:42 +0100
Subject: [Buildroot] [PATCH v2] package/tini: compile executable static
In-Reply-To: <1575381587-102271-1-git-send-email-simon.rowe@citrix.com>
References: <1574255351-23642-1-git-send-email-simon.rowe@citrix.com>
 <1575381587-102271-1-git-send-email-simon.rowe@citrix.com>
Message-ID: <c5dbd7a6-e13d-8aee-44b9-020c99d901af@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/12/2019 14:59, Simon Rowe wrote:
> One usecase for tini is as the init process for a container which has
> a single executable and no C runtime library. It therefore needs to be
> independent of any C runtime library within the container.
> 
> Tested with multiple toolchains and BR2_SHARED_LIBS=y.
> 
> Signed-off-by: Simon Rowe <simon.rowe@citrix.com>

 Applied to master, thanks. I've extended the commit message a bit.

 Regards,
 Arnout

> 
> ---
> Changes v1 -> v2:
>   - tested with other toolchains
>   - expanded reasoning for static linking
> ---
>  package/tini/tini.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/tini/tini.mk b/package/tini/tini.mk
> index 5dd9877..986e612 100644
> --- a/package/tini/tini.mk
> +++ b/package/tini/tini.mk
> @@ -10,6 +10,7 @@ TINI_LICENSE = MIT
>  TINI_LICENSE_FILES = LICENSE
>  
>  TINI_CFLAGS = $(TARGET_CFLAGS) \
> +	-static \
>  	-DTINI_VERSION=\"$(TINI_VERSION)\" \
>  	-DTINI_GIT=\"\"
>  
> 
