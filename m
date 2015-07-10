From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 18:08:20 +0200
Subject: [Buildroot] [PATCH] openssl: always install openssl.cnf
In-Reply-To: <1432574426-17098-1-git-send-email-bos@je-eigen-domein.nl>
References: <1432574426-17098-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150710180820.0a22f749@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Mon, 25 May 2015 19:20:25 +0200, Floris Bos wrote:
> Install openssl.cnf even when the OpenSSL binary is not selected,
> because other packages that use the OpenSSL library may use it as
> well.
> 
> E.g. PHP's methods to programmatically create private keys and
> certificates depend on it.
> See: http://php.net/manual/en/function.openssl-pkey-new.php
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/openssl/openssl.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

I've marked this patch as Superseded, because since commit
http://git.buildroot.net/buildroot/commit/package/openssl?id=a7bc0b96233900a4f36cbb333c12ad64b03f8db9,
the openssl.conf file is always installed.

Let me know if that doesn't work for you.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
