From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 23:17:02 +0100
Subject: [Buildroot] [PATCH v3 2/9] package/asterisk: libsrtp needs
 openssl
In-Reply-To: <20181014090202.31122-2-bernd.kuhls@t-online.de>
References: <20181014090202.31122-1-bernd.kuhls@t-online.de>
 <20181014090202.31122-2-bernd.kuhls@t-online.de>
Message-ID: <20181206231702.3448b012@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Oct 2018 11:01:54 +0200, Bernd Kuhls wrote:
> Fixes configure error
> 
> checking for the ability of -lsrtp2 to be linked in a shared object... yes
> checking for srtp_crypto_policy_set_aes_cm_256_hmac_sha1_80 in -lsrtp2... yes
> checking for srtp_crypto_policy_set_aes_cm_192_hmac_sha1_80 in -lsrtp2... no
> checking for srtp_crypto_policy_set_aes_gcm_128_8_auth in -lsrtp2... no
> checking for srtp_shutdown in -lsrtp2... yes
> checking for srtp2/srtp.h... (cached) yes
> configure: WARNING: ***
> configure: WARNING: *** OpenSSL required when using libsrtp2, checking for libsrtp instead.
> configure: WARNING: ***
> 
> using this defconfig:
> 
> BR2_PACKAGE_LIBSRTP=y
> BR2_PACKAGE_ASTERISK=y
> 
> Please note that openssl support in libsrtp is not available for static
> builds:
> https://git.buildroot.net/buildroot/tree/package/libsrtp/libsrtp.mk#n27
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I could indeed reproduce this build issue. One question that comes up
is: why hasn't the autobuilder found this build problem ? It happens on
a fairly basic/straightforward configuration, it's really strange that
it has never popped up. Any idea about this?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
