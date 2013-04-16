From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Apr 2013 20:51:03 +0200
Subject: [Buildroot] [PATCH v5 1/7] arch: toolchain: Introduce binary
 formats BINFMT_*.
In-Reply-To: <1365761909-15305-1-git-send-email-sonic.adi@gmail.com>
References: <1365761909-15305-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <20130416205103.6ecd9bd9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Fri, 12 Apr 2013 18:18:23 +0800, Sonic Zhang wrote:

> +# Set up target binary format
> +choice
> +	prompt "Target Binary Format"
> +	default BR2_BINFMT_FDPIC if BR2_bfin
> +	default BR2_BINFMT_ELF
> +
> +config BR2_BINFMT_ELF
> +	bool "ELF"
> +	depends on !BR2_bfin
> +	help
> +	  ELF (Executable and Linkable Format) is a format for libraries and
> +	  executables used across different architectures and operating
> +	  systems.

I do agree with Arnout on one point here: we can hide this choice
when !BR2_bfin. However, contrary to Arnout, I'd like to keep this
BR2_BINFMT_ELF choice as an invisible option, that is always selected
on !BR2_bfin. Yes it's useless, but I think it makes the binfmt options
clearer.

Sonic, once this is changed, you have my Acked-by: Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> on this patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
