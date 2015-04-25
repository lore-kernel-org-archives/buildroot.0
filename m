From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 10:33:40 +0200
Subject: [Buildroot] [PATCH] sh64: deprecate support for this dead
 architecture
In-Reply-To: <20150425012313.GA29771@waldemar-brodkorb.de>
References: <20150425012313.GA29771@waldemar-brodkorb.de>
Message-ID: <20150425103340.41fef9c4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sat, 25 Apr 2015 03:23:14 +0200, Waldemar Brodkorb wrote:
> As discussed on the mailinglist, this should be deprecated
> before removal.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  Config.in.legacy |    6 ++++++
>  arch/Config.in   |    1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 70a9043..622e51c 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -107,6 +107,12 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2015.05"
>  
> +config BR2_sh64
> +	bool "SuperH64 architecture support has been removed"
> +	select BR2_LEGACY
> +	help
> +	  There is no hardware or emulator available.
> +

We don't add deprecated options in Config.in.legacy, only the options
that I really removed. So I've removed this chunk from the patch and
applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
