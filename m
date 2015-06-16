From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jun 2015 21:50:22 +0200
Subject: [Buildroot] [PATCH 1/1] Force rebuild of local site packages
 and theirs local dependencies
In-Reply-To: <1434460888-30770-1-git-send-email-viallard@syscom-instruments.com>
References: <1434460888-30770-1-git-send-email-viallard@syscom-instruments.com>
Message-ID: <20150616215022.6eb61f22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anthony Viallard,

On Tue, 16 Jun 2015 15:21:28 +0200, Anthony Viallard wrote:

> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index d5b29f0..929a31c 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -509,6 +509,10 @@ ifeq ($$(filter $(1),$$(DEPENDENCIES_HOST_PREREQ)),)
>  $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
>  endif
>  
> +ifeq ($$($(2)_SITE_METHOD),local)
> +$$($(2)_TARGET_RSYNC): $(1)-clean-for-rebuild
> +endif

Why don't you use "make <pkg>-rebuild" or "make <pkg>-reconfigure" ?

The problem with your proposal is that you have arbitrarily decided to
make it always restart from the build step. What if some people want to
restart from the install step, or the configure step ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
