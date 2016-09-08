From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 22:18:53 +0200
Subject: [Buildroot] [PATCH 5/6] linux-headers: remove deprecated
 versions
In-Reply-To: <1473359942-15810-5-git-send-email-gustavo@zacarias.com.ar>
References: <1473359942-15810-1-git-send-email-gustavo@zacarias.com.ar>
 <1473359942-15810-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160908221853.398542f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Sep 2016 15:39:01 -0300, Gustavo Zacarias wrote:
> Linux headers 3.19.x and 4.0.x have been deprecated for a while now, so
> it's time to remove them.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  Config.in.legacy                     | 20 ++++++++++++++++++++
>  package/linux-headers/Config.in.host | 10 ----------
>  2 files changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 60d414b..b796904 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,26 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2016.11"
>  
> +config BR2_KERNEL_HEADERS_4_0
> +	bool "kernel headers version 4.0.x are no longer supported"
> +	select BR2_KERNEL_HEADERS_4_1

Wouldn't it be safer to select in this case the immediately older
kernel header version that's still available?

Imagine the user is running a 4.0 kernel, and therefore has chosen 4.0
kernel headers. With your change, the toolchain will now be rebuilt
with 4.1 kernel headers... while the user is running a 4.0 kernel. Not
good.

Default to an older version seems safer to me.

What do you think?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
