From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 21:35:28 +0100
Subject: [Buildroot] [PATCH 4/4] support/testing: add test for a f2fs
 filesystem
In-Reply-To: <20181106140647.18251-4-grzegorz@blach.pl>
References: <20181106140647.18251-1-grzegorz@blach.pl>
 <20181106140647.18251-4-grzegorz@blach.pl>
Message-ID: <20181108213528.5ec746b2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Nov 2018 15:06:47 +0100, Grzegorz Blach wrote:
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  .../testing/conf/f2fs-kernel-fragment.config  |  5 ++
>  support/testing/tests/fs/test_f2fs.py         | 49 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 support/testing/conf/f2fs-kernel-fragment.config
>  create mode 100644 support/testing/tests/fs/test_f2fs.py
> 
> diff --git a/support/testing/conf/f2fs-kernel-fragment.config b/support/testing/conf/f2fs-kernel-fragment.config
> new file mode 100644
> index 0000000000..0fca7e784b
> --- /dev/null
> +++ b/support/testing/conf/f2fs-kernel-fragment.config
> @@ -0,0 +1,5 @@
> +CONFIG_F2FS_FS=y
> +CONFIG_F2FS_STAT_FS=y
> +CONFIG_F2FS_FS_XATTR=y
> +CONFIG_F2FS_FS_POSIX_ACL=y
> +CONFIG_F2FS_FS_SECURITY=y
> diff --git a/support/testing/tests/fs/test_f2fs.py b/support/testing/tests/fs/test_f2fs.py
> new file mode 100644
> index 0000000000..f95d6dae07
> --- /dev/null
> +++ b/support/testing/tests/fs/test_f2fs.py
> @@ -0,0 +1,49 @@
> +import os
> +import subprocess
> +
> +import infra.basetest
> +
> +def dumpf2fs_getprop(out, prop):
> +    for line in out:
> +        fields = line.split(" = ")
> +        if fields[0] == prop:
> +            return fields[1].strip()
> +
> +class TestF4FS(infra.basetest.BRTest):

TestF4FS ? :-)

I've fixed this typo, and applied. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
