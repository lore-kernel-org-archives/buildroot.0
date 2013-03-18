From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Mar 2013 23:07:36 +0100
Subject: [Buildroot] [PATCH 4/6] package/genimage: new host-only package
In-Reply-To: <54a4d3e4cadf57b105adf8f8a216ebe846bcbeeb.1363544331.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 17 Mar 2013 19:19:43 +0100")
References: <cover.1363544331.git.yann.morin.1998@free.fr>
 <cover.1363544331.git.yann.morin.1998@free.fr>
 <54a4d3e4cadf57b105adf8f8a216ebe846bcbeeb.1363544331.git.yann.morin.1998@free.fr>
Message-ID: <87zjy0wedz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Yann> ---
 Yann> Changes v1 -> v2:
 Yann>   - add license info (Thomas)
 Yann> ---
 Yann>  package/Config.in.host          |    1 +
 Yann>  package/genimage/Config.in.host |   12 ++++++++++++
 Yann>  package/genimage/genimage.mk    |   13 +++++++++++++
 Yann>  3 files changed, 26 insertions(+), 0 deletions(-)
 Yann>  create mode 100644 package/genimage/Config.in.host
 Yann>  create mode 100644 package/genimage/genimage.mk

 Yann> diff --git a/package/Config.in.host b/package/Config.in.host
 Yann> index 43f292c..c456d5d 100644
 Yann> --- a/package/Config.in.host
 Yann> +++ b/package/Config.in.host
 Yann> @@ -3,6 +3,7 @@ menu "Host utilities"
 Yann>  source "package/dfu-util/Config.in.host"
 Yann>  source "package/dosfstools/Config.in.host"
 Yann>  source "package/e2fsprogs/Config.in.host"
 Yann> +source "package/genimage/Config.in.host"
 Yann>  source "package/lpc3250loader/Config.in.host"
 Yann>  source "package/omap-u-boot-utils/Config.in.host"
 Yann>  source "package/openocd/Config.in.host"
 Yann> diff --git a/package/genimage/Config.in.host b/package/genimage/Config.in.host
 Yann> new file mode 100644
 Yann> index 0000000..cfa267c
 Yann> --- /dev/null
 Yann> +++ b/package/genimage/Config.in.host
 Yann> @@ -0,0 +1,12 @@
 Yann> +config BR2_PACKAGE_HOST_GENIMAGE
 Yann> +	bool "host genimage"
 Yann> +	help
 Yann> +	  genimage is a tool to generate multiple filesystem and flash images
 Yann> +	  from a given root filesystem tree. genimage is intended to be run
 Yann> +	  in a fakeroot environment.
 Yann> +	  
 Yann> +	  Configuration is done is a config file parsed by libconfuse. Options
 Yann> +	  like the path to tools can be given in environment variables, the config
 Yann> +	  file or commandline switches.
 Yann> +	  

The help text lines are too long. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
