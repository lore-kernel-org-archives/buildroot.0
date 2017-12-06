From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 6 Dec 2017 13:29:03 +0200
Subject: [Buildroot] [PATCH v2] package/i2c-tools: bump to version 4.0
In-Reply-To: <1512559166-5399-1-git-send-email-angelo@amarulasolutions.com>
References: <1512559166-5399-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20171206112903.injmxvpsq4nsfiox@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Algelo,

On Wed, Dec 06, 2017 at 12:19:26PM +0100, Angelo Compagnucci wrote:
> This patch bumps i2c-tools to version 4.0 and adds a new command
> named i2ctransfer.
> It adds also an upstream commit not included in the release
> that fixing a static compilation issue.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---

[...]

> +ifeq ($(BR2_STATIC_LIBS),y)
> +ifeq ($(BR2_SHARED_STATIC_LIBS),)

BR2_STATIC_LIBS and BR2_SHARED_STATIC_LIBS are mutually exclusive choice 
options. You only need to test for BR2_STATIC_LIBS.

> +I2C_TOOLS_MAKE_OPTS += BUILD_DYNAMIC_LIB=0 USE_STATIC_LIB=1
> +endif
> +endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
