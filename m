From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 13:58:40 +0100
Subject: [Buildroot] [PATCH] package/mbedtls: fix zlib support
In-Reply-To: <20170129211511.9747-1-joerg.krause@embedded.rocks>
References: <20170129211511.9747-1-joerg.krause@embedded.rocks>
Message-ID: <20170206135840.20683987@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Jan 2017 22:15:11 +0100, J?rg Krause wrote:
> To enable compression support using zlib it is necessary to uncomment
> the define for MBEDTLS_ZLIB_SUPPORT in config.h [1].
> 
> Note, that enabling TLS compression may make mbedTLS vulnerable to the
> CRIME attack [1]. It should not be enabled unless is is sure CRIME and
> similar attacks are not applicable to the particulare situation.
> 
> As zlib is probably enabled in most systems, maybe it is best to make
> the compression support a user choice and add the warning from [1]?

Yes, please do this, it seems to make sense.

> [1] https://tls.mbed.org/kb/how-to/deflate-compression-in-ssl-tls
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/mbedtls/mbedtls.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
