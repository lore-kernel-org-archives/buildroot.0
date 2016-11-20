From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 20 Nov 2016 03:18:38 -0200
Subject: [Buildroot] [PATCH] core/br2-external: restore compatibility
 with old distros
References: <564d.5830d7d7.de49@xdna.net>
Message-ID: <5831322ee6fea_72b63f84f6441d9856270@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cam,

Those first lines of the commit message should be placed after the line with
'---', because 'git am' would automatically remove them.
There is also a duplicated SoB.
No need to resend because of these, it can be manually fixed when applying.

I didn't review the code, I only tested it.

On Sat, Nov 19, 2016 at 08:53 PM, Cam Hutchison wrote:

> Hi Yann,
> 
> Since eval is kind of icky, how about something like this patch instead?
> 
> 
> Currently, the br2-external script uses bash-4's associative arrays.
> 
> However, some oldish enterprise-class distros like RHEL5 still use
> bash-3.1 which lacks associative arrays.
> 
> Remove the arrays by reading the external.desc files as we generate the
> output file.
> 
> Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Signed-off-by: "Cam Hutchison" <camh@xdna.net>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Cam Hutchison <camh@xdna.net>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Simple tests using CentOS 5, bash 3.2.25:
1. make defconfig (in-tree build configuration);
2. created 2 small br2-external with a package and a defconfig each and
   successfully configured out-of-tree build with multiple br2-external
   using both defconfigs and downloaded the sources of both packages.]

Regards,
Ricardo
