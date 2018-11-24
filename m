From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 10:12:20 +0100
Subject: [Buildroot] [PATCH v3 3/3] merge_config.sh: Avoid false
 positive matches from comment lines
In-Reply-To: <20181114071156.10453-4-afshin.nasser@gmail.com>
References: <20181114071156.10453-1-afshin.nasser@gmail.com>
 <20181114071156.10453-4-afshin.nasser@gmail.com>
Message-ID: <20181124101220.572bfe0d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Nov 2018 10:41:56 +0330, Nasser Afshin wrote:
> From: Nasser Afshin <Afshin.Nasser@gmail.com>
> 
> We are using empty CONFIG_PREFIX_. This results in false positive match
> for comment lines when merging config fragments.
> 
> To avoid false positive reports, we use separate sed expressions and
> address comment lines explicitly.
> 
> This is actually is in the Linux kernel mainline (v4.20-rc2):
> 6bbe4385d035c6fac56f840a59861a0310ce137b
> ("kconfig: merge_config: avoid false positive matches from comment lines")
> 
> Signed-off-by: Nasser Afshin <Afshin.Nasser@gmail.com>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  support/kconfig/merge_config.sh                    |  7 +++--
>  ...false-positive-matches-from-comment-lines.patch | 32 ++++++++++++++++++++++
>  support/kconfig/patches/series                     |  1 +
>  3 files changed, 37 insertions(+), 3 deletions(-)
>  create mode 100644 support/kconfig/patches/21-Avoid-false-positive-matches-from-comment-lines.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
