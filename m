From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Feb 2012 21:14:44 +0100
Subject: [Buildroot] [PATCH 7/7] sam-ba: new package with host variant
	only
In-Reply-To: <3c537b5ffb9ff8a5c85878c05f044c0fecdcf0f3.1327772556.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 28 Jan 2012 18:42:55 +0100")
References: <cover.1327772556.git.thomas.petazzoni@free-electrons.com>
 <cover.1327772556.git.thomas.petazzoni@free-electrons.com>
 <3c537b5ffb9ff8a5c85878c05f044c0fecdcf0f3.1327772556.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87k4458023.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> sam-ba is a tool needed to reprogram AT91-based systems using an USB
 Thomas> connection or a serial port connection.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
 Thomas> Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 Thomas> ---
 Thomas>  package/Config.in.host        |    1 +
 Thomas>  package/sam-ba/Config.in.host |    6 ++++++
 Thomas>  package/sam-ba/sam-ba.mk      |   23 +++++++++++++++++++++++
 Thomas>  3 files changed, 30 insertions(+), 0 deletions(-)
 Thomas>  create mode 100644 package/sam-ba/Config.in.host
 Thomas>  create mode 100644 package/sam-ba/sam-ba.mk

 Thomas> diff --git a/package/Config.in.host b/package/Config.in.host
 Thomas> index 6bc828b..1f49e79 100644
 Thomas> --- a/package/Config.in.host
 Thomas> +++ b/package/Config.in.host
 Thomas> @@ -1,6 +1,7 @@
 Thomas>  menu "Host utilities"
 
 Thomas>  source "package/openocd/Config.in.host"
 Thomas> +source "package/sam-ba/Config.in.host"
 Thomas>  source "package/uboot-tools/Config.in.host"
 
 Thomas>  endmenu
 Thomas> diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
 Thomas> new file mode 100644
 Thomas> index 0000000..27ffd12
 Thomas> --- /dev/null
 Thomas> +++ b/package/sam-ba/Config.in.host
 Thomas> @@ -0,0 +1,6 @@
 Thomas> +config BR2_PACKAGE_HOST_SAM_BA
 Thomas> +	bool "host sam-ba"
 Thomas> +	help
 Thomas> +	  Atmel SAM-BA software provides an open set of tools for
 Thomas> +	  programming the Atmel SAM3, SAM7 and SAM9 ARM-based
 Thomas> +	  microcontrollers.

I added

http://www.at91.com/linux4sam/bin/view/Linux4SAM/SoftwareTools

As upstream URL. Otherwise it looks good - Committed, thanks.

-- 
Bye, Peter Korsgaard
