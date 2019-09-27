From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 22:27:10 +0200
Subject: [Buildroot] [PATCH] package/gcc: backport fix for xtensa PR
 91880
In-Reply-To: <20190926213153.8222-1-jcmvbkbc@gmail.com>
References: <20190926213153.8222-1-jcmvbkbc@gmail.com>
Message-ID: <20190927222710.406f8f83@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Sep 2019 14:31:53 -0700
Max Filippov <jcmvbkbc@gmail.com> wrote:

> Xtensa hwloop_optimize segfaults when zero overhead loop is about to be
> inserted as the first instruction of the function.
> Insert zero overhead loop instruction into new basic block before the
> loop when basic block that precedes the loop is empty.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  .../7.4.0/1003-xtensa-fix-PR-target-91880.patch    | 49 ++++++++++++++++++++++
>  .../8.3.0/0002-xtensa-fix-PR-target-91880.patch    | 49 ++++++++++++++++++++++
>  .../9.2.0/0002-xtensa-fix-PR-target-91880.patch    | 49 ++++++++++++++++++++++
>  3 files changed, 147 insertions(+)
>  create mode 100644 package/gcc/7.4.0/1003-xtensa-fix-PR-target-91880.patch
>  create mode 100644 package/gcc/8.3.0/0002-xtensa-fix-PR-target-91880.patch
>  create mode 100644 package/gcc/9.2.0/0002-xtensa-fix-PR-target-91880.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
