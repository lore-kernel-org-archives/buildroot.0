From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 18 Aug 2015 13:54:01 +0300
Subject: [Buildroot] [PATCH 1/1] msmtp: don't try to use IDN feature
In-Reply-To: <1439469361-31920-1-git-send-email-viallard@syscom-instruments.com>
References: <1439469361-31920-1-git-send-email-viallard@syscom-instruments.com>
Message-ID: <20150818105401.GV2765@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Anthony,

On Thu, Aug 13, 2015 at 02:36:01PM +0200, Anthony Viallard wrote:
> I don't known if there is a consensus about IDN usage for buildroot. I
> didn't see an option in the config about it. I presume IDN should be
> disabled for all package, am I right ?

This part should not appear in the commit log. The rest looks OK to me.

> autoconf can't see if AI_IDN is really supported 
> (http://sourceforge.net/p/msmtp/code/ci/907916e8089ea9303a7c091b763087530c88a063/).
> It seems weird but this is the case apparently.
> 
> Before I did the above patch, msmtp failed to send mail. The output was:
> 
> msmtp: cannot locate host smtp.mandrillapp.com: Bad value for ai_flags
> Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>

The convention is to have an empty line just above the sign-off line.

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
>  	--without-libgsasl
>  MSMTP_LICENSE = GPLv3+
>  MSMTP_LICENSE_FILES = COPYING

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
