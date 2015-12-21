From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Dec 2015 23:52:23 +0100
Subject: [Buildroot] [PATCH 1/1] emlog: new package
In-Reply-To: <1450446298-3523-1-git-send-email-joris.lijssens@gmail.com>
References: <1450446298-3523-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20151221235223.5bed5c79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joris,

On Fri, 18 Dec 2015 14:44:58 +0100, Joris Lijssens wrote:

> diff --git a/package/emlog/Config.in b/package/emlog/Config.in
> new file mode 100644
> index 0000000..85a9ed6
> --- /dev/null
> +++ b/package/emlog/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_EMLOG
> +	bool "emlog"
> +	help
> +	  emlog is a Linux kernel module that makes it easy to access the most
> +	  recent (and only the most recent) output from a process. It works
> +	  just like "tail -f" on a log file, except that the storage required
> +	  never grows. This can be useful in embedded systems where there isn't
> +	  enough memory or disk space for keeping complete log files, but the
> +	  most recent debugging messages are sometimes needed (e.g., after an
> +	  error is observed).
> +
> +	  https://github.com/nicupavel/emlog

I did not spot this during the previous review, and Arnout also didn't
spot it apparently, so maybe I'm missing something.

emlog is a kernel module, so surely it needs the Linux kernel to be
built beforehand. So your package should "depends on BR2_LINUX_KERNEL"
and have "linux" in EMLOG_DEPENDENCIES. Otherwise, I don't see how it
can even build.

Could you look into this, as well as the comments from Arnout, and
resend an updated version of your patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
