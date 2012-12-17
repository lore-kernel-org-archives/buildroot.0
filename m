From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Dec 2012 18:42:31 +0100
Subject: [Buildroot] [PATCH] imx-lib: new package
In-Reply-To: <1355752131-31966-1-git-send-email-arnout@mind.be>
References: <1355752131-31966-1-git-send-email-arnout@mind.be>
Message-ID: <50CF5987.90805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/12 14:48, Arnout Vandecappelle (Essensium/Mind) wrote:
> +if BR2_PACKAGE_IMX_LIB
> +choice
> +	prompt "i.MX platform"
> +
> +config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX25_3STACK
> +	bool "imx25-3stack"
> +
> +config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX27ADS
> +	bool "imx27ads"
> +
> +config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX37_3STACK
> +	bool "imx37-3stack"
> +
> +config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX50
> +	bool "imx50"
> +
> +config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX51
> +	bool "imx51"
> +
> +config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX53
> +	bool "imx53"
> +
> +config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX6Q
> +	bool "imx6q"
> +
> +endchoice

  Here's a second issue that I'd like to get some feedback on:
gst-fsl-plugins also uses a PLATFORM definition, but the list of 
platforms is slightly different:
MX28/MX233/MX25/MX27/MX31/MX35/MX37/MX51/MX53/MX50/MX5X/MX6

  Ideally the 'platform' should be defined only once, but where? Or 
should I add all the platforms to gst-fsl-plugins with a select of the 
appropriate imx-lib platform?

  What to do with the platforms that are different? In some cases, I can 
make a guess of course (e.g. MX27 -> IMX27ADS)

  I can only test the mx6q because that's the only one for which I have a 
board... Build-testing doesn't make a difference because all platforms 
use the same API.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
