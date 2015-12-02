From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Dec 2015 21:58:49 +0100
Subject: [Buildroot] [PATCH 2/9] wireshark: needs host-pkgconf
In-Reply-To: <1449089301-29762-2-git-send-email-gustavo@zacarias.com.ar>
References: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
 <1449089301-29762-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151202205849.GB5773@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015-12-02 17:48 -0300, Gustavo Zacarias spake thusly:
> Needed for detection of various optional components.

The real reason is that configure does use PKG_CHECK_MODULES, whether
optional or not.

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/wireshark/wireshark.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index 867b945..5d1d5f6 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -9,7 +9,7 @@ WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
>  WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
>  WIRESHARK_LICENSE = wireshark license
>  WIRESHARK_LICENSE_FILES = COPYING
> -WIRESHARK_DEPENDENCIES = libpcap libgcrypt libglib2
> +WIRESHARK_DEPENDENCIES = host-pkgconf libpcap libgcrypt libglib2
>  WIRESHARK_CONF_ENV = \
>  	LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
>  	ac_cv_path_PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
> -- 
> 2.4.10
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
