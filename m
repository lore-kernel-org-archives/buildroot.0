From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 4 Sep 2012 21:00:16 +0300
Subject: [Buildroot] [PATCH 1/2] dnsmasq: bump to version 2.63
In-Reply-To: <1346767658-7968-1-git-send-email-gustavo@zacarias.com.ar>
References: <1346767658-7968-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120904180016.GC3768@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Tue, Sep 04, 2012 at 11:07:37AM -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/dnsmasq/dnsmasq.mk |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
> index 1f714bf..fc7333f 100644
> --- a/package/dnsmasq/dnsmasq.mk
> +++ b/package/dnsmasq/dnsmasq.mk
> @@ -4,11 +4,13 @@
>  #
>  #############################################################
>  
> -DNSMASQ_VERSION = 2.62
> +DNSMASQ_VERSION = 2.63
>  DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
>  DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)"
>  DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
>  DNSMASQ_MAKE_OPT += DESTDIR=$(TARGET_DIR) LDFLAGS="$(TARGET_LDFLAGS)"
> +DNSMASQ_LICENSE = GPLv2 GPLv3

Looks confusing. Is it "either v2 or v3"? If so, then I think

DNSMASQ_LICENSE = Dual GPLv2/GPLv3

would be better.

baruch

> +DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
>  
>  ifneq ($(BR2_INET_IPV6),y)
>  	DNSMASQ_COPTS += -DNO_IPV6

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
