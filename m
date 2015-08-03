From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 3 Aug 2015 22:57:42 +0300
Subject: [Buildroot] [PATCH 1/1] rapidxml: new package
In-Reply-To: <1438625054-7118-1-git-send-email-yba@tkos.co.il>
References: <1438625054-7118-1-git-send-email-yba@tkos.co.il>
Message-ID: <20150803195742.GJ3345@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yonatan,

On Mon, Aug 03, 2015 at 09:04:14PM +0300, Jonathan Ben-Avraham wrote:
> +RAPIDXML_VERSION = 1.13
> +RAPIDXML_SOURCE = rapidxml-$(RAPIDXML_VERSION).zip
> +
> +#RAPIDXML_SITE = http://sourceforge.net/projects/rapidxml/files/latest/download

Please remove.

> +RAPIDXML_SITE = http://garr.dl.sourceforge.net/project/rapidxml/rapidxml/rapidxml%201.13/

Does

RAPIDXML_SITE = http://sourceforge.net/project/rapidxml/rapidxml/rapidxml%20$(RAPIDXML_VERSION)/

work?

> +RAPIDXML_LICENSE = MIT
> +RAPIDXML_LICENSE_FILES = license.txt
> +RAPIDXML_INSTALL_TARGET = NO

This needs an explanation comment. Is this a header only package?

> +RAPIDXML_INSTALL_STAGING = YES
> +
> +define RAPIDXML_EXTRACT_CMDS
> +	$(UNZIP) -d $(@D) $(DL_DIR)/$(RAPIDXML_SOURCE)
> +endef
> +
> +define RAPIDXML_INSTALL_STAGING_CMDS
> +	cp -dpfr $(@D)/rapidxml-$(RAPIDXML_VERSION)/*hpp $(STAGING_DIR)/usr/include
> +endef
> +
> +$(eval $(generic-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
