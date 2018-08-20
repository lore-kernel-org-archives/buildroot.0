From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 20:23:26 +0200
Subject: [Buildroot] [PATCH 3/3] oracle-mysql: check for my.cnf before
 starting
In-Reply-To: <20180820111304.22933-4-chrismcc@gmail.com>
References: <20180820111304.22933-1-chrismcc@gmail.com>
 <20180820111304.22933-4-chrismcc@gmail.com>
Message-ID: <20180820202326.26a15a07@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 04:13:04 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/oracle-mysql/S97mysqld | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/oracle-mysql/S97mysqld b/package/oracle-mysql/S97mysqld
> index 110ca2cd12..9777ff7775 100644
> --- a/package/oracle-mysql/S97mysqld
> +++ b/package/oracle-mysql/S97mysqld
> @@ -3,6 +3,7 @@
>  MYSQL_DIR="/var/mysql"
>  MYSQL_USER="mysql"
>  
> +[ -r /etc/my.cnf ] || exit 0

Actually my preference is to fail hard if the configuration file
doesn't exist. I don't like those errors that are silently ignored, and
I've been lobbying to drop those test from our init scripts, and I
think most of the core contributors agreed with that.

If an /etc/my.cnf is mandatory for mysqld to start, then I would
suggest that we install an example/minimal /etc/my.cnf so that the
mysqld server starts properly in an out of the box Buildroot
installation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
