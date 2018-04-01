From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 19:58:22 +0200
Subject: [Buildroot] [PATCH v3 1/9] testing/infra/builder: call make
 with empty env
In-Reply-To: <20171029140608.26200-2-ricardo.martincoski@datacom.ind.br>
References: <20171029140608.26200-1-ricardo.martincoski@datacom.ind.br>
 <20171029140608.26200-2-ricardo.martincoski@datacom.ind.br>
Message-ID: <20180401195822.17cd970f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 12:06:00 -0200, Ricardo Martincoski wrote:
> From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> 
> Use an empty environment when calling make, but import PATH so the
> buildroot tree under test can find libraries from the host machine.
> 
> Since environment variables are now ignored, move the handling of
> BR2_DL_DIR to the defconfig to keep the current precedence of -d:
> 
>     BR2_DL_DIR  | -d DIR   | test downloads   | BR downloads
>     ------------+----------+------------------+--------------
>     unset       | unset    | [error]          | [error]
>     unset       | set      | in $(DIR)        | in $(DIR)
>     set         | unset    | in $(BR2_DL_DIR) | in $(BR2_DL_DIR)
>     set         | set      | in $(DIR)        | in $(DIR)
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> Changes v2 -> v3:
>   - new patch
>   - search for "start with an empty environment" in
>     http://patchwork.ozlabs.org/patch/806159/
> ---
>  support/testing/infra/basetest.py | 1 +
>  support/testing/infra/builder.py  | 7 +++++--
>  support/testing/run-tests         | 1 -
>  3 files changed, 6 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
