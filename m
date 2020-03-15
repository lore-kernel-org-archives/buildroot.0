From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 23:27:32 +0100
Subject: [Buildroot] [PATCH v2] package/coreutils: bump to v8.32
In-Reply-To: <20200310145656.4000-1-joaomarcos.costa@bootlin.com>
References: <20200310145656.4000-1-joaomarcos.costa@bootlin.com>
Message-ID: <20200315232732.3b594ae7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joao Marcos,

Thanks for your patch. There is one small issue though, see below.

On Tue, 10 Mar 2020 15:56:56 +0100
Joao Marcos Costa <joaomarcos.costa@bootlin.com> wrote:

> diff --git a/package/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch b/package/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch
> new file mode 100644
> index 0000000000..ae74641b79
> --- /dev/null
> +++ b/package/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch
> @@ -0,0 +1,117 @@
> +From 10fcb97bd728f09d4a027eddf8ad2900f0819b0a Mon Sep 17 00:00:00 2001
> +From: Paul Eggert <eggert@cs.ucla.edu>
> +Date: Thu, 5 Mar 2020 17:25:29 -0800
> +Subject: [PATCH] ls: restore 8.31 behavior on removed directories
> +
> +* NEWS: Mention this.
> +* src/ls.c: Do not include <sys/sycall.h>
> +(print_dir): Don't worry about whether the directory is removed.
> +* tests/ls/removed-directory.sh: Adjust to match new (i.e., old)
> +behavior.

We need you to add your Signed-off-by into the patch you have
backported from upstream, here.

> +---
> + NEWS                          |  6 ++++++
> + src/ls.c                      | 22 ----------------------
> + tests/ls/removed-directory.sh | 10 ++--------
> + 3 files changed, 8 insertions(+), 30 deletions(-)

Could you send an updated version with this issue fixed? Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
