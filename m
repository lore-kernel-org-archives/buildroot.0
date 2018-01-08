From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 09:17:18 +0100
Subject: [Buildroot] [PATCH] ntp: does not work with libressl
In-Reply-To: <20180107225940.26656-1-peter@korsgaard.com>
References: <20180107225940.26656-1-peter@korsgaard.com>
Message-ID: <20180108091718.5df632f6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Jan 2018 23:59:40 +0100, Peter Korsgaard wrote:
> Fixes #10556
> 
> The --with-crypto handling in ntp only works with libopenssl, not with
> libressl, where it ends up with compilation issues like:
> 
> ntp_control.c:(.text+0x64): undefined reference to `EVP_MD_CTX_new'
> ntp_control.c:(.text+0x10c): undefined reference to `EVP_MD_CTX_free'
> libntpd.a(ntp_crypto.o): In function `bighash':
> ntp_crypto.c:(.text+0x2e8): undefined reference to `EVP_MD_CTX_new'
> ntp_crypto.c:(.text+0x328): undefined reference to `EVP_MD_CTX_free'
> libntpd.a(ntp_crypto.o): In function `crypto_verify':
> ntp_crypto.c:(.text+0x6cc): undefined reference to `EVP_MD_CTX_new'
> ntp_crypto.c:(.text+0x710): undefined reference to `EVP_MD_CTX_free'
> ntp_crypto.c:(.text+0x72c): undefined reference to `EVP_MD_CTX_free'
> 
> So ensure we only pass --with-crypto when libopenssl is used.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/ntp/ntp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
