From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:50:35 +0200
Subject: [Buildroot] [PATCH 2/2] package/znc: switch to cmake
In-Reply-To: <20190928104106.28327-2-bernd.kuhls@t-online.de>
References: <20190928104106.28327-1-bernd.kuhls@t-online.de>
 <20190928104106.28327-2-bernd.kuhls@t-online.de>
Message-ID: <20190928215036.4c90896a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 12:41:06 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Upstream deprecated autoconf and asks to use cmake:
> https://github.com/znc/znc/commit/71f35b003dda65f3867ff84deaf8aa15bcd0b958
> 
> Add options to explicitly disable cyrus and i18n support.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/znc/znc.mk | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)

Applied to master, thanks. Regarding the WANT_I18N option, what does it
do exactly ? Indeed, the autotools package infrastructure was
automatically passing --enable-nls or --disable-nls depending on the
value of BR2_SYSTEM_ENABLE_NLS. So with your unconditional addition of
WANT_I18N=OFF, I'm wondering if we have lost NLS support in znc when
BR2_SYSTEM_ENABLE_NLS=y. Could you check this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
