From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Aug 2017 18:14:09 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/mtd: test programs need
 threads
In-Reply-To: <20170815042004.12226-1-bernd.kuhls@t-online.de>
References: <20170815042004.12226-1-bernd.kuhls@t-online.de>
Message-ID: <7218ff76-ab9a-4d2e-8779-b77d91b87cd1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-08-17 06:20, Bernd Kuhls wrote:
> The test programs depend on pthreads:
> http://git.infradead.org/mtd-utils.git/blob/1bfee8660131fca7a18f68e9548a18ca6b3378a0:/configure.ac#l43
> 
> Also propagate the threads dependency to BR2_PACKAGE_MTD_INTEGCK.
> 
> Fixes
> http://autobuild.buildroot.net/results/879/879c79e505f65387a46c4be263dc8783c8ca61bf/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---

[snip]
>  config BR2_PACKAGE_MTD_INTEGCK
>  	bool "integck"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # mtd-tests
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_MTD_TESTS
>  	help
>  	  Install the integck test program.
>  
> +comment "integck needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

 You forgot the depends on MMU here. Applied to master with that fixed, thanks.

 Regards,
 Arnout

> +
>  endif

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
