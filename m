From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Jun 2017 10:16:04 +0200
Subject: [Buildroot] [PATCH] python-paramiko: bump to version 2.2.0
In-Reply-To: <20170613071317.7112-1-yegorslists@googlemail.com>
References: <20170613071317.7112-1-yegorslists@googlemail.com>
Message-ID: <20170613101604.50b79b4d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Jun 2017 09:13:17 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Add new runtime dependencies bcrypt and pynacl.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied, thanks. However, one request below.

> ---
>  package/python-paramiko/Config.in            | 2 ++
>  package/python-paramiko/python-paramiko.hash | 4 ++--
>  package/python-paramiko/python-paramiko.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-paramiko/Config.in b/package/python-paramiko/Config.in
> index aad85cb13..7d20d04d2 100644
> --- a/package/python-paramiko/Config.in
> +++ b/package/python-paramiko/Config.in
> @@ -5,6 +5,8 @@ config BR2_PACKAGE_PYTHON_PARAMIKO
>  	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
>  	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
>  	select BR2_PACKAGE_PYTHON_PYASN # runtime
> +	select BR2_PACKAGE_PYTHON_PYNACL # runtime
> +	select BR2_PACKAGE_PYTHON_BCRYPT # runtime

Alphabetic sorting would be better. However, alphabetic sorting was
already not good (with the zlib selects), so it can be fixed in a
follow-up commit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
