From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 22:24:49 +0100
Subject: [Buildroot] [PATCH v3 2/9] package/asterisk: libsrtp needs
 openssl
In-Reply-To: <20181014090202.31122-2-bernd.kuhls@t-online.de>
References: <20181014090202.31122-1-bernd.kuhls@t-online.de>
 <20181014090202.31122-2-bernd.kuhls@t-online.de>
Message-ID: <20181209222449.3db04bd8@windsurf>
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
> ---
> v3: no changes
> v2: Added comment in commit log about libsrtp dependencies (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
