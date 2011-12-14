From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Dec 2011 07:51:38 +0100
Subject: [Buildroot] [PATCH v2 2/4] Supply better default uClibc config
	file when using ct-ng
In-Reply-To: <1323173840-8837-3-git-send-email-will_wagner@carallon.com>
References: <1323173840-8837-1-git-send-email-will_wagner@carallon.com>
 <1323173840-8837-3-git-send-email-will_wagner@carallon.com>
Message-ID: <201112140751.38731.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 06 December 2011 13:17:18 Will Wagner wrote:
> +config BR2_TOOLCHAIN_CTNG_uClibc_CONFIG
> +       default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30
> +       default "toolchain/uClibc/uClibc-0.9.32.config" if BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32
> +

 I believe that if you don't specify a type, it will default to bool.
So you should add a line containing only 'string'.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
