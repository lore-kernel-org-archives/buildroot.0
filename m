From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 6 Aug 2015 14:30:20 +0300
Subject: [Buildroot] [PATCH 1/2] qt/qt5base: force gstreamer on configure
In-Reply-To: <1438855575-4767-1-git-send-email-corjon.j@ecagroup.com>
References: <1438855575-4767-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20150806113020.GE4435@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

On Thu, Aug 06, 2015 at 12:06:14PM +0200, Julien Corjon wrote:
> +ifeq ($(BR2_PACKAGE_GSTREAMER),y)
> +QT5BASE_CONFIGURE_OPTS += -gstreamer 0.10
> +QT5BASE_DEPENDENCIES   += gstreamer
> +else ifeq ($(BR2_PACKAGE_GSTREAMER1),y)
> +QT5BASE_CONFIGURE_OPTS += -gstreamer 1.0
> +QT5BASE_DEPENDENCIES   += gstreamer1
> +else
> +QT5BASE_CONFIGURE_OPTS += -no-gstreamer
> +endif

Shouldn't we default to gstreamer 1.0 when both are enabled?

baruch


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
