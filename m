From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 23:48:36 +0200
Subject: [Buildroot] [PATCH for-next] package/optee-benchmark: fix gcc
 10 warning
In-Reply-To: <20200530171428.562778-1-romain.naour@gmail.com>
References: <20200530171428.562778-1-romain.naour@gmail.com>
Message-ID: <20200606234836.30c72356@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 May 2020 19:14:28 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> The function yaml_mapping_start_event_initialize()
> take yaml_mapping_style_t style as last argument:
> 
> int yaml_mapping_start_event_initialize(
>     yaml_event_t *event,
>     const yaml_char_t *anchor,
>     const yaml_char_t *tag,
>     int implicit,
>     yaml_mapping_style_t style)
> 
> Use YAML_ANY_MAPPING_STYLE instead of YAML_ANY_SEQUENCE_STYLE
> 
> Fixes:
> main.c:173:5: error: implicit conversion from ?enum yaml_sequence_style_e? to ?yaml_mapping_style_t? {aka ?enum yaml_mapping_style_e?} [-Werror=enum-conversion]
>   173 |     YAML_ANY_SEQUENCE_STYLE))
>       |     ^~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>  .../optee-benchmark/0001-main-fix-typo.patch  | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 package/optee-benchmark/0001-main-fix-typo.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
