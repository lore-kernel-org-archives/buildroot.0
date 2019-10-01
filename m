From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Oct 2019 20:05:51 +0200
Subject: [Buildroot] [PATCH] support/graph-depends: cut on host-ccache
In-Reply-To: <20191001163458.25296-1-francois.perrad@gadz.org>
References: <20191001163458.25296-1-francois.perrad@gadz.org>
Message-ID: <20191001180551.GG10860@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2019-10-01 18:34 +0200, Francois Perrad spake thusly:
> When selected, host-ccache is a dependency of almost all packages.
> As such, it clutters the dependency graph uselessly.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

(Note that this makes the line even longer, and flake8 warns, but that
was already the case before, so who cares...)

Regards,
Yann E. MORIN.

> ---
>  support/scripts/graph-depends | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index 3de09b1209..d42bebce9d 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -115,7 +115,7 @@ def remove_transitive_deps(pkg, deps):
>  
>  # List of dependencies that all/many packages have, and that we want
>  # to trim when generating the dependency graph.
> -MANDATORY_DEPS = ['toolchain', 'skeleton', 'host-skeleton', 'host-tar', 'host-gzip']
> +MANDATORY_DEPS = ['toolchain', 'skeleton', 'host-skeleton', 'host-tar', 'host-gzip', 'host-ccache']
>  
>  
>  # This function removes the dependency on some 'mandatory' package, like the
> -- 
> 2.20.1
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
