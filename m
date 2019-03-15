From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 23:04:55 +0100
Subject: [Buildroot] [PATCH 2/2] pkg-generic: Cleanup some redundant
 checks
In-Reply-To: <20190315214740.4212-2-nolange79@gmail.com>
References: <20190315214740.4212-1-nolange79@gmail.com>
 <20190315214740.4212-2-nolange79@gmail.com>
Message-ID: <20190315230455.3efbf8fd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Mar 2019 22:47:40 +0100
Norbert Lange <nolange79@gmail.com> wrote:

> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/pkg-generic.mk | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 89da43d5e5..11f16cab18 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -604,18 +604,15 @@ endif
>  
>  ifeq ($$(filter host-tar host-skeleton host-fakedate,$(1)),)
>  $(2)_EXTRACT_DEPENDENCIES += $$(BR2_TAR_HOST_DEPENDENCY)
> -endif
>  
> -ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
>  ifneq ($$(filter .xz .lzma,$$(suffix $$($(2)_SOURCE))),)
>  $(2)_EXTRACT_DEPENDENCIES += $$(BR2_XZCAT_HOST_DEPENDENCY)
>  endif
> -endif
>  
> -ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
>  ifeq ($$(suffix $$($(2)_SOURCE)),.lz)
>  $(2)_EXTRACT_DEPENDENCIES += $$(BR2_LZIP_HOST_DEPENDENCY)
>  endif

I think the commit log needs to be extended to explain why they are not
redundant anymore. I guess the explanation is that the host-xz and
host-lzip sources are not respectively packed as .xz archive and .lz
archives, so thanks to your PATCH 1/2, host-xz is already not going to
be added to the dependencies of host-xz, and host-lzip is not going to
be added to the dependencies of host-lzip. But since that's not
trivial, the commit log should explain, at the very least.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
