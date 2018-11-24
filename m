From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 15:10:40 +0100
Subject: [Buildroot] [PATCH next] tpm2-tss: force libopenssl as openssl
 provider
In-Reply-To: <20181121024437.21553-1-casantos@datacom.com.br>
References: <20181121024437.21553-1-casantos@datacom.com.br>
Message-ID: <20181124151040.76327f87@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Nov 2018 00:44:37 -0200, Carlos Santos wrote:
> Select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL and drop the patch to
> compile with libressl.
> 
> The discussion with the tpm2-tss developers led to the conclusion that
> libressl lacks some required functionalities. Quoting Andreas Fuchs[1]:
> "LibreSSL does not support OAEP-mode with labels at all, even though the
> internal OAEP-padding-function includes the parameters already. [...]
> Further, the internal OAEP-padding-function does not support variable
> hash algs, but staticly uses SHA1."
> 
> Notice that there will NOT be an option to use libgcrypt. OpenSSL will
> soon become the default ESAPI crypto backend to prevent the problem of
> forcing applications to link against both libgcrypt and libssl[2].
> 
> 1. https://github.com/tpm2-software/tpm2-tss/pull/1207#issuecomment-440217659
> 2. https://github.com/tpm2-software/tpm2-tss/issues/1169
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  .../0001-ESYS-Fix-build-with-LibreSSL.patch   | 48 -------------------
>  package/tpm2-tss/Config.in                    |  1 +
>  2 files changed, 1 insertion(+), 48 deletions(-)
>  delete mode 100644 package/tpm2-tss/0001-ESYS-Fix-build-with-LibreSSL.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
