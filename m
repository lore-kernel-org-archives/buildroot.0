From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 May 2018 17:06:44 +0200
Subject: [Buildroot] [PATCH 1/1] libupnpp: fix build with uclibc
In-Reply-To: <20180504100538.21898-1-fontaine.fabrice@gmail.com>
References: <20180504100538.21898-1-fontaine.fabrice@gmail.com>
Message-ID: <20180504170644.509bae3b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  4 May 2018 12:05:38 +0200, Fabrice Fontaine wrote:

> +diff --git a/configure.ac b/configure.ac
> +index 8903b72..cd3c298 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -35,9 +35,8 @@ build_linux=no
> + build_mac=no
> + # Detect the target system
> + case "${host_os}" in
> +-    linux*) build_linux=yes;;
> +     darwin*) build_mac=yes;;
> +-    *) AC_MSG_ERROR(["OS $host_os is not supported"]);;
> ++    *) build_linux=yes;;

Wouldn't something like:

	linux*|uclinux*) build_linux=yes;

be a cleaner solution ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
