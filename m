From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 10 Mar 2014 21:14:53 +0200
Subject: [Buildroot] [PATCH 3/3] rsyslog: bump to version 6.3.8
In-Reply-To: <1394459809-22174-3-git-send-email-clshotwe@rockwellcollins.com>
References: <1394459809-22174-1-git-send-email-clshotwe@rockwellcollins.com>
 <1394459809-22174-3-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <20140310191453.GW4249@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Clayton,

On Mon, Mar 10, 2014 at 08:56:49AM -0500, Clayton Shotwell wrote:
> Bumping version of rsyslog and adding new dependencies of libee and
> libestr.
> 
> Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
> ---
>  package/rsyslog/rsyslog.mk |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
> index daae010..3ca5eae 100644
> --- a/package/rsyslog/rsyslog.mk
> +++ b/package/rsyslog/rsyslog.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -RSYSLOG_VERSION = 5.8.0
> +RSYSLOG_VERSION = 6.3.8
>  RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog/
> -RSYSLOG_DEPENDENCIES = zlib
> +RSYSLOG_DEPENDENCIES = zlib libestr libee

Shouldn't you also select these packages in Config.in to make sure they are 
available?

baruch

>  # Build after Busybox
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -- 
> 1.7.1

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
