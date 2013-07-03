From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jul 2013 23:24:05 +0200
Subject: [Buildroot] [PATCH 08/23] kernel-headers: migrate to the
 package infrastructure
In-Reply-To: <1372620553-11416-9-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20130703232405.3b60a57a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Jun 2013 21:28:58 +0200, Thomas Petazzoni wrote:

> --- a/toolchain/kernel-headers/Config.in
> +++ b/package/linux-headers/Config.in.host
> @@ -1,6 +1,5 @@
> -# Choose the kernel headers to use for kernel-headers target. This is
> -# ignored if you are building your own kernel or using the system kernel.
> -#
> +config BR2_PACKAGE_HOST_LINUX_HEADERS
> +	bool

Now that I read this again, I'm wondering why I've added this dummy
hidden Config.in option. It seems useless, no?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
