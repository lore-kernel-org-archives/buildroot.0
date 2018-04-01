From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Apr 2018 22:24:29 +0200
Subject: [Buildroot] [PATCH 2/2] support/scripts/graph-depends: add
 --quiet option
In-Reply-To: <20180401191449.802-2-peter@korsgaard.com>
References: <20180401191449.802-1-peter@korsgaard.com>
 <20180401191449.802-2-peter@korsgaard.com>
Message-ID: <20180401202429.GP2613@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-04-01 21:14 +0200, Peter Korsgaard spake thusly:
> This will be useful for the upcoming recursive show-depends and
> show-rdepends features.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/scripts/graph-depends | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index 17bfaa0cf5..4ec0e46f7b 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -312,6 +312,8 @@ def parse_args():
>                          help="Draw direct dependencies (the default)")
>      parser.add_argument("--reverse", dest="direct", action='store_false',
>                          help="Draw reverse dependencies")
> +    parser.add_argument("--quiet", '-q', dest="quiet", action='store_true',
> +                        help="Quiet")
>      return parser.parse_args()
>  
>  
> @@ -321,7 +323,7 @@ def main():
>      check_only = args.check_only
>  
>      logging.basicConfig(stream=sys.stderr, format='%(message)s',
> -                        level=logging.INFO)
> +                        level=logging.WARNING if args.quiet else logging.INFO)
>  
>      if args.outfile is None:
>          outfile = sys.stdout
> -- 
> 2.11.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
