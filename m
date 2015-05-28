From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Wed, 27 May 2015 22:42:33 -0500
Subject: [Buildroot] [PATCH v4 2015.08 4/4] docs/manual: add section
 about size graphing
In-Reply-To: <1432591007-27689-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1432591007-27689-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1432591007-27689-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CALq67GAd8AL8tK58zNeR=6F8qm-4+1mNR=fDj_O0dxihkrBAoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, May 25, 2015 at 4:56 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Other than the a few minor suggestions below, things look good.

Reviewed-by: Ryan Barnett <ryanbarnett3@gmail.com>
Tested-by: Ryan Barnett <ryanbarnett3@gmail.com>

> ---
>  docs/manual/common-usage.txt | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
> index 5b27b1f..c7a14ce 100644
> --- a/docs/manual/common-usage.txt
> +++ b/docs/manual/common-usage.txt
> @@ -273,6 +273,45 @@ only other format supported is PNG:
>  BR2_GRAPH_OUT=png make graph-build
>  ----------------
>
> +=== Graphing the filesystem size contribution of packages
> +
> +When your target system grows, it is sometimes useful to understand
> +how much each Buildroot package is contributing to the overall root
> +filesystem size. To help with such an analysis, Buildroot collects
> +some data about which package installs which file, and can generate

Minor nit: the sentence doesn't sound right to me. Maybe reword to this:

data about the files each package install and generates

> +graphs and CSVs files with the relevant data.
> +
> +To generate these data after a build, run:
> +
> +----------------
> +make size-stats
> +----------------
> +
> +This will generate:
> +
> +* +output/graphs/graph-size+, a pie chart of the contribution of each
> +  package to the overall root filesystem size
> +
> +* +output/build/package-size-stats.csv+, a CSV file giving the size
> +  contribution of each package to the overall root filesystem size
> +
> +* +output/build/file-size-stats.csv+, a CSV file giving the size
> +  contribution of each installed file to the package it belongs, and
> +  to the overall filesystem size.
> +
> +This +size-stats+ target requires the Python Matplotlib library to be
> +installed (+python-matplotlib+ on most distributions), and also the
> ++argpase+ module if you're using a Python version older than 2.7
> +(+python-argparse+ on most distributions).
> +
> +Just like for the duration graph, a +BR2_GRAPH_OUT+ environment is
> +supported to adjust the output file format.

Add a link to the section describing BR2_GRAPH_OUT?

Thanks,
-Ryan

> +
> +.Note
> +The collected filesystem size data is only meaningful after a complete
> +clean rebuild. Be sure to run +make clean all+ before using +make
> +size-stats+.
> +
>  include::eclipse-integration.txt[]
>
>  include::advanced.txt[]
