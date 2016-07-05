From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:03:36 +0200
Subject: [Buildroot] [PATCH v2 1/1] iptables: exported AR=$(TARGET_AR)
 to make
In-Reply-To: <20160613031340.30120-1-jordan@yelloz.me>
References: <20160613023826.6329-1-jordan@yelloz.me>
 <20160613031340.30120-1-jordan@yelloz.me>
Message-ID: <20160705150336.009c4bfe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Jun 2016 20:13:40 -0700, Jordan Yelloz wrote:
> This ensures the correct AR is used for some of the iptables build
> process. This is the same fix as
> <https://bugs.gentoo.org/show_bug.cgi?id=444282>
> 
> Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
> ---
>  package/iptables/iptables.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
> index 12e00f2..b9feaf5 100644
> --- a/package/iptables/iptables.mk
> +++ b/package/iptables/iptables.mk
> @@ -17,6 +17,7 @@ IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr \
>  	$(if $(BR2_STATIC_LIBS),,--disable-static)
>  # For 0002-iptables-add-xtables-config-parser.h-to-BUILT_SOURCES.patch
>  IPTABLES_AUTORECONF = YES
> +IPTABLES_MAKE_ENV = AR=$(TARGET_AR)

Instead of this fix, I've backported the patch you have submitted
upstream and which has been merged. See:

   https://git.buildroot.org/buildroot/commit/?id=bcfe05a7e9ce49bcc447fd956f52da0032f534e6

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
