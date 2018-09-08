From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 23:37:56 +0200
Subject: [Buildroot] [PATCH v2 2/3] dependencies: host-make version check
In-Reply-To: <20180903191933.26080-2-romain.naour@gmail.com>
References: <20180903191933.26080-1-romain.naour@gmail.com>
 <20180903191933.26080-2-romain.naour@gmail.com>
Message-ID: <20180908233756.26120c8d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Sep 2018 21:19:32 +0200, Romain Naour wrote:

> +major=`echo "$version" | cut -d. -f1`
> +minor=`echo "$version" | cut -d. -f2`
> +bugfix=`echo "$version" | cut -d. -f3`
> +
> +if [ -z "${bugfix}" ] ; then
> +	bugfix=0
> +fi

bugfix is not used anywhere, so I dropped this variable, and applied
the patch to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
