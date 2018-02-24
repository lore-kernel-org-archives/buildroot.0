From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 24 Feb 2018 01:54:27 -0300
Subject: [Buildroot] [PATCH next v2 2/5] support/scripts/pkg-stats-new:
 add -n and -p options
References: <20180221221342.15683-3-thomas.petazzoni@bootlin.com>
Message-ID: <5a90f003e116f_4611fdab2450876@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Feb 21, 2018 at 07:13 PM, Thomas Petazzoni wrote:

> This commit adds the following options to the pkg-stats-new script:
> 
>  -n, to specify a number of packages to parse instead of all packages
> 
>  -p, to specify a list of packages (comma-separated) to parse instead
>      of all packages
> 
> These options are basically only useful when debugging/developping

typo:                                                    developing

> this script, but they are very useful, because the script is rather
> slow to run completely with all 2000+ packages, especially once
> upstream versions will be fetched from release-monitoring.org.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

With the typo fixed and regardless your decision about the help below:
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

[snip]
> @@ -452,13 +462,24 @@ def parse_args():
>      parser = argparse.ArgumentParser()
>      parser.add_argument('-o', dest='output', action='store', required=True,
>                          help='HTML output file')
> +    parser.add_argument('-n', dest='npackages', type=int, action='store',
> +                        help='Number of packages')
> +    parser.add_argument('-p', dest='packages', action='store',
> +                        help='List of packages')

Should the help also mention the option expects a comma-separated list?

Regards,
Ricardo
