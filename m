From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sun, 23 Feb 2020 15:40:56 +0100
Subject: [Buildroot] [PATCH v3 06/12] support/scripts/pkg-stats: add
 package count to stats
In-Reply-To: <20200222085715.23769-7-heiko.thiery@gmail.com>
References: <20200222085715.23769-1-heiko.thiery@gmail.com>
 <20200222085715.23769-7-heiko.thiery@gmail.com>
Message-ID: <00aac7d9-ab5c-e92b-3188-132f32de86d0@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, all,

On 2/22/20 9:57 AM, Heiko Thiery wrote:
> Signed-off-by: Heiko Thiery <heiko.thiery at gmail.

Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
Tested-by: Titouan Christophe <titouan.christophe@railnova.eu>

> ---
>   support/scripts/pkg-stats | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 7c8cc81cf2..90afcc2332 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -544,6 +544,7 @@ def check_package_cves(nvd_path, packages):
>   
>   def calculate_stats(packages):
>       stats = defaultdict(int)
> +    stats['packages'] = len(packages)
>       for pkg in packages:
>           # If packages have multiple infra, take the first one. For the
>           # vast majority of packages, the target and host infra are the
> 
