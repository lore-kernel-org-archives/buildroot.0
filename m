From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 15 Jun 2015 10:22:50 +0300
Subject: [Buildroot] [PATCH] package/openvmtools: move to GitHub
In-Reply-To: <1434351386-2515-1-git-send-email-kaszak@gmail.com>
References: <1434351386-2515-1-git-send-email-kaszak@gmail.com>
Message-ID: <20150615072250.GI8165@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Karoly,

On Mon, Jun 15, 2015 at 08:56:26AM +0200, Karoly Kasza wrote:
> -OPENVMTOOLS_VERSION_MAJOR = 9.10.0
> -OPENVMTOOLS_VERSION = $(OPENVMTOOLS_VERSION_MAJOR)-2476743
> -OPENVMTOOLS_SOURCE = open-vm-tools-$(OPENVMTOOLS_VERSION).tar.gz
> -OPENVMTOOLS_SITE = http://downloads.sourceforge.net/project/open-vm-tools/open-vm-tools/stable-$(OPENVMTOOLS_VERSION_MAJOR)
> +OPENVMTOOLS_VERSION_MAJOR = stable-9.10

VERSION_MAJOR is only needed when it's used for something other than 
constructing VERSION, like in the URL above. Now that the URL is gone you can 
just remove VERSION_MAJOR, and set VERSION directly instead.

> +OPENVMTOOLS_VERSION = $(OPENVMTOOLS_VERSION_MAJOR).0
> +OPENVMTOOLS_SITE = $(call github,vmware,open-vm-tools,$(OPENVMTOOLS_VERSION))
>  OPENVMTOOLS_LICENSE = LGPLv2.1
>  OPENVMTOOLS_LICENSE_FILES = COPYING
>  # Autoreconf needed or config/missing will run configure again at buildtime

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
