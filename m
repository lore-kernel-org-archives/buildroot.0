From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 May 2018 13:39:56 +0200
Subject: [Buildroot] [PATCH 4/4] linux: config.in: add comment for Arm
 Cortex-M
In-Reply-To: <1527761825-26682-4-git-send-email-christophe.priouzeau@st.com>
References: <1527761825-26682-1-git-send-email-christophe.priouzeau@st.com>
 <1527761825-26682-4-git-send-email-christophe.priouzeau@st.com>
Message-ID: <9e5294e5-7d60-109a-b96e-0704f0092b7e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-05-18 12:17, Christophe PRIOUZEAU wrote:
> When binutils > 2.28 are selected on Arm Cortex-M cpu,
> linux kernel does not boot due to a new implementation
> of 'adr pseudo instruction' on binutils.
> 
> Bugzilla thread: https://bugs.busybox.net/show_bug.cgi?id=11051
> 
> Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
> ---
>  linux/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 73a3299..fbd886c 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -8,6 +8,10 @@ config BR2_LINUX_KERNEL
>  
>  if BR2_LINUX_KERNEL
>  
> +comment "Linux kernel will not boot with binutils >= 2.29"
> +	depends on !BR2_ARMV7M
> +	depends on BR2_BINUTILS_VERSION_2_28_X

 The logic is inverted here: it should be

	depends on BR2_ARMV7M
	depends on !BR2_BINUTILS_VERSION_2_28_X

 I guess you didn't test it?

 Regards,
 Arnout

> +
>  # Packages that need to have a kernel with support for loadable modules,
>  # but do not use the kernel-modules infrastructure, should select that
>  # option.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
