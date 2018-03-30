From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 00:23:50 -0300
Subject: [Buildroot] [PATCH v3 1/5] support/scripts/pkg-stats-new:
 rewrite in Python
References: <20180323205455.24789-2-thomas.petazzoni@bootlin.com>
Message-ID: <5abdadc6a4fa5_40bd2ad1bc8490dc189a8@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Mar 23, 2018 at 05:54 PM, Thomas Petazzoni wrote:

> This commit adds a new version of the pkg-stats script, rewritten in
> Python. It is for now implemented in a separate file called,
> pkg-stats-new, in order to make the diff easily readable. A future
> commit will rename it to pkg-stats.
> 
> Compared to the existing shell-based pkg-stats script, the
> functionality and output is basically the same. The main difference is
> that the output no longer goes to stdout, but to the file passed as
> argument using the -o option. This allows stdout to be used for more
> debugging related information.
> 

> The way the script works is that a first function get_pkglist()
> creates a dict associating package names with an instance of a
> Package() object, containing basic information about the package. Then
> a number of other functions (add_infra_info, add_pkg_make_info,
> add_hash_info, add_patch_count, add_check_package_warnings) will
> calculate additional information about packages, and fill in fields in
> the Package objects.

This is not accurate anymore for v3.
The info from make printvars is now gathered as the second step.
The functions were moved to methods of the object and got renamed.

> 
> calculate_stats() then calculates global statistics (how packages have
> license information, how packages have a hash file, etc.). Finally,
> dump_html() produces the HTML output, using a number of sub-functions.
> 
> One improvement over the shell-based version is that we can use
> regexps to exclude some .mk files. Thanks to this, we can exclude all
> linux-ext-*.mk files, avoiding incorrect matches.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

[With the commit log updated to describe v3, please add]
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>


Regards,
Ricardo
