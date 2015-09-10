From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Sep 2015 06:55:54 +0300
Subject: [Buildroot] [PATCH 02/14] kobs-ng: remove obsolete package
In-Reply-To: <1441830063-8190-3-git-send-email-gary.bisson@boundarydevices.com>
References: <1441830063-8190-1-git-send-email-gary.bisson@boundarydevices.com>
 <1441830063-8190-3-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20150910035554.GM2191@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Wed, Sep 09, 2015 at 10:20:51PM +0200, Gary Bisson wrote:
> -config BR2_PACKAGE_KOBS_NG
> -	bool "kobs-ng"
> -	depends on BR2_arm
> -	help
> -	  The kobs-ng tool is used for writing images to NAND on i.MX
> -	  platforms.
> -
> -	  This utility is provided by Freescale as-is and doesn't have an
> -	  upstream.

Please add a Config.in.legacy entry for BR2_PACKAGE_KOBS_NG that selects 
BR2_PACKAGE_IMX_KOBS. For the sake of bisectability the patch adding imx-kobs 
should come before this one.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
