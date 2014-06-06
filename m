From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Jun 2014 21:47:32 +0200
Subject: [Buildroot] [PATCH 1/5] pth: new package
In-Reply-To: <1402062269-57018-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
 <1402062269-57018-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140606214732.268997d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 6 Jun 2014 14:44:25 +0100, Vicente Olivert Riera wrote:

> diff --git a/package/pth/Config.in b/package/pth/Config.in
> new file mode 100644
> index 0000000..54bb34c
> --- /dev/null
> +++ b/package/pth/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PTH
> +	bool "pth"
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC
> +	help
> +	  GNU Pth - The GNU Portable Threads
> +
> +	  http://www.gnu.org/software/pth/

We already have a pthsem package, which claims in its description:

config BR2_PACKAGE_LIBPTHSEM
        bool "libpthsem"
        depends on BR2_USE_MMU # fork()
        select BR2_PACKAGE_ARGP_STANDALONE
        help
          GNU pth is a user mode multi threading library. pthsem is an extend
          version, with support for semaphores added.

Do you know if pthsem could be used instead of pth for gnupg, or if pth
and pthsem would conflict with each other?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
