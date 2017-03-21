From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Mar 2017 22:41:52 +0100
Subject: [Buildroot] [PATCH] graph-depends: rename pkgutil.py to
	brpkgutil.py
In-Reply-To: <20170321082233.14868-1-yegorslists@googlemail.com>
References: <20170321082233.14868-1-yegorslists@googlemail.com>
Message-ID: <4a06b76e-9a47-1637-0854-e108dca7e22f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-03-17 09:22, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> pkgutil.py is also part of Python itself. Placing pkgutil.py as is
> in a folder with other scripts that require original pkgutil will
> break them. This is the case with scanpypi. So rename pkgutil.py
> to brpkgutil.py to avoid naming collision.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=9766
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  support/scripts/{pkgutil.py => brpkgutil.py} | 0
>  support/scripts/graph-depends                | 8 ++++----
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename support/scripts/{pkgutil.py => brpkgutil.py} (100%)
> 
> diff --git a/support/scripts/pkgutil.py b/support/scripts/brpkgutil.py
> similarity index 100%
> rename from support/scripts/pkgutil.py
> rename to support/scripts/brpkgutil.py
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index fbd591705..b258c565b 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -26,7 +26,7 @@ import subprocess
>  import argparse
>  from fnmatch import fnmatch
>  
> -import pkgutil
> +import brpkgutil
>  
>  # Modes of operation:
>  MODE_FULL = 1   # draw full dependency graph for all selected packages
> @@ -102,13 +102,13 @@ else:
>  transitive = args.transitive
>  
>  if args.direct:
> -    get_depends_func = pkgutil.get_depends
> +    get_depends_func = brpkgutil.get_depends
>      arrow_dir = "forward"
>  else:
>      if mode == MODE_FULL:
>          sys.stderr.write("--reverse needs a package\n")
>          sys.exit(1)
> -    get_depends_func = pkgutil.get_rdepends
> +    get_depends_func = brpkgutil.get_rdepends
>      arrow_dir = "back"
>  
>  # Get the colours: we need exactly three colours,
> @@ -330,7 +330,7 @@ if check_only:
>      sys.exit(0)
>  
>  dict_deps = remove_extra_deps(dict_deps)
> -dict_version = pkgutil.get_version([pkg for pkg in allpkgs
> +dict_version = brpkgutil.get_version([pkg for pkg in allpkgs
>                                  if pkg != "all" and not pkg.startswith("root")])
>  
>  # Print the attributes of a node: label and fill-color
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
