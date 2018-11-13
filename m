From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 13 Nov 2018 19:26:29 +0100
Subject: [Buildroot] [PATCH v3 2/3] test-pkg: Use the correct config
 prefix when merging
In-Reply-To: <20181113134404.32235-3-afshin.nasser@gmail.com>
References: <20181105083554.GC4485@x230>
 <20181113134404.32235-1-afshin.nasser@gmail.com>
 <20181113134404.32235-3-afshin.nasser@gmail.com>
Message-ID: <20181113182628.GA16657@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nasser,

> From: Nasser Afshin <Afshin.Nasser@gmail.com>

> We should use an empty prefix as we do not have any prefix.
> Note that BR2_ is mere a convention.

> Signed-off-by: Nasser Afshin <Afshin.Nasser@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  utils/test-pkg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/utils/test-pkg b/utils/test-pkg
> index aa91ee02cf..7bf1c97fba 100755
> --- a/utils/test-pkg
> +++ b/utils/test-pkg
> @@ -129,7 +129,7 @@ build_one() {

>      mkdir -p "${dir}"

> -    support/kconfig/merge_config.sh -O "${dir}" \
> +    CONFIG_="" support/kconfig/merge_config.sh -O "${dir}" \
Please, can you omit "" (not needed):
CONFIG_= support/kconfig/merge_config.sh -O "${dir}" \


Kind regards,
Petr
