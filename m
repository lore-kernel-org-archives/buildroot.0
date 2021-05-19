From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 10:31:42 +0200
Subject: [Buildroot] [PATCH v2 1/3] support/scripts/pkg-stats: verified
 CPE has a known id but not version
In-Reply-To: <20210519024638.63607-1-matthew.weber@collins.com>
References: <20210519024638.63607-1-matthew.weber@collins.com>
Message-ID: <20210519083142.GG2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2021-05-18 21:46 -0500, Matthew Weber via buildroot spake thusly:
> Currently a verified CPE reports the following if versions are not found
>  cpe:2.3:a:qemu:qemu:5.2.0:*:*:*:*:*:*:*
>  CPE identifier unknown in CPE database (Search)
> 
> This patch clarifies the report to state the 'version' is unknown instead
> of the 'identifier'.
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Matthew Weber <matthew.weber@collins.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2
>  - New
> ---
>  support/scripts/pkg-stats | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 0cd3674c52..42c36f7f94 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -610,7 +610,7 @@ def check_package_cpes(nvd_path, packages):
>          if cpedb.find(p.cpeid):
>              p.status['cpe'] = ("ok", "verified CPE identifier")
>          else:
> -            p.status['cpe'] = ("error", "CPE identifier unknown in CPE database")
> +            p.status['cpe'] = ("error", "CPE version unknown in CPE database")
>  
>  
>  def calculate_stats(packages):
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
