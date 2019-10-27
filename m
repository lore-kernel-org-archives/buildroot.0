From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 19:23:14 +0100
Subject: [Buildroot] [PATCH] package/php: support
 --with-config-file-scan-dir
In-Reply-To: <1558225183-10288-1-git-send-email-danwalkes@trellis-logic.com>
References: <1558225183-10288-1-git-send-email-danwalkes@trellis-logic.com>
Message-ID: <20191027192314.22b5909e@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dan,

Thanks for your contribution!

On Sat, 18 May 2019 18:19:42 -0600
Dan Walkes <danwalkes@trellis-logic.com> wrote:

> To support using multiple php configuration files, allow
> setting of a config file scan director via menuconfig.
> 
> For php option details see link at [1].
> 
> [1] https://www.php.net/manual/en/configuration.file.php
> 
> Signed-off-by: Dan Walkes <danwalkes@trellis-logic.com>
> ---
>  package/php/Config.in | 5 +++++
>  package/php/php.mk    | 4 ++++
>  2 files changed, 9 insertions(+)

Sorry for the very slow feedback. It turned out that we don't really
see the need to make this configurable, so we simply added an
unconditional --with-config-file-scan-dir=/etc/php.d in PHP_CONF_OPTS.

See:

  https://git.buildroot.org/buildroot/commit/?id=1248b86267ceb545a2dd249c0067ad8cdf49636a

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
