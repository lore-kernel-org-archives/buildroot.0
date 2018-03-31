From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 23:22:20 +0200
Subject: [Buildroot] [PATCH v2 2/5] support/scripts/graph-depends: use
 colors instead of colours
In-Reply-To: <20180331163543.6278-3-thomas.petazzoni@bootlin.com>
References: <20180331163543.6278-1-thomas.petazzoni@bootlin.com>
 <20180331163543.6278-3-thomas.petazzoni@bootlin.com>
Message-ID: <20180331212220.GR25161@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-03-31 18:35 +0200, Thomas Petazzoni spake thusly:
> The graph-depends was not very consistent in colors vs. colours: some
> parts were using colours, some parts were using colors.
> 
> Let's settle on the US spelling, colors.

I would have gone with the superior, historical, better, cleaner, nicer,
and correct englih spelling instead... ;-]

> This change the user-visble option --colours to --colors, but it is
> unlikely that a lot of users customize the colors through
> BR2_GRAPH_DEPS_OPTS, so this user interface change is considered
> reasonable.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/common-usage.txt  |  4 ++--
>  support/scripts/graph-depends | 16 ++++++++--------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
> index a22da20188..e3d7578c85 100644
> --- a/docs/manual/common-usage.txt
> +++ b/docs/manual/common-usage.txt
> @@ -224,12 +224,12 @@ The +graph-depends+ behaviour can be controlled by setting options in the
>  * +--transitive+, +--no-transitive+, to draw (or not) the transitive
>    dependencies. The default is to not draw transitive dependencies.
>  
> -* +--colours R,T,H+, the comma-separated list of colours to draw the
> +* +--colors R,T,H+, the comma-separated list of colors to draw the
>    root package (+R+), the target packages (+T+) and the host packages
>    (+H+). Defaults to: +lightblue,grey,gainsboro+
>  
>  --------------------------------
> -BR2_GRAPH_DEPS_OPTS='-d 3 --no-transitive --colours=red,green,blue' make graph-depends
> +BR2_GRAPH_DEPS_OPTS='-d 3 --no-transitive --colors=red,green,blue' make graph-depends
>  --------------------------------
>  
>  === Graphing the build duration
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index d86d506f6f..dc265ae28c 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -297,9 +297,9 @@ def parse_args():
>                          "'host' to stop on host packages.")
>      parser.add_argument("--exclude", "-x", metavar="PACKAGE", dest="exclude_list", action="append",
>                          help="Like --stop-on, but do not add PACKAGE to the graph.")
> -    parser.add_argument("--colours", "-c", metavar="COLOR_LIST", dest="colours",
> +    parser.add_argument("--colors", "-c", metavar="COLOR_LIST", dest="colors",
>                          default="lightblue,grey,gainsboro",
> -                        help="Comma-separated list of the three colours to use" +
> +                        help="Comma-separated list of the three colors to use" +
>                          " to draw the top-level package, the target" +
>                          " packages, and the host packages, in this order." +
>                          " Defaults to: 'lightblue,grey,gainsboro'")
> @@ -353,12 +353,12 @@ def main():
>          get_depends_func = brpkgutil.get_rdepends
>          arrow_dir = "back"
>  
> -    # Get the colours: we need exactly three colours,
> +    # Get the colors: we need exactly three colors,
>      # so no need not split more than 4
> -    # We'll let 'dot' validate the colours...
> -    colours = args.colours.split(',', 4)
> -    if len(colours) != 3:
> -        sys.stderr.write("Error: incorrect colour list '%s'\n" % args.colours)
> +    # We'll let 'dot' validate the colors...
> +    colors = args.colors.split(',', 4)
> +    if len(colors) != 3:
> +        sys.stderr.write("Error: incorrect color list '%s'\n" % args.colors)
>          sys.exit(1)
>  
>      # In full mode, start with the result of get_targets() to get the main
> @@ -403,7 +403,7 @@ def main():
>      outfile.write("digraph G {\n")
>  
>      print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
> -                   arrow_dir, 0, args.depth, rootpkg, colours)
> +                   arrow_dir, 0, args.depth, rootpkg, colors)
>  
>      outfile.write("}\n")
>  
> -- 
> 2.14.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
