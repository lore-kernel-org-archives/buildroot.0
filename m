From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 22:58:47 +0100
Subject: [Buildroot] [PATCH 1/2] rings: add the version major variable
In-Reply-To: <1389695458-19578-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1389695458-19578-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20140128225847.35ae8d12@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Tue, 14 Jan 2014 11:30:57 +0100, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  package/rings/rings.mk |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/rings/rings.mk b/package/rings/rings.mk
> index d052f5d..2876162 100644
> --- a/package/rings/rings.mk
> +++ b/package/rings/rings.mk
> @@ -4,7 +4,8 @@
>  #
>  ################################################################################
>  
> -RINGS_VERSION = 1.3.0-1
> +RINGS_VERSION_MAJOR = 1.3.0
> +RINGS_VERSION = $(RINGS_VERSION_MAJOR)-1
>  RINGS_SUBDIR  = rings-v_1_3_0
>  RINGS_LICENSE = MIT

While I agree with <foo>_VERSION_MAJOR, when <foo>_VERSION_MAJOR is
used in more than one place, I don't necessarily think it is needed
when it is used in only one place, <foo>_VERSION.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
