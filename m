From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 15:28:27 +0100
Subject: [Buildroot] [PATCH 3/7 v3] conf: add a sample run-time
 configuration file
In-Reply-To: <591c08819a0c2a46abbf4ab8219c3ad582487da3.1448663846.git.yann.morin.1998@free.fr>
References: <cover.1448663846.git.yann.morin.1998@free.fr>
 <591c08819a0c2a46abbf4ab8219c3ad582487da3.1448663846.git.yann.morin.1998@free.fr>
Message-ID: <20151128152827.77680210@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri, 27 Nov 2015 23:39:10 +0100, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  conf/buildroot-autobuild.sample | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 conf/buildroot-autobuild.sample
> 
> diff --git a/conf/buildroot-autobuild.sample b/conf/buildroot-autobuild.sample
> new file mode 100644
> index 0000000..dcb74b1
> --- /dev/null
> +++ b/conf/buildroot-autobuild.sample
> @@ -0,0 +1,5 @@
> +[main]
> +ninstances = 4
> +njobs = 4
> +nice = 20

From man nice(1):

   Niceness values range  from  -20 (most favorable to the process) to
   19 (least favorable to the process).

So I've changed your example nice value from 20 to 19, and then applied
to buildroot-test.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
