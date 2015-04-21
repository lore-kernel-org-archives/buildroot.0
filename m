From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Apr 2015 23:45:17 +0200
Subject: [Buildroot] [PATCH] rtai: remove option
 BR2_LINUX_KERNEL_EXT_RTAI_PATCH
In-Reply-To: <1429652188-11586-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429652188-11586-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5536C4ED.3010008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/04/15 23:36, Thomas Petazzoni wrote:
> This commit removes BR2_LINUX_KERNEL_EXT_RTAI_PATCH because this
> option never worked. It was added in commit
> 8797a9cd1fe6723db34b0c125d0d9d04e3483e8d, which added package/rtai/
> and RTAI as a Linux extension.

 I agree with this change, however...

[snip]

> diff --git a/linux/Config.ext.in b/linux/Config.ext.in
> index c909254..ea79aa1 100644
> --- a/linux/Config.ext.in
> +++ b/linux/Config.ext.in
> @@ -44,12 +44,6 @@ config BR2_LINUX_KERNEL_EXT_RTAI
>  	help
>  	  RTAI Kernel part.
>  
> -config BR2_LINUX_KERNEL_EXT_RTAI_PATCH
> -	depends on BR2_LINUX_KERNEL_EXT_RTAI
> -	string "Path for RTAI patch file"
> -	help
> -	  Optionally, explicitly specify the RTAI patch to use.
> -

 This requires legacy handling. With in the help text something like

	  The BR2_LINUX_KERNEL_EXT_RTAI_PATCH option never worked, so it is
	  probably not useful. If you do have a valid use case and it used to
	  work for you, please let us know on buildroot at buildroot.net.


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
