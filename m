From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 May 2014 23:00:46 +0200
Subject: [Buildroot] [PATCH 2/8] graphs: add option to remove transitive
 dependencies in dependency graph
In-Reply-To: <ef77e0e21954654789a2af7f86ccea4ec6b4d5ce.1400273945.git.yann.morin.1998@free.fr>
References: <cover.1400273945.git.yann.morin.1998@free.fr>
 <ef77e0e21954654789a2af7f86ccea4ec6b4d5ce.1400273945.git.yann.morin.1998@free.fr>
Message-ID: <20140530210046.GF3474@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-05-16 23:05 +0200, Yann E. MORIN spake thusly:
[--SNIP--]
> Add a new environment variable to disable drawing transitive dependencies.
[--SNIP--]
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index e2a5e1e..4ad18b4 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -40,6 +40,10 @@ parser.add_argument("--package", '-p', metavar="PACKAGE",
>                      help="Graph the dependencies of PACKAGE")
>  parser.add_argument("--depth", '-d', metavar="DEPTH",
>                      help="Limit the dependency graph to DEPTH levels")
> +parser.add_argument("--transitive", dest="transitive", action='store_true')
> +parser.add_argument("--no-transitive", dest="transitive", action='store_false',
> +                    default=True,
> +                    help="Draw (do not draw) transitive dependencies")

Bummer, this changes the default to not draw transitive deps. Fixed
locally, so the default is still to draw them.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
