From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 13 Aug 2015 13:52:49 +0300
Subject: [Buildroot] [PATCH 1/1] msmtp: don't try to use IDN feature
In-Reply-To: <1439463011-29089-1-git-send-email-viallard@syscom-instruments.com>
References: <1439463011-29089-1-git-send-email-viallard@syscom-instruments.com>
Message-ID: <20150813105249.GX25261@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Anthony,

On Thu, Aug 13, 2015 at 12:50:11PM +0200, Anthony Viallard wrote:
> Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
> ---
>  package/msmtp/msmtp.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
> index bff2620..7c8261e 100644
> --- a/package/msmtp/msmtp.mk
> +++ b/package/msmtp/msmtp.mk
> @@ -10,6 +10,7 @@ MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
>  MSMTP_DEPENDENCIES = host-pkgconf
>  MSMTP_CONF_OPTS = \
>  	--without-libidn \
> +	--disable-gai-idn \

Please explain why in the commit log. Does it break at build time, run time, 
something else?

>  	--without-libgsasl
>  MSMTP_LICENSE = GPLv3+
>  MSMTP_LICENSE_FILES = COPYING

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
