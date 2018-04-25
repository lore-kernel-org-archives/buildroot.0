From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 15:42:06 +0200
Subject: [Buildroot] [PATCH] mbedtls: security bump to version 2.7.2
In-Reply-To: <be768b1de8c5908cef3e3acbff3bc03adcefd1a0.1524570502.git.baruch@tkos.co.il>
References: <be768b1de8c5908cef3e3acbff3bc03adcefd1a0.1524570502.git.baruch@tkos.co.il>
Message-ID: <20180425154206.10c858cc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Apr 2018 14:48:22 +0300, Baruch Siach wrote:
> The release announcement mentions these security fixes:
> 
>   Defend against Bellcore glitch attacks by verifying the results of RSA
>   private key operations.
> 
>   Fix implementation of the truncated HMAC extension. The previous
>   implementation allowed an offline 2^80 brute force attack on the HMAC
>   key of a single, uninterrupted connection (with no resumption of the
>   session).
> 
>   Reject CRLs containing unsupported critical extensions.
> 
>   Fix a buffer overread in ssl_parse_server_key_exchange() that could
>   cause a crash on invalid input. (CVE-2018-9988)
> 
>   Fix a buffer overread in ssl_parse_server_psk_hint() that could cause
>   a crash on invalid input. (CVE-2018-9989)
> 
> Drop upstream patch.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...1-dhm-Fix-typo-in-RFC-5114-constants.patch | 33 -------------------
>  package/mbedtls/mbedtls.hash                  |  6 ++--
>  package/mbedtls/mbedtls.mk                    |  2 +-
>  3 files changed, 4 insertions(+), 37 deletions(-)
>  delete mode 100644 package/mbedtls/0001-dhm-Fix-typo-in-RFC-5114-constants.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
