From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 May 2012 07:43:48 -0300
Subject: [Buildroot] [PATCH 3/5] Added the libpth package.
In-Reply-To: <1336598986-9518-3-git-send-email-stijn.souffriau@essensium.com>
References: <1336598986-9518-1-git-send-email-stijn.souffriau@essensium.com>
 <1336598986-9518-3-git-send-email-stijn.souffriau@essensium.com>
Message-ID: <bd5a8085a62f24270632bd39c1a861dc@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-05-09 18:29, Stijn Souffriau wrote:

> +++ b/package/libpth/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBPTH
> +	bool "libpth"
> +	help
> +	  Pth is a very portable POSIX/ANSI-C based library for Unix
> +	  platforms which provides non-preemptive priority-based scheduling
> +	  for multiple threads of execution (aka ``multithreading'')
> +	  inside event-driven applications.
> +
> +	  http://www.gnu.org/software/pth/

depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_glibc || 
BR2_TOOLCHAIN_CTNG_eglibc
pth doesn't work with uClibc...
Regards.
