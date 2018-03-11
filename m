From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Mar 2018 09:57:36 +0100
Subject: [Buildroot] [PATCH v2 2/7] size-stats-compare: fix code style
In-Reply-To: <1520745334-13411-3-git-send-email-ricardo.martincoski@gmail.com>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
 <1520745334-13411-3-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20180311085736.GC2429@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-03-11 02:15 -0300, Ricardo Martincoski spake thusly:
> Fix these warnings:
> E129 visually indented line with same indent as next logical line
> E302 expected 2 blank lines, found 1
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
> Changes v1 -> v2:  (suggested by Thomas Petazzoni)
>   - the fix for E129 made the code less readable, use another fix.
> ---
>  utils/size-stats-compare | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/size-stats-compare b/utils/size-stats-compare
> index e5a1ec3..a3d7f25 100755
> --- a/utils/size-stats-compare
> +++ b/utils/size-stats-compare
> @@ -24,14 +24,15 @@ import csv
>  import argparse
>  import sys
>  
> +
>  def read_file_size_csv(inputf, detail=None):
>      """Extract package or file sizes from CSV file into size dictionary"""
>      sizes = {}
>      reader = csv.reader(inputf)
>  
>      header = next(reader)
> -    if (header[0] != 'File name' or header[1] != 'Package name' or
> -        header[2] != 'File size' or header[3] != 'Package size'):
> +    if header[0] != 'File name' or header[1] != 'Package name' or \
> +       header[2] != 'File size' or header[3] != 'Package size':
>          print(("Input file %s does not contain the expected header. Are you "
>                 "sure this file corresponds to the file-size-stats.csv "
>                 "file created by 'make graph-size'?") % inputf.name)
> @@ -45,6 +46,7 @@ def read_file_size_csv(inputf, detail=None):
>  
>      return sizes
>  
> +
>  def compare_sizes(old, new):
>      """Return delta/added/removed dictionaries based on two input size
>      dictionaries"""
> @@ -64,6 +66,7 @@ def compare_sizes(old, new):
>  
>      return delta
>  
> +
>  def print_results(result, threshold):
>      """Print the given result dictionary sorted by size, ignoring any entries
>      below or equal to threshold"""
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
