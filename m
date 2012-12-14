From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Dec 2012 11:35:58 +0100
Subject: [Buildroot] [PATCH] gpsd: needs threads
In-Reply-To: <1355480711-12089-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 14 Dec 2012 07:25:11 -0300")
References: <1355480711-12089-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <876244kjjl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Fixes
 Gustavo> http://autobuild.buildroot.net/results/05925389ac2531307f23bf5f5f3a83a5a97301bf/

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/gpsd/Config.in |    5 +++++
 Gustavo>  1 files changed, 5 insertions(+), 0 deletions(-)

 Gustavo> diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
 Gustavo> index 69f63f9..35e535b 100644
 Gustavo> --- a/package/gpsd/Config.in
 Gustavo> +++ b/package/gpsd/Config.in
 Gustavo> @@ -2,6 +2,7 @@ config BR2_PACKAGE_GPSD
 Gustavo>  	bool "gpsd"
 Gustavo>  	# Uses fork()
 Gustavo>  	depends on BR2_USE_MMU
 Gustavo> +	depends on BR2_TOOLCHAIN_HAS_THREADS
 Gustavo>  	help
 Gustavo>  	  gpsd is a service daemon that monitors one or more GPSes or AIS
 Gustavo>  	  receivers attached to a host computer through serial or USB ports,
 Gustavo> @@ -12,6 +13,10 @@ config BR2_PACKAGE_GPSD
 
 Gustavo>  	  http://gpsd.berlios.de/
 
 Gustavo> +
 Gustavo> +comment "gpsd needs a toolchain with thread support"
 Gustavo> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
 Gustavo> +

Menuconfig has a bug which causes suboptions to not be indented if
there's a comment before them, so the comment needs to go either above
BR2_PACKAGE_GPSD or below all the sub options.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
