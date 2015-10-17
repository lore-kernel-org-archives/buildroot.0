From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2015 16:09:45 +0200
Subject: [Buildroot] [PATCHv6 4/4] docs/manual: add section about size
	graphing
In-Reply-To: <1445088825-19300-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1445088825-19300-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1445088825-19300-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151017140945.GC3717@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-10-17 15:33 +0200, Thomas Petazzoni spake thusly:
> Document the new graph-size target and its possibilities.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/common-usage.txt | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
> index 5b27b1f..3ae05c7 100644
> --- a/docs/manual/common-usage.txt
> +++ b/docs/manual/common-usage.txt
> @@ -273,6 +273,47 @@ only other format supported is PNG:
>  BR2_GRAPH_OUT=png make graph-build
>  ----------------
>  
> +=== Graphing the filesystem size contribution of packages
> +
> +When your target system grows, it is sometimes useful to understand
> +how much each Buildroot package is contributing to the overall root
> +filesystem size. To help with such an analysis, Buildroot collects
> +data about files installed by each package and using this data,
> +generates a graph and CSVs files detailing the size contribution of
> +the different packages.
> +
> +To generate these data after a build, run:
> +
> +----------------
> +make graph-size
> +----------------
> +
> +This will generate:
> +
> +* +output/graphs/graph-size.pdf+, a pie chart of the contribution of
> +  each package to the overall root filesystem size
> +
> +* +output/graphs/package-size-stats.csv+, a CSV file giving the size
> +  contribution of each package to the overall root filesystem size
> +
> +* +output/graphs/file-size-stats.csv+, a CSV file giving the size
> +  contribution of each installed file to the package it belongs, and
> +  to the overall filesystem size.
> +
> +This +size-stats+ target requires the Python Matplotlib library to be
> +installed (+python-matplotlib+ on most distributions), and also the
> ++argpase+ module if you're using a Python version older than 2.7
> +(+python-argparse+ on most distributions).
> +
> +Just like for the duration graph, a +BR2_GRAPH_OUT+ environment is
> +supported to adjust the output file format. See xref:graph-depends[]
> +for details about this environment variable.
> +
> +.Note
> +The collected filesystem size data is only meaningful after a complete
> +clean rebuild. Be sure to run +make clean all+ before using +make
> +size-stats+.
> +
>  include::eclipse-integration.txt[]
>  
>  include::advanced.txt[]
> -- 
> 2.6.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
