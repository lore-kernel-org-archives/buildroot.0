From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 22:52:49 +0200
Subject: [Buildroot] [PATCH 1/2] package/tpm2-tss: add upstream patch to
 drop hardcoded -lgcrypt from tss2-esys.pc
In-Reply-To: <20190408115648.11004-1-peter@korsgaard.com>
References: <20190408115648.11004-1-peter@korsgaard.com>
Message-ID: <20190408225249.741a183b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  8 Apr 2019 13:56:46 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> tss2-esys.pc contains a hardcoded -lgcrypt even though the openssl crypto
> backend (as in Buildroot) may be used, leading to linker errors when using
> esys.
> 
> Given that tpm2-tss doesn't allow static linking, there is no need to
> explicitly list the crypto library dependency.
> 
> Cherry pick an upstream patch to fix this.  Notice that the upstream patch
> also changes the default crypto backend to openssl.  As this isn't stricly
> needed (we explicitly configure for openssl) and requires autoreconv, drop
> the configure.ac hunk from the patch.
> 
> https://github.com/tpm2-software/tpm2-tss/pull/1173
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...c-switch-default-ESAPI-crypto-backend-to-.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/tpm2-tss/0002-configure.ac-switch-default-ESAPI-crypto-backend-to-.patch

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
